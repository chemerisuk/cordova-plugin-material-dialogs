#import "MaterialDialogs.h"
#import "MaterialDialogsPlugin.h"

@implementation MaterialDialogsPlugin

- (void)show:(CDVInvokedUrlCommand *)command {
    NSDictionary* options = [command argumentAtIndex:0];
    NSArray* actions = options[@"actions"];

    MDCAlertController *alertController =
        [MDCAlertController alertControllerWithTitle:options[@"title"]
                                             message:options[@"message"]];

    NSArray* reversedActions = [[actions reverseObjectEnumerator] allObjects];
    void (^actionHandler)() = ^(MDCAlertAction *action) {
        int actionIndex = [reversedActions indexOfObject:action.title] + 1;
        CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:actionIndex];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    };

    int count = [reversedActions count];
    for (int i = 0; i < count; i++) {
       [alertController addAction:[MDCAlertAction
            actionWithTitle:reversedActions[i] handler:actionHandler]];
    }

    [self.viewController presentViewController:alertController animated:YES completion:NULL];
}

@end