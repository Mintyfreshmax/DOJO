import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["moreText", "button"];
  connect() {
    console.log("coucou")
  }

  toggle() {
    if (this.moreTextTarget.style.display === "none") {
      this.moreTextTarget.style.display = "inline";
      this.buttonTarget.textContent = "Show Less";
    } else {
      this.moreTextTarget.style.display = "none";
      this.buttonTarget.textContent = "Learn More";
    }
  }
}
