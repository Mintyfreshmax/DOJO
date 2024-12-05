import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["searchBar", "datePicker", "overlay"];

  connect() {
    this.overlayedTarget.classList.add("hidden");
  }

  expand() {
    this.searchBarTarget.classList.add("expanded");
    // this.datePickerTarget.classList.remove("d-none");
    this.overlayTarget.classList.remove("hidden");
  }

  collapse() {
    this.searchBarTarget.classList.remove("expanded");
    // this.datePickerTarget.classList.add("d-none");
    this.overlayTarget.classList.add("hidden");
  }
}
