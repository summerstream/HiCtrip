//
//  IFlyRecognizerCallBack.m
//  HiCtrip
//
//  Created by culnoty on 25/03/2017.
//  Copyright © 2017 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IFlyRecognizerCallBack.h"
#import <React/RCTLog.h>
//#import "IATViewController.h"

@implementation IFlyRecognizerCallBack
{
//  IATViewController *deck;
  bool hasListeners;
}

static id _instance;

//重写allocWithZone:方法，在这里创建唯一的实例(注意线程安全)
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
  @synchronized(self) {
    if (_instance == nil) {
      _instance = [super allocWithZone:zone];
    }
  }
  return _instance;
}

-(id)copyWithZone:(struct _NSZone *)zone{
  return _instance;
}

+ (instancetype)sharedInstanceTool{
  @synchronized(self){
    if(_instance == nil){
      _instance = [[self alloc] init];
    }
  }
  return _instance;
}

-(void)dealloc{
  RCTLogInfo(@"IFlyRecognizerCallBack---has dealloced");
}
RCT_EXPORT_MODULE();

//------init IFly

//RCT_EXPORT_METHOD(create)
//{
//  RCTLogInfo(@"IFlyRecognizer---create" );
//  deck = [IATViewController alloc] ;
//  [deck initRecognizer:self];
//  
//}
//
//RCT_EXPORT_METHOD(begin)
//{
//  RCTLogInfo(@"IFlyRecognizer---begin" );
//  //  IATViewController *deck = [IATViewController alloc] ;
//  [deck begin];
//  
//}
//
//RCT_EXPORT_METHOD(stop)
//{
//  //  IATViewController *deck = [IATViewController alloc] ;
//  [deck stop];
//  //  [deck cancel];
//  RCTLogInfo(@"IFlyRecognizer---stop " );
//  
//}


//------ifly callback

// Will be called when this module's first listener is added.
-(void)startObserving {
  self->hasListeners = YES;
  RCTLogInfo(@"IFlyRecognizerCallBack---startObserving---hasListeners:%s",self->hasListeners?"true":"false");

  // Set up any upstream listeners or background tasks as necessary
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(emitEventInternal:)
                                               name:@"event-emitted"
                                             object:nil];
}

// Will be called when this module's last listener is removed, or on dealloc.
-(void)stopObserving {
  self->hasListeners = NO;
  RCTLogInfo(@"IFlyRecognizerCallBack---stopObserving---hasListeners:%d",self->hasListeners);

  // Remove upstream listeners, stop unnecessary background tasks
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)emitEventInternal:(NSNotification *)notification
{
  [self sendEventWithName:@"SpotifyHelper"
                     body:notification.userInfo];
}

+ (void)emitEventWithName:(NSString *)name andPayload:(NSDictionary *)payload
{
  [[NSNotificationCenter defaultCenter] postNotificationName:@"event-emitted"
                                                      object:self
                                                    userInfo:payload];
}

-(NSArray<NSString *> *)supportedEvents
{
  return @[@"resultReceived"];
}

-(void)resultReceived:(NSString *)result
{
  RCTLogInfo(@"IFlyRecognizerCallBack---resultReceived---result:%@",result);
  RCTLogInfo(@"IFlyRecognizerCallBack---resultReceived---hasListeners:%d",self->hasListeners);
//  if(self->hasListeners){
    [self sendEventWithName:@"resultReceived" body:@{@"message": result}];
    RCTLogInfo(@"IFlyRecognizerCallBack---has sendEventWithName:resultReceived");
//  }
}

@end
