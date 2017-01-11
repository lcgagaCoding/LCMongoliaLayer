//
//  LCMongoliaLayerView.h
//  LCMongoliaLayer
//
//  Created by 刘成 on 17/1/9.
//  Copyright © 2017年 刘成. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kWIDTH [UIScreen mainScreen].bounds.size.width
#define kHEIGHT [UIScreen mainScreen].bounds.size.height
#define VW(view) (view.frame.size.width)
#define VH(view) (view.frame.size.height)
#define VX(view) (view.frame.origin.x)
#define VY(view) (view.frame.origin.y)
#define FW(view) (VW(view)+VX(view))
#define FH(view) (VH(view)+VY(view))

typedef void (^BgClickBlock)();
typedef void (^BtnClickBlock)();

@interface LCMongoliaLayerView : UIView

@property (nonatomic, copy) BgClickBlock bgClickBlock;
@property (nonatomic, copy) BtnClickBlock btnClickBlock;

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
- (void)showMongoliaLayerWithMaskFrame:(CGRect)maskFrame cornerRadius:(CGFloat)cornerRadius ImageNames:(NSArray *)imageNames imageFrames:(NSArray *)imageFrames buttonIndex:(NSInteger)buttonIndex shortVersion:(NSString *)shortVersion tapClick:(BOOL)tapClick bgClickBlock:(BgClickBlock)bgClickBlock btnClickBlock:(BtnClickBlock)btnClickBlock;

@end
