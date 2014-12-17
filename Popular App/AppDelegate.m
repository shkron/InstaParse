//
//  AppDelegate.m
//  Popular App
//
//  Created by May Yang on 11/17/14.
//  Copyright (c) 2014 May Yang. All rights reserved.
//

#import "AppDelegate.h"
@import Parse;

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [Parse setApplicationId:@"awDeahaf3QmRiVGkF0k2IJ2r0gaY1qZoHY1H99HX"
                  clientKey:@"gKMzXN4Zl6EdgwAomaSTd6Cosnmtu00RzoBfJxA3"];

    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:185.0/255.0 green:237.0/255.0 blue:239.0/255.0 alpha:0.0]];

//    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1)
//    {
//        [[UINavigationBar appearance] setTintColor: [UIColor colorWithRed:59/255.0 green:171/255.0 blue:184/255.0 alpha:1.0]];
//    }
//    else
//    {
//        [[UINavigationBar appearance] setBarTintColor: [UIColor colorWithRed:59/255.0 green:171/255.0 blue:184/255.0 alpha:1.0]];
//    }
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
