//
//  UIStyle.m
//  RsooomAnimatorIPAD
//
//  Created by admin on 12/13/12.
//
//

#import "UIStyle.h"

@implementation UIStyle

+(UIColor *)colorwithHexString:(NSString *)hexString andAlpha:(float)alpha
{
    UIColor *col;
    hexString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@"0X"];
    uint hexValue;
    
    if([[NSScanner scannerWithString:hexString] scanHexInt:&hexValue])
    {
        col = [UIStyle colorwithHexValue:hexValue andAlpha:alpha];
    }
    else
    {
        //send Default Color
        col = [UIColor blackColor];
    }
    
    return col;
}

+(UIColor *)colorwithHexValue:(uint)hexValue andAlpha:(float)alpha
{    
    return [UIColor colorWithRed: ((float)((hexValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValue & 0xFF00) >> 8))/255.0 blue:((float)(hexValue & 0xFF))/255.0 alpha:alpha];
}


+(NSString *)hexStringFromColor:(UIColor *)color
{    
    if(!color)color = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    
    CGColorRef colorRef = [color CGColor];
    const CGFloat *components = CGColorGetComponents(colorRef);
    
    NSString *hexString =@"#";
    int hexvalue = 0;
    
    for(int i = 0 ; i < 3 ; i++)
    {
       // NSLog(@"Componnent of  %d = %f",i,components[i]);
        
        if(components[i] == 0)
        {
            hexString = [NSString stringWithFormat:@"%@00",hexString];
        }
        else
        {
            hexvalue = 0xFF*components[i];
            hexString = [NSString stringWithFormat:@"%@%x",hexString,hexvalue];
        }
        
    }
    
    return hexString;
}

@end
