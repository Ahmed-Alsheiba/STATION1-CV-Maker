import { Controller } from "@hotwired/stimulus"

// Generic add/remove for nested form rows.
//
//   <div data-controller="nested-form">
//     <div data-nested-form-target="rows"> ...existing rows... </div>
//     <template data-nested-form-target="template"> ...one blank row (child_index "NEW_RECORD")... </template>
//     <button data-action="nested-form#add">Add</button>
//   </div>
//
// Each row is wrapped in [data-nested-form-row] and contains a hidden _destroy field.
export default class extends Controller {
  static targets = ["template", "rows"]

  add(event) {
    event.preventDefault()
    const html = this.templateTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime().toString())
    this.rowsTarget.insertAdjacentHTML("beforeend", html)
  }

  remove(event) {
    event.preventDefault()
    const row = event.target.closest("[data-nested-form-row]")
    if (!row) return

    const idField = row.querySelector("input[name*='[id]']")
    if (idField && idField.value) {
      // Persisted record: flag for deletion and hide it.
      const destroyField = row.querySelector("input[name*='[_destroy]']")
      if (destroyField) destroyField.value = "1"
      row.style.display = "none"
    } else {
      // Brand-new row: just drop it from the DOM.
      row.remove()
    }
  }
}
