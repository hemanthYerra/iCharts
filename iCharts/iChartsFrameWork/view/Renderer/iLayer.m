//
//  iLayer.m
//  iCharts
//
//  Created by Hemanth Yerra on 01/01/14.
//  Copyright (c) 2014 Arka. All rights reserved.
//

#import "iLayer.h"

iLayer *prevSelected;

@implementation iLayer
@synthesize value;

-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    CGRect rect = self.frame;
    rect.origin = CGPointZero;
    
    CATextLayer *label = [[CATextLayer alloc] init];
    [label setFont:@"ArialMT"];
    [label setFontSize:10];
    [label setFrame:rect];
    [label setString:value];
    [label setAlignmentMode:kCAAlignmentCenter];
    [label setForegroundColor:[[UIColor whiteColor] CGColor]];
    [layer addSublayer:label];
    
}

-(void)select
{
    [prevSelected reset];
    [prevSelected setNeedsDisplay];
    
    self.borderWidth = 2;
    self.borderColor = [UIColor whiteColor].CGColor;
    prevSelected = self;
    [self setNeedsDisplay];
}

-(void)reset
{
    self.borderWidth  = 0;
    self.borderColor  = [UIColor clearColor].CGColor
    ;
}

@end
