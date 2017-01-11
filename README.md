# LCMongoliaLayer
一些蒙层的展示,集成简单,下一步及取消时有回调

/*
 maskFrame:遮罩部分frame
 
 cornerRadius:遮罩部分圆角
 
 imageNames:蒙层上的图片名字,请与frame对应
 
 imageFrames:图片frame,请与imageNames对应
 
 buttonIndex:按钮位于图片数组中的下标
 
 shortVersion:版本号,蒙层要与版本号关联时传入,如1.0,不传则为nil
 
 tapClick:背景能否点击消失
 
 bgClickBlock:背景点击事件回调
 
 btnClickBlock:按钮点击事件回调
 
 */
 
 
 使用方法:
 #import "LCMongoliaLayerView.h"
 
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

