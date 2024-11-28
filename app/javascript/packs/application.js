import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";

// Import Stimulus controllers
import "controllers";

Rails.start();
Turbolinks.start();
ActiveStorage.start();
