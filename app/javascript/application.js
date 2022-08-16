// Entry point for the build script in your package.json
import Rails from "@rails/ujs"
Rails.start()
import jquery from 'jquery'
window.$ = jquery
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
window.bootstrap = bootstrap

import "channels"

