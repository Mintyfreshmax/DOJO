import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["moreText", "button"];

  toggle() {
    if (this.moreTextTarget.style.display === "none") {
      this.moreTextTarget.style.display = "inline";
      this.buttonTarget.innerHTML = "<u>Show Less</u>";
    } else {
      this.moreTextTarget.style.display = "none";
      this.buttonTarget.innerHTML = "<u>Learn More</u>";
    }
  }
}
