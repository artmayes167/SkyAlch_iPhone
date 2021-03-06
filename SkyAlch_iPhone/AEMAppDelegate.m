//
//  AEMAppDelegate.m
//  SkyAlch_iPhone
//
//  Created by Arthur Mayes on 4/11/12.
//  Copyright (c) 2012 Arthur Mayes. All rights reserved.
//

#import "AEMAppDelegate.h"

@implementation AEMAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSString *defaultPrefsFile = [[NSBundle mainBundle] pathForResource:@"defaultPreferences" ofType:@"plist"];
    NSDictionary *defaultPreferences = [NSDictionary dictionaryWithContentsOfFile:defaultPrefsFile];
    [[NSUserDefaults standardUserDefaults] registerDefaults:defaultPreferences];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{}

- (void)applicationDidEnterBackground:(UIApplication *)application
{}

- (void)applicationWillEnterForeground:(UIApplication *)application
{}

- (void)applicationDidBecomeActive:(UIApplication *)application
{}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [self setWindow:nil];
}

@end
