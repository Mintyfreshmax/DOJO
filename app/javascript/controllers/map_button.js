import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ["activities", "map"]

  hide(event) {
    this.activitiesTarget.classList.toggle("d-none")
    this.mapTarget.classList.toggle("d-none");
  }
}
