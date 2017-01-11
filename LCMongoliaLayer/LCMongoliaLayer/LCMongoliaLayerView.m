//
//  LCMongoliaLayerView.m
//  LCMongoliaLayer
//
//  Created by 刘成 on 17/1/9.
//  Copyright © 2017年 刘成. All rights reserved.
//

#import "LCMongoliaLayerView.h"

@implementation LCMongoliaLayerView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)showMongoliaLayerWithMaskFrame:(CGRect)maskFrame cornerRadius:(CGFloat)cornerRadius ImageNames:(NSArray *)imageNames imageFrames:(NSArray *)imageFrames buttonIndex:(NSInteger)buttonIndex shortVersion:(NSString *)shortVersion tapClick:(BOOL)tapClick bgClickBlock:(BgClickBlock)bgClickBlock btnClickBlock:(BtnClickBlock)btnClickBlock{

    NSString *nowVersion = [self getVersonID];
    if (![nowVersion isEqualToString:shortVersion] && shortVersion.length>0) {
        return;
    }
    
    _bgClickBlock = bgClickBlock;
    _btnClickBlock = btnClickBlock;
    
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];

    [window addSubview:self];
    
    UIView *bgImageView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, VW(self), VH(self))];
    bgImageView.alpha = 0.77;
    bgImageView.backgroundColor = [UIColor blackColor];
    [self addSubview:bgImageView];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, kWIDTH, kHEIGHT)];
    [path appendPath:[[UIBezierPath bezierPathWithRoundedRect:maskFrame cornerRadius:cornerRadius] bezierPathByReversingPath]];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    
    shapeLayer.path = path.CGPath;
    
    [self.layer setMask:shapeLayer];
    
    if (imageNames.count == imageFrames.count) {
        
        for (int i=0;i<imageFrames.count;i++) {
            
            CGRect imageFrame = CGRectFromString(imageFrames[i]);
            NSString *imageName = imageNames[i];
            UIImageView *iconImage = [self imageViewWithFrame:imageFrame image:imageName];
            [self addSubview:iconImage];
            
            if (i==buttonIndex) {
                UITapGestureRecognizer *btnTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(btnClick:)];
                [self addGestureRecognizer:btnTap];
                [iconImage addGestureRecognizer:btnTap];
                iconImage.userInteractionEnabled = YES;
            }
        }
    }
    
    if (tapClick) {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideMongoliaLayer:)];
        [self addGestureRecognizer:tap];
    }
    
    
}

- (void)btnClick:(UITapGestureRecognizer *)sender{

    UIView *view = sender.view.superview;
    [view removeFromSuperview];
    
    if (_btnClickBlock) {
        _btnClickBlock();
    }
}

- (void)hideMongoliaLayer:(UITapGestureRecognizer *)sender{
    UIView *view = sender.view;
    [view removeFromSuperview];
    
    if (_bgClickBlock) {
        _bgClickBlock();
    }

}

#pragma mark 获取版本号
- (NSString *)getVersonID{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    CFShow((__bridge CFTypeRef)(infoDictionary));
    NSString * versionNumber = [NSString stringWithFormat:@"%@",[infoDictionary objectForKey:@"CFBundleShortVersionString"]];
    return versionNumber;
}

//快速创建imageView
-(id)imageViewWithFrame:(CGRect)frame
                  image:(NSString *)image
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.image = [UIImage imageNamed:image];
    return imageView;
}

@end
