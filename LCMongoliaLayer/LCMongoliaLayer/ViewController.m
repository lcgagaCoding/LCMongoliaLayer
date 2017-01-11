//
//  ViewController.m
//  LCMongoliaLayer
//
//  Created by 刘成 on 17/1/9.
//  Copyright © 2017年 刘成. All rights reserved.
//

#import "ViewController.h"
#import "LCMongoliaLayerView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(0, 0, 100, 50);
    button.center = self.view.center;
    [button setTitle:@"show" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}
- (void)btnClick:(UIButton *)button{
    
    CGFloat wrule = kWIDTH/750.0;

    NSString *frame1 = NSStringFromCGRect(CGRectMake(kWIDTH/2.0-336*wrule, 10+FH(button), 285*wrule, 66*wrule));
    NSString *frame2 = NSStringFromCGRect(CGRectMake(kWIDTH/2.0-214*wrule, 10+FH(button)+78*wrule, 138*wrule, 72*wrule));
    
    NSArray *images = @[@"home_mc_signIn.png",@"home_mc_signIn_next.png"];
    NSArray *frames = @[frame1,frame2];
    
    
    LCMongoliaLayerView *lcView = [[LCMongoliaLayerView alloc]initWithFrame:CGRectMake(0, 0, kWIDTH, kHEIGHT)];
    [lcView showMongoliaLayerWithMaskFrame:button.frame cornerRadius:10 ImageNames:images imageFrames:frames buttonIndex:1 shortVersion:nil tapClick:YES bgClickBlock:^{
        NSLog(@"点击了背景!");
    } btnClickBlock:^{
        NSLog(@"点击了下一步!");
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
