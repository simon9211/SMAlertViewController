//
//  SMAlertViewControllerManager.m
//  SMAlertViewController
//
//  Created by xiwang wang on 2017/6/9.
//  Copyright © 2017年 xiwang wang. All rights reserved.
//

#import "SMAlertControllerManager.h"
#import "SMAlertController.h"

NSString *const SMAlertActionCancleTitle = @"取消";
NSString *const SMAlertActionConfirmTitle = @"确定";

@interface SMAlertControllerManager()

@property (nonatomic, copy) NSString *cancelTitle;

@property (nonatomic, copy) NSString *confirmTitle;

@property (nonatomic, assign) SEL cancelAction;

@property (nonatomic, assign) SEL confirmAction;

@end

@implementation SMAlertControllerManager

+ (SMAlertControllerManager *)sharedManager{
    static dispatch_once_t once;
    static SMAlertControllerManager *manager;
    dispatch_once(&once, ^{
        manager = [[SMAlertControllerManager alloc] init];
    });
    return manager;
}

+ (void)showAlertViewInController:(UIViewController *)ctrl title:(NSString *)title message:(NSString *)message confirmAction:(SEL)confirmAction{
    
    [self showAlertViewInController:ctrl title:title message:message cancelTitle:[SMAlertControllerManager sharedManager].cancelTitle?[SMAlertControllerManager sharedManager].cancelTitle:SMAlertActionCancleTitle confirmTitle:[SMAlertControllerManager sharedManager].confirmTitle?[SMAlertControllerManager sharedManager].confirmTitle:SMAlertActionConfirmTitle cancelAction:[SMAlertControllerManager sharedManager].cancelAction?[SMAlertControllerManager sharedManager].cancelAction:nil confirmAction:confirmAction hasDestructive:NO];
}

+ (void)showAlertViewInController:(UIViewController *)ctrl title:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancelTitle confirmTitle:(NSString *)confirmTitle cancelAction:(SEL)cancelAction confirmAction:(SEL)confirmAction hasDestructive:(BOOL)hasDestructive{
    
    SMAlertController *alertCtrl = [SMAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    SMWeak(ctrl);
    
    //add cancel
    SMAlertAction *canAction = [SMAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [self executeSelWithFunc:weak_ctrl action:cancelAction];
    }];
    [alertCtrl addAction:canAction];
    
    //add confirm
    SMAlertAction *conAction = [SMAlertAction actionWithTitle:confirmTitle style:hasDestructive?UIAlertActionStyleDestructive:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self executeSelWithFunc:weak_ctrl action:confirmAction];
    }];
    [alertCtrl addAction:conAction];
    [ctrl presentViewController:alertCtrl animated:YES completion:nil];
}

+ (void)setCancelTitle:(NSString *)cancelTitle{
    if (cancelTitle != nil && ![cancelTitle isEqualToString:@""]) {
        [self sharedManager].cancelTitle = cancelTitle;
    }
}

+ (void)setCancelAction:(SEL)cancelAction{
    if (cancelAction) {
        [self sharedManager].cancelAction = cancelAction;
    }
}

+ (void)setConfirmTitle:(NSString *)confirmTitle{
    if (confirmTitle != nil && ![confirmTitle isEqualToString:@""]) {
        [self sharedManager].cancelTitle = confirmTitle;
    }
}

+ (void)setConfirmAction:(SEL)confirmAction{
    if (confirmAction) {
        [self sharedManager].confirmAction = confirmAction;
    }
}

/**
 执行SEL

 @param object 执行对象
 @param action sel 方法
 */
+ (void)executeSelWithFunc:(NSObject *)object action:(SEL)action {
    if (!action || !object) {
        return;
    }
    IMP imp = [object methodForSelector:action];
    void (*func)(id,SEL) = (void *)imp;
    func(object,action);
}

@end
