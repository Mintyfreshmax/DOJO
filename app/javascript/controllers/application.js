import { Application } from "@hotwired/stimulus"
import "../functions/toggle_text";

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
