var exec = require("cordova/exec");
var PLUGIN_NAME = "MaterialDialogs";

module.exports = {
    setButtons: function(buttons, clickCallback, error) {
        exec(clickCallback, error, PLUGIN_NAME, "setButtons", [buttons]);

        return this;
    },
    show: function(message, title, success, error) {
        exec(success, error, PLUGIN_NAME, "show", [message, title]);
    }
};