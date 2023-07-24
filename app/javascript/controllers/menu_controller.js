import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="removals"
export default class extends Controller {
  static targets = [ "content" ]
  static values = { visible: Boolean }
  
  off() {
    this.visibleValue = false;
  }

  toggleMenu(event) {
    event.preventDefault()
    if (!this.visibleValue) {
      this.contentTarget.classList.remove("hidden");
    } else {
      this.contentTarget.classList.add("hidden");
    }
    this.visibleValue = !this.visibleValue;
  }
}
