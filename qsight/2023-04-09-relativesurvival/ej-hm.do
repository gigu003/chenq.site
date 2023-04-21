set more off

* This program to run needs:
	* A Stata dataset file with abridged (up to 80, 85 or 95 years) raw number of deaths and pop
	* A Stata dataset file with all ages (var x) from 0 to 100, this file is called "complete" here
	* A Stata dataset on which the parameters of the linear interpolation are stored, the file is called "coeff1-74"

* And the following do-files
	* create_abridged_m which creates from raw pop and death figures, all LT components (mx lx ex...)
	


/************************************************/
/*	MAIN PROGRAM: ELANDT JOHNSON			*/
/************************************************/



cap program drop ej
program define ej

while "`1'" != "" {


*************************************************
*	PART 1: PREPARATION OF DATA			*
*************************************************

****Already done for you****

*** Merge with a table that has complete ages (up to 100)
*sort x
*merge x using "complete.dta"
*drop _merge

*fillin x sex quint
*drop if sex==. | quint==. 
*drop _fillin

*** Merge with coeff used for ages 1-10
*preserve
*	use "N:\SURVIVAL\Bernard\Life tables\Results\coeff1-74.dta", clear
*	sort x
*	save "N:\SURVIVAL\Bernard\Life tables\Results\coeff1-74.dta", replace
*restore

*sort x
*merge x using "N:\SURVIVAL\Bernard\Life tables\Results\coeff1-74.dta"
*drop if _merge==2
*drop _merge cm*

*** Merge with coeff used for ages 11-74
* create a variable that gets only the last digit of the year of age:
* take the last digit if x>10
*preserve
*	use "N:\SURVIVAL\Bernard\Life tables\Results\coeff1-74.dta", clear
*	sort x2
*	save "N:\SURVIVAL\Bernard\Life tables\Results\coeff1-74.dta", replace
*restore

*replace x2 = x-int(x/10)*10 if 75>x & x>10
*sort x2
*merge x2 using "N:\SURVIVAL\Bernard\Life tables\Results\coeff1-74.dta"
*drop _merge

*************************************************
*	PART 2: AGE 1 TO 10				*
*************************************************

cap rename age x
cap rename age2 x2


*** calculate lx for age 1 to 10
sort  site  year sex x
bysort  site  year sex : gen clx = c1*lx[2] + c5*lx[6] + c10*lx[11] + c15*lx[16] + c20*lx[21] + c25*lx[26]
replace clx=clx[_n-1] if clx>clx[_n-1] & clx!=.

tempvar nrow
qui bysort site year sex : gen `nrow'=_n-1
assert `nrow' == x

*************************************************
*	PART 3: AGE 11 TO 74				*
*************************************************


*** variable x2: values 1 to 4 to apply formulae on ages 11 to 74
replace x2 = x2 - 5 if x2>5
recode x2 0 5=.

gen clx2=lx 
sort site year sex x

local p 11
forval k = 0(5)60 {
  forval m = 1(1)4 {
	sort site year sex  x
	bysort site year sex : replace clx2 = cm1*lx[1+`k'] + cm2*lx[6+`k'] + cm3*lx[11+`k'] ///
		+ cm4*lx[16+`k'] + cm5*lx[21+`k'] + cm6*lx[26+`k'] if x==`p' & x2!=.
	replace clx2=clx2[_n-1] if clx2[_n]>clx2[_n-1] & clx2!=.
	if `m' == 4 {
	  local p=`p'+2
	}
	else {
	  local p=`p'+1
	}
  }
}

*************************************************
*	PART 4: AGE 75 ONWARD				*
*************************************************

*** If the data are abridged up to the age of 85+ then run the following bit
*******************************
* Gompertz bit now after the age of 75(we start from age 65 to have info (S) for the older ages )

sort site year sex x
bysort site year sex : gen y = log10(lx[_n]/lx[_n+5]) if lx!=.
bysort site year sex  : gen c = (y[_n]/y[_n+5])^(-1/5) if lx!=.
bysort site year sex : gen logb = y/(c^x * ((c^5) -1)) if lx!=.
bysort site year sex  : gen b = 10^logb
gen S=.
gen clx3=lx 

sum x if lx!=.
local omega r(max)

*take the last digit if x>10
gen x3 = x-int(x/10)*10 if 75<x   
replace x3 = x3 - 5 if x3>5
recode x3 0 5=.

local p 75
forval k = 76(5)81 {
* before age 75 we use lx at 65 and 70
    forval m = 1(1)5 {
	sort site year sex x
	bysort site year sex : replace S = b[`k'] ^ (1- c[`k']^`p') if x==`p'
	bysort site year sex : replace clx3 = lx[`k'] * S[`p'+1]/S[`k'] if x==`p' & x3!=. 
	replace clx3=clx3[_n-1] if clx3[_n]>clx3[_n-1] & clx3!=. & x>0 
      local p=`p'+1
    }
}
* after age 80 til age 99 we always use lx at age 75
local p 81
    forval l = 1(1)21 {
	 sort site year sex x
	 bysort site year sex  : replace S = b[76] ^ (1- c[76]^`p') if x==`p'
       bysort site year sex  : replace clx3 = lx[76] * S[`p'+1]/S[76] if x==`p' & x!=85 
	 local p=`p'+1
}

*************************************************
*	PART 5: COMBINATION				*
*************************************************

* we now put all calculated lx in same variable.

*** If the data are abridged up to the age of 85+ or 95+ then run the following bit
	bysort site year sex : replace clx = 1 if x==0
	bysort site year sex : replace clx = clx2 if x>10 & x<76
	bysort site year sex  : replace clx = clx3 if x>75
	bysort site year sex  : replace clx=clx[_n-1] if clx[_n]>clx[_n-1] &  x[_n-1]!=100
	
	rename clx fitlx
	rename x age
	keep sex age year population deaths lx qx mx dx Lx Tx ex fitlx site
	* save "CompleteLT.dta", replace


mac shift
}
end

ej "Hi"
