// app/javascript/toggle_text.js
function toggleText() {
  var moreText = document.getElementById("more-text");
  var btnText = document.getElementById("learn-more-btn");

  if (moreText.style.display === "none") {
    moreText.style.display = "inline";
    btnText.textContent = "Show Less";
  } else {
    moreText.style.display = "none";
    btnText.textContent = "Learn More";
  }
}

// Ensure the function is available globally
window.toggleText = toggleText;
