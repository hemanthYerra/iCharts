//
//  CustomButton.m
//  RsooomAnimatorIPAD
//
//  Created by user on 7/26/13.
//
//

#import "CustomButton.h"
#import <QuartzCore/QuartzCore.h>
#import "UIStyle.h"
#import "UIConstants.h"
@implementation CustomButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    
        
        self.contentMode   = UIViewContentModeScaleAspectFit;
        
        self.backgroundColor = [UIStyle colorwithHexString:@"#1589FF" andAlpha:1.0f];//[UiTheme getUiColor:@"#1589FF" alpha:1.0f];
        self.layer.cornerRadius = 3.0;
       // [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeChanged:) name:ThemeChangeNotification object:nil];
        [self addTarget:self action:@selector(buttonSelect) forControlEvents:UIControlEventTouchDown];
        [self addTarget:self action:@selector(buttonNormal) forControlEvents:UIControlEventTouchUpInside];

    }
    return self;
}
-(void)buttonNormal
{
    self.backgroundColor = [UIStyle colorwithHexString:@"#1589FF" andAlpha:1.0f];;
}
-(void)buttonSelect
{
  self.backgroundColor = [UIStyle colorwithHexString:@"#1589FF" andAlpha:0.7f];;
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
