var exec = require("cordova/exec");
var PLUGIN_NAME = "MaterialDialogs";

function MaterialDialog(message, title) {
    this.message = message;
    this.title = title;
    this.actions = ["OK"];
}

MaterialDialog.prototype = {
    setActions: function() {
        if (arguments.length) {
            this.actions = Array.prototype.slice.call(arguments);
        }

        return this;
    },
    show: function(callback) {
        exec(success, error, PLUGIN_NAME, "show", [this]);

        return this;
    }
};

module.exports = {
    create: function(message, title) {
        return new MaterialDialog(message, title);
    }
};
