// Copyright (c) 2021 Tencent. All rights reserved.

#import "AppDelegate.h"
#import <TCMediaX/TCMediaX.h>

#define LICENCE_URL  @"..."  // License URL
#define LICENCE_KEY  @"..."  // License Key

@interface AppDelegate ()<TCMediaXBaseDelegate>


@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [[TCMediaXBase getInstance] setDelegate:self];
    [[TCMediaXBase getInstance] setLogEnable:YES];
    [[TCMediaXBase getInstance] setLicenceURL:LICENCE_URL key:LICENCE_KEY];
    return YES;
}

#pragma mark - TCMediaXBaseDelegate

- (void)onLicenseCheckCallback:(int)errcode withParam:(NSDictionary *)param {
    NSLog(@"TCMediaXBase setLicense authresult: %d ,errorMsg: %@", errcode, param);
    if (errcode != TMXLicenseCheckOk) {
        // nofity license error
    } else {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"TCEffectPlayerLicenseCheckerSuccess"
                                                            object:nil
                                                          userInfo:nil];

    }

}

#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
