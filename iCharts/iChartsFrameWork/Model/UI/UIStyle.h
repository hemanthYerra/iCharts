//
//  UIStyle.h
//  RsooomAnimatorIPAD
//
//  Created by admin on 12/13/12.
//
//

#import <Foundation/Foundation.h>

@interface UIStyle : NSObject

+(UIColor *)colorwithHexValue:(uint)hexValue andAlpha:(float)alpha;
+(UIColor *)colorwithHexString:(NSString *)hexString andAlpha:(float)alpha;
+(NSString *)hexStringFromColor:(UIColor *)color;

@end
