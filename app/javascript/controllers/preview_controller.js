import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "content", 'zone' ]

  connect() {
    this.imageClass = this.data.get('class') || 'avatar'
  }

  showImage(event) {
    let input = event.target
    let output = this.contentTarget
    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = () => {
        let img = `<img src='${reader.result}' class='${this.imageClass}' />`
        this.contentTarget.innerHTML = img;
      }
      reader.readAsDataURL(input.files[0]);

      if(this.hasZoneTarget) {
        this.zoneTarget.classList.add('hidden')
      }
    }
  }
}