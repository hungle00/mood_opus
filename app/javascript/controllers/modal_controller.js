import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal"]

  connect() {
    this.backgroundHtml = this._backgroundHtml();
    document.body.insertAdjacentHTML('beforeend', this.backgroundHtml);
  }

  hideModal() {
    this.element.parentElement.removeAttribute("src")
    this.element.remove();
    document.body.removeChild(document.body.lastElementChild)
  }

  submitEnd(e) {
    if (e.detail.success) {
      this.hideModal()
    }
  }

  closeOutside(e) {
    if(e && this.modalTarget == e.target) {
      this.hideModal()
    }
  }

  _backgroundHtml() {
    return `<div class="fixed top-0 left-0 w-full h-full" style="background-color: rgba(0, 0, 0, 0.8); z-index: 98;"></div>`;
  }
}
