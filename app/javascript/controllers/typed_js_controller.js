import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"
// Connects to data-controller="typed-js"
export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["Change the way you see movies.", "Anytime.", "Anywhere."],
      typeSpeed: 60,
      loop: true
    });
  }
}
