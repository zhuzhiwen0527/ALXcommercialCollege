//
//  ALXUtility.h
//  ALXcommercialCollege
//
//  Created by macbook pro on 16/7/20.
//  Copyright © 2016年 zzw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ALXUtility : NSObject
/**
 *  计算文本高度
 *
 *  @param content  本文
 *  @param font     字体大小
 *  @param maxWidth lab宽度
 *
 *  @return lab高度
 */
+ (CGFloat)heightFormContent:(NSString *) content fontSize:(CGFloat)font maxWidth:(CGFloat)maxWidth;

/**
 *  16进制转RGB
 *
 *  @param stringColor 16进制颜色
 *
 *  @return rgb颜色
 */
+ (UIColor *)stringColorToRGBColor:(NSString*)stringColor;

/**
 *  获取32位UUID
 *
 *  @return uuid字符串
 */
+(NSString *)uuid;

/**
 *  颜色转换成图片
 *
 *  @param color 颜色
 *
 *  @return 图片
 */
+ (UIImage *)createImageWithColor:(UIColor *)color;

/**
 *  获取时间戳
 *
 *  @return 时间戳字符串
 */
+ (NSString *)getTimeStamp;
/**
 *  提示框
 *
 *  @param titleStr 提示标题
 *  @param infoStr  提示内容
 *  @param action   确定回调
 *  @param target   推出的父控制器
 */
+ (void)createAlertWith:(NSString *)titleStr message:(NSString *)message action:(void(^)())action target:(id)target;

+ (void)cretateAlertWith:(NSString *)titleStr message:(NSString *)message target:(id)target;
@end
