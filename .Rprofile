#------------------------------------------------------------
#                  |R Global Setting|
#
# You can (un)comment any code you dislike.
#   Any Question, please email to
#       Shixiang Wang <w_shixiang@163.com>
#   or file an issue to
#       <https://github.com/ShixiangWang/MessageBoard/issues>
#------------------------------------------------------------
# Global options ----------------------------------------------------------
options(encoding = "UTF-8") # Set file encoding
options(vsc.rstudioapi = TRUE)
options(vsc.viewer = "Beside")
#Sys.setenv("LANGUAGE" = "en") # Set language of R message


# Package download mirrors ------------------------------------------------
## For Bioconductor packages
options(BioC_mirror = "https://mirrors.ustc.edu.cn/bioc/")
## For CRAN packages
## Full list see mirrors on <https://cran.r-project.org/>
options("repos" = c(CRAN = "https://mirror.lzu.edu.cn/CRAN/"))

# Set local custom R library path -----------------------------------------
.CUSTOM_LIB <- "~/Library/R" # Set your custom library location
# Please do not add '/' at the end !!!

if (!dir.exists(.CUSTOM_LIB)) {
  dir.create(.CUSTOM_LIB, recursive = TRUE)
}

.libPaths(c(.CUSTOM_LIB, .libPaths()))
message("Hi Dr. Chen, Welcome to R, and have a nice day!")
message("Using library: ", .libPaths()[1])

if (interactive()) {
  suppressMessages(require(devtools))
}

source("newpost.R")
