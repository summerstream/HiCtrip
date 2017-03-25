//
//  IFlyRecognizer.m
//  HiCtrip
//
//  Created by culnoty on 24/03/2017.
//  Copyright © 2017 Facebook. All rights reserved.
//

#import "IFlyRecognizer.h"
#import <React/RCTLog.h>
#import "IATViewController.h"
#import "IATViewController.h"

@implementation IFlyRecognizer

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(addEvent:(NSString *)name location:(NSString *)location)
{
  RCTLogInfo(@"RCT_EXPORT_METHOD---Pretending to create an event %@ at %@", name, location);
//  IATViewController *deck = [[IATViewController alloc] init];
//  [deck begin];

}

RCT_EXPORT_METHOD(create)
{
  RCTLogInfo(@"RCT_EXPORT_METHOD---create" );
  deck = [IATViewController alloc] ;
  [deck initRecognizer];
  
}

RCT_EXPORT_METHOD(begin)
{
  RCTLogInfo(@"RCT_EXPORT_METHOD---begin" );
//  IATViewController *deck = [IATViewController alloc] ;
  [deck begin];
  
}

RCT_EXPORT_METHOD(stop)
{
  //  IATViewController *deck = [IATViewController alloc] ;
  [deck stop];
//  [deck cancel];
  RCTLogInfo(@"RCT_EXPORT_METHOD---stop " );

}

RCT_EXPORT_METHOD(findEvents:(RCTResponseSenderBlock)callback)
{
//  NSArray *events = ...
//  callback(@[[NSNull null], events]);
}

@end
