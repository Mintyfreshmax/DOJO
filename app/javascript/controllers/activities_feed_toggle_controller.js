import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="activities-feed-toggle"
export default class extends Controller {
  static targets = ["activities", "feed"];

  connect() {
    console.log("Activities and Feed toggle controller connected!");
  }

  showActivities(event) {
    this.toggleActiveButton(event.target);
    this.activitiesTarget.classList.remove("d-none");
    this.feedTarget.classList.add("d-none");
  }

  showFeed(event) {
    this.toggleActiveButton(event.target);
    this.feedTarget.classList.remove("d-none");
    this.activitiesTarget.classList.add("d-none");
  }

  toggleActiveButton(target) {
    const buttons = target.closest("#club-activities-feed-buttons").querySelectorAll(".activities-title-index");
    buttons.forEach((button) => button.classList.remove("active"));
    target.classList.add("active");
  }
}