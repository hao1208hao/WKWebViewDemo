//
//  WKWebViewVC.h
//  WKWebViewDemo
//
//  Created by haohao on 16/10/13.
//  Copyright © 2016年 qiandai. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WKWebDelegate <NSObject>

@required
/** oc与js 交互 */
-(void)getJSInfoWithJSFunctionName:(NSString*)jsFunctionName andJsReqData:(NSMutableDictionary*)reqDict;

@optional
/** 网页弹窗内容（网页使用alert方法） */
-(void)getWebAlertContent:(NSString*)webAlertContent;

/** 网页确认弹窗内容（网页使用confirm方法） */
-(void)getWebConfirmContent:(BOOL)webConfirmResult;

/** 网页带输入框弹窗（网页使用prompt方法） */
-(void)getWebPromptContent:(NSString*)webPromptContent;

@end

@interface WKWebViewVC : UIViewController

//如果同时传入本地文件路径和url,则加载本地html 文件
/** 加载本地的html */
@property(nonatomic,strong) NSString* loadLocalHtmlFile;
/** 请求加载的地址 */
@property(nonatomic,strong) NSString* loadURL;

/** 弹窗类标题 */
@property(nonatomic,strong) NSString* alertTitle;

/** 需要注册的js方法名称 */
@property(nonatomic,strong) NSMutableArray* jsFunName;

/** 代理 */
@property(nonatomic,assign) id<WKWebDelegate> wkWebDelegate;

@end
