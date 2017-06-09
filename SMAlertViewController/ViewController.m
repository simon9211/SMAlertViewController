//
//  ViewController.m
//  SMAlertViewController
//
//  Created by xiwang wang on 2017/6/9.
//  Copyright © 2017年 xiwang wang. All rights reserved.
//

#import "ViewController.h"
#import "SMAlertControllerManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [SMAlertControllerManager setConfirmTitle:@"aaa"];
    [SMAlertControllerManager setCancelAction:@selector(test222)];
    [SMAlertControllerManager showAlertViewInController:self title:@"laji" message:@"hah" confirmAction:@selector(test)];
}

- (void)test{
    NSLog(@"test111");
}

- (void)test222{
    NSLog(@"test2222");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
