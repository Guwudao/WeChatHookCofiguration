//  weibo: http://weibo.com/xiaoqing28
//  blog:  http://www.alonemonkey.com
//
//  WeChatHookDylib.m
//  WeChatHookDylib
//
//  Created by Jackie on 2018/9/15.
//  Copyright (c) 2018年 Jackie. All rights reserved.
//

#import "WeChatHookDylib.h"
#import <CaptainHook/CaptainHook.h>
#import <UIKit/UIKit.h>
#import <Cycript/Cycript.h>

static __attribute__((constructor)) void entry(){
    NSLog(@"\n               🎉!!！congratulations!!！🎉\n👍----------------insert dylib success----------------👍");
    
    [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidFinishLaunchingNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        
#ifndef __OPTIMIZE__
        CYListenServer(6666);
#endif
        
    }];
}

CHDeclareClass(ManualAuthAesReqData)
CHOptimizedMethod1(self, void, ManualAuthAesReqData, setBundleId, NSString*, bundleId){
    bundleId = @"com.tencent.xin";
    CHSuper1(ManualAuthAesReqData, setBundleId, bundleId);
}

CHConstructor{
    
    CHLoadLateClass(ManualAuthAesReqData);
    CHClassHook1(ManualAuthAesReqData, setBundleId);
    
}

