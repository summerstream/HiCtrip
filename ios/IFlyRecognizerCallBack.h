//
//  IFlyRecognizerCallBack.h
//  HiCtrip
//
//  Created by culnoty on 25/03/2017.
//  Copyright © 2017 Facebook. All rights reserved.
//

#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>
//#import "IATViewController.h"

//@interface IFlyRecognizerCallBack : RCTEventEmitter <RCTBridgeModule>
@interface IFlyRecognizerCallBack : RCTEventEmitter
+ (instancetype)sharedInstanceTool;
- (void)resultReceived:(NSString*)params;
//@private IATViewController *deck;
@end
