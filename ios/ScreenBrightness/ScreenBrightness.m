//
//  ScreenBrightness.m
//  ScreenBrightness
//
//  Created by Atticus White on 12/7/15.
//  Copyright © 2015 Atticus White. All rights reserved.
//

#import "ScreenBrightness.h"

@implementation ScreenBrightness

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(getBrightness:(RCTPromiseResolveBlock)resolve
                  getScreenBrightnessRejector:(RCTPromiseRejectBlock)reject) {
    
    float brightness = [[UIScreen mainScreen] brightness];
    resolve(@(brightness));
}

RCT_REMAP_METHOD(setBrightness,
                 brightnessLevel:(CGFloat)brightnessLevel
                 setSystemBrightnessResolver:(RCTPromiseResolveBlock)resolve
                 setSystemBrightnessRejector:(RCTPromiseRejectBlock)reject) {
    if (![NSThread isMainThread]) {
           dispatch_async(dispatch_get_main_queue(), ^{
               [[UIScreen mainScreen] setBrightness:brightnessLevel];
           });
           return;
       }
    [[UIScreen mainScreen] setBrightness:brightnessLevel];
    resolve(@(brightnessLevel));
}


@end
