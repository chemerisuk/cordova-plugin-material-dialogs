var exec = require("cordova/exec");
var PLUGIN_NAME = "MaterialDialogs";

module.exports = {
    addButton: function(caption, clickCallback, error) {
        exec(clickCallback, error, PLUGIN_NAME, "addButton", [caption]);

        return this;
    },
    show: function(message, title, success, error) {
        exec(success, error, PLUGIN_NAME, "show", [message, title]);
    }
};