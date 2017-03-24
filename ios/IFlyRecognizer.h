//
//  IFlyRecognizer.h
//  HiCtrip
//
//  Created by culnoty on 24/03/2017.
//  Copyright © 2017 Facebook. All rights reserved.
//

#import <React/RCTBridgeModule.h>
#import "IATViewController.h"

@interface IFlyRecognizer : NSObject <RCTBridgeModule>{
  @private IATViewController *deck;
}
@end
