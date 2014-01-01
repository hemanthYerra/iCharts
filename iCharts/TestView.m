//
//  TestView.m
//  iCharts
//
//  Created by Hemanth Yerra on 31/12/13.
//  Copyright (c) 2013 Arka. All rights reserved.
//

#import "TestView.h"
#import "Utilities.h"
#import "CustomButton.h"
#import "UIConstants.h"
#import "iLayer.h"
#import <QuartzCore/QuartzCore.h>

@implementation TestView
{
    CustomButton *btn;
    NSMutableArray *arSections;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        // Initialization code
        
        
        arSections = [[NSMutableArray alloc] init];
        [self addButton];
        [self addLayers];
        
        [self addGestures];
        
        
    }
    return self;
}

-(void)addLayers
{

    for(int i = 0 ;i < 10;i++)
    {
        for (int j = 0; j < 10; j++) {
            CGRect rect = CGRectMake(j*30, i*30, 30, 30);
            iLayer *layer = [iLayer layer];
            layer.delegate = layer;
            layer.value = [NSString stringWithFormat:@"%d",[arSections count]+1];
            layer.frame = rect;
            layer.backgroundColor = [Utilities getRandomColor].CGColor;
            [arSections addObject:layer];
            [self.layer addSublayer:layer];
            [layer setNeedsDisplay];
            
            
        }
    }
    
    
    
}

-(void)addButton
{    
    CGRect rect = CGRectMake(0, CGRectGetHeight(self.frame)-120, 50, 40);
    btn = [[CustomButton alloc]initWithFrame:rect];
    
    [btn setTitle:@"Reload" forState:UIControlStateNormal];
    btn.titleLabel.font = APP_FONT15;//[UIFont boldSystemFontOfSize:15];
    [btn addTarget:self action:@selector(reloadColors:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
    
}

-(void)reloadColors:(id)button
{
    //remove all layers
    //self.layer.sublayers = nil;
    
    for (CALayer *layer in arSections) {
        [layer removeFromSuperlayer];
    }
    
    [arSections removeAllObjects];
    [self addLayers];
    [self bringSubviewToFront:btn];
    
}

-(void) addGestures
{
    UITapGestureRecognizer *tapgesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    tapgesture.numberOfTapsRequired =1;
    [self addGestureRecognizer:tapgesture];
}

-(void)handleTapGesture:(UITapGestureRecognizer *)gesture
{
    
    CGPoint p = [gesture locationInView:gesture.view];
    
    for (iLayer *layer in gesture.view.layer.sublayers) {
        if ([layer containsPoint:[gesture.view.layer convertPoint:p toLayer:layer]]) {
            // do something
            //NSLog(@"Tapped on :%@",layer.value);
            [layer select];
            break;
        }
    }
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
