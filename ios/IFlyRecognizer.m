//
//  IFlyRecognizer.m
//  HiCtrip
//
//  Created by culnoty on 24/03/2017.
//  Copyright © 2017 Facebook. All rights reserved.
//

#import "IFlyRecognizer.h"
#import <React/RCTLog.h>

@implementation IFlyRecognizer

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(addEvent:(NSString *)name location:(NSString *)location)
{
  RCTLogInfo(@"Pretending to create an event %@ at %@", name, location);
}

@end
