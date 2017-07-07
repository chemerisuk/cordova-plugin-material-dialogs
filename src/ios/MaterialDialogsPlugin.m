#import "MaterialDialogsPlugin.h"

@implementation MaterialDialogsPlugin

- (void)addButton:(CDVInvokedUrlCommand *)command {
    NSString* label = [command argumentAtIndex:0];

    MDCAlertAction *alertAction =
        [MDCAlertAction actionWithTitle:label
                                handler:^(MDCAlertAction *action) {
            CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        }];

    if (!self.lastActions) {
        self.lastActions = [[NSMutableArray alloc] init];
    }

    [self.lastActions addObject:alertAction];
}

- (void)show:(CDVInvokedUrlCommand *)command {
    NSString* message = [command argumentAtIndex:0];
    NSString* title = [command argumentAtIndex:1];

    MDCAlertController *alertController =
        [MDCAlertController alertControllerWithTitle:title
                                         message:message];

    if (self.lastActions) {
        int count = [self.lastActions count];
        for (int i = 0; i < count; i++) {
           [alertController addAction:self.lastActions[i]];
        }

        self.lastActions = nil;
    } else {
        [alertController addAction:[MDCAlertAction actionWithTitle:@"OK" handler:NULL]];
    }

    [self.viewController presentViewController:alertController animated:YES completion:NULL];
}

@end