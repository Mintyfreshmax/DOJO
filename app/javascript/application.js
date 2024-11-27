// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"
import MapButtonController from "./controllers/map_button.js"
Stimulus.register("map-button", MapButtonController)
