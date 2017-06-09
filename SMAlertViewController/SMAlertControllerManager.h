//
//  SMAlertViewControllerManager.h
//  SMAlertViewController
//
//  Created by xiwang wang on 2017/6/9.
//  Copyright © 2017年 xiwang wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define SMWeak(object) __weak typeof(object)weak##_##object = object

FOUNDATION_EXTERN NSString *const SMAlertActionCancleTitle;
FOUNDATION_EXTERN NSString *const SMAlertActionConfirmTitle;


@interface SMAlertControllerManager : NSObject

/**
 显示提示框
 
 @param ctrl 退出SMAlertController的控制器
 @param title 提示框title
 @param message 提示文本内容
 @param confirmAction 确定触发执行方法
 */
+ (void)showAlertViewInController:(UIViewController *)ctrl title:(NSString *)title message:(NSString *)message confirmAction:(SEL)confirmAction;

/**
 显示提示框

 @param ctrl 退出SMAlertController的控制器
 @param title 提示框title
 @param message 提示文本内容
 @param cancelTitle 取消按钮title
 @param confirmTitle 确定按钮title
 @param cancelAction 取消触发执行方法
 @param confirmAction 确定触发执行方法
 @param hasDestructive 确定按钮标红
 */
+ (void)showAlertViewInController:(UIViewController *)ctrl title:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancelTitle confirmTitle:(NSString *)confirmTitle cancelAction:(SEL)cancelAction confirmAction:(SEL)confirmAction hasDestructive:(BOOL)hasDestructive;

+ (void)setCancelTitle:(NSString *)cancelTitle;
+ (void)setConfirmTitle:(NSString *)confirmTitle;
+ (void)setCancelAction:(SEL)cancelAction;
+ (void)setConfirmAction:(SEL)confirmAction;


@end
