//
//  SMAlertController.h
//  SMAlertViewController
//
//  Created by xiwang wang on 2017/6/9.
//  Copyright © 2017年 xiwang wang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SMAlertViewActionType) {
    SMAlertViewActionNone = 0,
    SMAlertViewActionCancel,
    SMAlertViewActionConfirm
} NS_ENUM_AVAILABLE_IOS(8_0);

@interface SMAlertController : UIAlertController

@end




@interface SMAlertAction : UIAlertAction

@property (nonatomic, assign) SMAlertViewActionType *alertViewActionType;

@end
