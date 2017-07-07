#import <Cordova/CDV.h>
#import "MaterialDialogs.h"

@interface MaterialDialogsPlugin : CDVPlugin

- (void)addButton:(CDVInvokedUrlCommand *)command;
- (void)show:(CDVInvokedUrlCommand *)command;

@property(nonatomic) NSMutableArray<MDCAlertAction*> *lastActions;

@end