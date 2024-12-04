import { Controller } from "@hotwired/stimulus"
import Typed from 'typed.js';
// Connects to data-controller="fun"
export default class extends Controller {
  static values = { strings: Array}
  connect() {
  const typed = new Typed(this.element, {
    strings: this.stringsValue,
    typeSpeed: 50,
    backSpeed: 25,
    loop: true
  });
  }
}
