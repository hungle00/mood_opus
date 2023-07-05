import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tabs"
export default class extends Controller {
  static targets = [ "tab", "field" ]
  static values = { index: Number }

  initialize() {
    this.showTab()
  }

  change(event) {
    event.preventDefault()
    this.indexValue = this.tabTargets.indexOf(event.currentTarget)
    this.showTab()
  }

  showTab() {
    this.fieldTargets.forEach((el, index) => {
      index == this.indexValue ? el.classList.remove("hidden") : el.classList.add("hidden")
    })

    this.tabTargets.forEach((el, index) => {
      index == this.indexValue ? el.classList.add("active-tab") : el.classList.remove("active-tab")   
    })
  }
}
