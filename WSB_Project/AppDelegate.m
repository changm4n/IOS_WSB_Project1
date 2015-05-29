//
//  AppDelegate.m
//  WSB_Project
//
//  Created by 이창민 on 2015. 5. 12..
//  Copyright (c) 2015년 changmin. All rights reserved.
//

#import "AppDelegate.h"
#import "SetThemeViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  // Override point for customization after application launch.
  [NSThread sleepForTimeInterval:1];
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen]bounds]];
  [self.window makeKeyAndVisible];
  
  SetThemeViewController * view = [[SetThemeViewController alloc]init];
  UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:view];
  navi.navigationBar.translucent = NO;
  
  CGFloat nRed=253/255.0;
  CGFloat nGreen=248/255.0;
  CGFloat nBlue=225/255.0;
  UIColor *myColor=[UIColor colorWithRed:nRed green:nGreen blue:nBlue alpha:1];
  
  navi.navigationBar.barTintColor = myColor;
  
  
  
  self.window.rootViewController = navi;
  [self.window addSubview:navi.view];
  
  return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
  // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
  // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
  // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
  // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
  // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
