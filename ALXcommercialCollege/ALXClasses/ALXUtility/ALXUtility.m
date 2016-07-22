//
//  ALXUtility.m
//  ALXcommercialCollege
//
//  Created by macbook pro on 16/7/20.
//  Copyright © 2016年 zzw. All rights reserved.
//

#import "ALXUtility.h"

@implementation ALXUtility

+ (CGFloat)heightFormContent:(NSString *) content fontSize:(CGFloat)font maxWidth:(CGFloat)maxWidth{

    if (content.length == 0) {
        return 0;
    }
    NSDictionary * attrs = @{NSFontAttributeName :[UIFont systemFontOfSize:font]};
    
    return [content boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attrs context:nil].size.height;
}

+ (UIColor *)stringColorToRGBColor:(NSString*)stringColor{

    NSMutableString * mStr = [NSMutableString stringWithString:stringColor];
    
    [mStr replaceCharactersInRange:[mStr rangeOfString:@"#"] withString:@"0x"];
    
    long colorLong = strtoul([mStr cStringUsingEncoding:NSUTF8StringEncoding], 0, 16);
    int R = (colorLong & 0xFF0000 ) >> 16;
    int G = (colorLong & 0x00FF00 ) >>8;
    int B = (colorLong & 0x0000FF);
    
    UIColor * rgbColor = [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0];
    
    return rgbColor;

}

+(NSString *)uuid{

    NSUUID *UUID = [NSUUID UUID];
    NSString *UUIDString = UUID.UUIDString;
    
    return  [UUIDString stringByReplacingOccurrencesOfString:@"-" withString:@""];

}


+ (UIImage *)createImageWithColor:(UIColor *)color{
    
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
    
}

+ (NSString *)getTimeStamp{
    
    NSDate * date = [NSDate date];
    
    NSTimeInterval time = [date timeIntervalSince1970] * 1000;
    
    NSString * timeStr = [NSString stringWithFormat:@"%f",time];
    
    NSRange rang = [timeStr rangeOfString:@"."];
    
    NSString * str = [timeStr substringToIndex:rang.location];
    return str;

}

+ (NSString *)getDateWithStamp:(NSString*)stamp{

    if (stamp.length == 0) {
        return nil;
    }
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:stamp.integerValue/1000];
    
    NSDateFormatter * fm = [[NSDateFormatter alloc] init];
    
    [fm setDateFormat:@"yyyy-MM-dd HH:mm"];
    
    return [fm stringFromDate:date];
    

}

+ (void)createAlertWith:(NSString *)titleStr message:(NSString *)message action:(void(^)())action target:(id)target{

    UIAlertController * alert = [UIAlertController alertControllerWithTitle:titleStr message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    UIAlertAction * confirmAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:action];
    
    [alert addAction:cancleAction];
    [alert addAction:confirmAction];
    
    [target presentViewController:alert animated:YES completion:nil];
}

+ (void)cretateAlertWith:(NSString *)titleStr message:(NSString *)message target:(id)target{
    
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:titleStr message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancleAction];
    [target presentViewController:alert animated:YES completion:nil];
    

}

@end
