import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ["activities", "map", "button"]

  hide(event) {
    this.activitiesTarget.classList.toggle("d-none")
    this.mapTarget.classList.toggle("d-none");

    if (this.activitiesTarget.classList.contains("d-none")) {
      this.buttonTarget.textContent = "Activities"
    } else {
      this.buttonTarget.textContent = "Map";
    }
  }
}
