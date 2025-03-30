<script>
  document.getElementById("donate-button").onclick = function () {
    document.getElementById("donation-modal").style.display = "block";
  };

  document.querySelector(".close").onclick = function () {
    document.getElementById("donation-modal").style.display = "none";
  };

  window.onclick = function (event) {
    if (event.target == document.getElementById("donation-modal")) {
      document.getElementById("donation-modal").style.display = "none";
    }
  };
</script>
