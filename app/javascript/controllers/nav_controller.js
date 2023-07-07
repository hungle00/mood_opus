import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="removals"
export default class extends Controller {
  static targets = [ "menu" ]
  static values = { visible: Boolean }
  
  off() {
    this.visibleValue = false;
  }

  toggleMenu(event) {
    event.preventDefault()
    console.log(this.visibleValue)
    console.log(this.menuTarget)
    if (!this.visibleValue) {
      this.menuTarget.classList.remove("hidden");
      console.log(this.menuTarget)
    } else {
      this.menuTarget.classList.add("hidden");
    }
    this.visibleValue = !this.visibleValue;
  }
}
