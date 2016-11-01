//
//  ViewController.m
//  WKWebViewDemo
//
//  Created by haohao on 16/10/13.
//  Copyright © 2016年 qiandai. All rights reserved.
//

#import "ViewController.h"
#import "WKWebViewVC.h"

static NSString* reqURL = @"http://192.168.208.156/testWKWeb.html";

@interface ViewController ()<WKWebDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)jumpToWKWebAction {
    WKWebViewVC* wk = [[WKWebViewVC alloc]init];
    wk.loadLocalHtmlFile = @"testWKWeb";
    wk.loadURL = reqURL;
    //注册js 中的方法
    NSMutableArray* arr = [NSMutableArray arrayWithArray:@[@"loginAction",@"closeCurrPage"]];    
    wk.jsFunName = arr;
    wk.wkWebDelegate = self;
    [self presentViewController:wk animated:YES completion:nil];
    
}

#pragma mark - wkWebDelegate
#pragma mark
//客户端和js交互使用(网页点击按钮时触发客户端注册的按钮事件)
-(void)getJSInfoWithJSFunctionName:(NSString *)jsFunctionName andJsReqData:(NSMutableDictionary *)reqDict{
    if([jsFunctionName isEqualToString:@"loginAction"]){
        NSString* name = reqDict[@"userName"];
        NSString* pwd = reqDict[@"userPwd"];
        NSString* msg = [NSString stringWithFormat:@"用户输入的账号是：%@，密码是：%@",name,pwd];
        if ([name isEqualToString:@"1"] && [pwd isEqualToString:@"1"]) {
            // 登录成功
            UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"测试(登录成功)" message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
        }else{
            // 登录失败
            UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"测试(登录失败)" message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
        }
    }else if([jsFunctionName isEqualToString:@"closeCurrPage"]){
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

/** 确认弹窗 */
-(void)getWebConfirmContent:(BOOL)webConfirmResult{
    NSString* msg = @"";
    if (webConfirmResult) {
        msg = @"点击了确定";
    }else{
        msg = @"点击了取消";
    }
    UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"提示" message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}

/** 带文本框的弹窗 */
-(void)getWebPromptContent:(NSString *)webPromptContent{
    UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"提示" message:[NSString stringWithFormat:@"文本框输入的内容是:%@",webPromptContent] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}
@end
