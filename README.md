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
- (void)showMongoliaLayerWithMaskFrame:(CGRect)maskFrame cornerRadius:(CGFloat)cornerRadius ImageNames:(NSArray *)imageNames imageFrames:(NSArray *)imageFrames buttonIndex:(NSInteger)buttonIndex shortVersion:(NSString *)shortVersion tapClick:(BOOL)tapClick bgClickBlock:(BgClickBlock)bgClickBlock btnClickBlock:(BtnClickBlock)btnClickBlock;
