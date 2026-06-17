import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "image", "placeholder", "removeButton"]

  preview() {
    const file = this.inputTarget.files[0]
    if (!file) return

    const reader = new FileReader()
    reader.onload = () => {
      this.imageTarget.src = reader.result
      this.imageTarget.classList.remove("hidden")
      this.placeholderTarget.classList.add("hidden")
      this.removeButtonTarget.classList.remove("hidden")
    }
    reader.readAsDataURL(file)
  }

  remove(event) {
    event.preventDefault()
    this.inputTarget.value = ""
    this.imageTarget.src = ""
    this.imageTarget.classList.add("hidden")
    this.placeholderTarget.classList.remove("hidden")
    this.removeButtonTarget.classList.add("hidden")
  }
}
