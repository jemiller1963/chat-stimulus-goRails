require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");
require("stylesheets/application.scss");

const images = require.context("../images", true);
const imagePath = (name) => images(name, true);

import "controllers";
import "@fortawesome/fontawesome-free/css/all.css";

require("jquery");
require("packs/notes");
window.Jquery = $;
window.$ = $;
