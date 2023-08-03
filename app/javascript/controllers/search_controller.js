import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = [ "input", "result" ]
  static values = { url: String };

  search(e) {
    e.preventDefault()
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      this.sendRequest()
    }, 200)
  }

  sendRequest() {
    fetch(`${this.urlValue}?query=${this.inputTarget.value}`)
      .then((r) => r.text())
      .then((html) => {
        this.resultTarget.innerHTML = html;
      });
  }
}
