//
//  AppDelegate.m
//  MTGcards
//
//  Created by CCT on 9/8/14.
//  Copyright (c) 2014 CONNOR TINSLEY. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "NavViewController.h"

@implementation AppDelegate

@synthesize navNC;
@synthesize MTGname;
@synthesize rowNum;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];
    
    navNC = [[NavViewController alloc] init];
    self.window.rootViewController = navNC;
    
    [navNC release];
    [self.window release];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{

}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    MTGname = [[NSMutableString alloc] init];
    [MTGname release];    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

@end
