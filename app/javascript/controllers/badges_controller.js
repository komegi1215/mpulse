import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="badges"
export default class extends Controller {
  connect() {
    console.log("Hello?");
  }

  showfirst(event) {
    // event.preventDefault()
    console.log(event)
  }

  closePopup(event) {
    console.log(event)
    const popupDiv = this.element
    popupDiv.classList.add("d-none")
  }
}
