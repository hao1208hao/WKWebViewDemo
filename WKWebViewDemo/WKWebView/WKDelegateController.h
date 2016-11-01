//
//  WKDelegateController.h
//  WKWebViewDemo
//
//  Created by haohao on 16/10/13.
//  Copyright © 2016年 qiandai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@protocol WKDelegate <NSObject>
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message;
@end


@interface WKDelegateController : UIViewController

@property (weak , nonatomic) id<WKDelegate> delegate;

@end
