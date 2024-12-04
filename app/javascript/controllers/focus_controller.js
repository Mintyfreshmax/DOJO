import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="focus"
export default class extends Controller {
  static targets = ["input", "indicator", "heading"];
  connect() {
    this.positionIndicatorNextToHeading();
  }

  positionIndicatorNextToHeading() {
    const rect = this.headingTarget.getBoundingClientRect();
    this.indicatorTarget.style.top = `${rect.top + window.scrollY -5}px`;
    this.indicatorTarget.style.left = `${rect.right + 10}px`;
  }

  updateIndicatorPosition() {
    const focusedElement = document.activeElement;
    if (this.inputTargets.includes(focusedElement)) {
      const rect = focusedElement.getBoundingClientRect();
      this.indicatorTarget.style.top = `${rect.top + window.scrollY}px`;
      this.indicatorTarget.style.left = `${rect.right + 10}px`;

    }
  }
  focus() {
    this.updateIndicatorPosition();

  }
}
