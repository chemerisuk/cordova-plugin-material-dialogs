var exec = require("cordova/exec");
var PLUGIN_NAME = "MaterialDialogs";
var noop = function() {};

function MaterialDialogBuilder(message, title) {
    this.message = message;
    this.title = title;
    this.actions = ["OK"];
}

MaterialDialogBuilder.prototype = {
    setActions: function() {
        if (arguments.length) {
            this.actions = Array.prototype.slice.call(arguments);
        }

        return this;
    },
    show: function(callback) {
        exec(callback, noop, PLUGIN_NAME, "show", [this]);

        return this;
    }
};

module.exports = {
    create: function(message, title) {
        return new MaterialDialogBuilder(message, title);
    }
};
