//
//  IATViewController.h
//  HiCtrip
//
//  Created by culnoty on 25/03/2017.
//  Copyright © 2017 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iflyMSC/iflyMSC.h"

@interface IATViewController :
UIViewController<IFlySpeechRecognizerDelegate>
@property (nonatomic, strong) IFlySpeechRecognizer *iFlySpeechRecognizer;
@property (nonatomic, strong) NSString * result;

+(void)start;
-(void)begin;
-(void)stop;
-(void)initRecognizer;
-(void)cancel;
@end
