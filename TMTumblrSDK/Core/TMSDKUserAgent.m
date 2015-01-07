//
//  TMSDKUserAgent.m
//  TMTumblrSDK
//
//  Created by Bryan Irace on 12/17/14.
//  Copyright (c) 2014 Tumblr. All rights reserved.
//

#import <Spectacles/TMPodspec.h>
#import "TMSDKUserAgent.h"

@implementation TMSDKUserAgent

+ (NSString *)userAgentHeaderString {
    static NSString *userAgentHeaderString;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        TMPodspec *spec = [[TMPodspec alloc] initWithFileURL:
                           [[NSBundle bundleForClass:[self class]] URLForResource:@"TMTumblrSDK.podspec" withExtension:@"json"]];
        
        userAgentHeaderString = [@"TMTumblrSDK" stringByAppendingPathComponent:spec.version];
    });
    
    return userAgentHeaderString;
}

@end
