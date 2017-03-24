//
//  IATViewController.m
//  HiCtrip
//
//  Created by culnoty on 25/03/2017.
//  Copyright © 2017 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "IFlyRecognizer.h"
#import "IATViewController.h"
#import "ISRDataHelper.h"
#import <React/RCTLog.h>

@implementation IATViewController

-(void)initRecognizer
{
  
  _iFlySpeechRecognizer = [IFlySpeechRecognizer sharedInstance];
 
  [_iFlySpeechRecognizer setParameter: @"iat" forKey: [IFlySpeechConstant IFLY_DOMAIN]];
  [_iFlySpeechRecognizer setParameter:@"" forKey:[IFlySpeechConstant ASR_AUDIO_PATH]];
  
  [_iFlySpeechRecognizer setParameter:@"json" forKey:[IFlySpeechConstant RESULT_TYPE]];
  [_iFlySpeechRecognizer setDelegate:self];
//  [_iFlySpeechRecognizer start];
  RCTLogInfo(@"IATViewController has been inited. ");
  
}

//+(void)start
//{
//  [self begin];
//
//}

-(void)begin
{
  if(_iFlySpeechRecognizer == nil){
    [self initRecognizer];
  }
  [_iFlySpeechRecognizer cancel];
  BOOL ret = [_iFlySpeechRecognizer startListening];
  RCTLogInfo(@"begin listening...");
}

-(void)cancel
{
  [_iFlySpeechRecognizer cancel];

}

-(void)onResults:(NSArray *) results isLast:(BOOL)isLast
{
  RCTLogInfo(@"---------callback---------------");
  NSMutableString *resultString = [[NSMutableString alloc] init];
  NSDictionary *dic = results[0];
  for (NSString *key in dic) {
    [resultString appendFormat:@"%@",key];
  }
//  _result =[NSString stringWithFormat:@"%@%@", _textView.text,resultString];
  NSString * resultFromJson =  [ISRDataHelper stringFromJson:resultString];
  RCTLogInfo(@"-------resultFromJson is:%@",resultFromJson);
  if(isLast){
    NSLog(@"听写结果(json)：%@测试",  self.result);
    RCTLogInfo(@"------final string is: %@", resultFromJson);

  }
}

@end
