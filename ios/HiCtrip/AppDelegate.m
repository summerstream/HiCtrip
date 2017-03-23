/**
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import "AppDelegate.h"

#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>
#import "iflyMSC/IFlyMSC.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  NSURL *jsCodeLocation;

  jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index.ios" fallbackResource:nil];

  RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                      moduleName:@"HiCtrip"
                                               initialProperties:nil
                                                   launchOptions:launchOptions];
  rootView.backgroundColor = [[UIColor alloc] initWithRed:1.0f green:1.0f blue:1.0f alpha:1];

  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  UIViewController *rootViewController = [UIViewController new];
  rootViewController.view = rootView;
  self.window.rootViewController = rootViewController;
  [self.window makeKeyAndVisible];
  
  //    <#  1、在集成讯飞语音SDK前请特别关注下面设置，主要包括日志文件设置、工作路径设置和appid设置。#>
  
  //    <#2、在启动语音服务前必须传入正确的appid。#>
  
  //    <#3、SDK运行过程中产生的音频文件和日志文件等都会保存在设置的工作路径下。#>
  //    <#!!!特别提醒：                                                                #>
  
  //设置sdk的log等级，log保存在下面设置的工作路径中
  [IFlySetting setLogFile:LVL_ALL];
  
  //打开输出在console的log开关
  [IFlySetting showLogcat:YES];
  
  //设置sdk的工作路径3
  NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
  NSString *cachePath = [paths objectAtIndex:0];
  [IFlySetting setLogFilePath:cachePath];
  
  //创建语音配置,appid必须要传入，仅执行一次则可
  NSString *initString = [[NSString alloc] initWithFormat:@"appid=%@",@"58cd3bd5"];
  
  //所有服务启动前，需要确保执行createUtility
  [IFlySpeechUtility createUtility:initString];
  
  return YES;
}

@end
