import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="removals"
export default class extends Controller {
  static targets = [ "menu" ]
  static values = { open: Boolean }
  
  toggleMenu(event) {
    event.preventDefault()
    if (this.openValue) {
      this.menuTarget.classList.remove("hidden");
    } else {
      this.menuTarget.classList.add("hidden");
    }
    this.openValue = !this.openValue
  }
}
