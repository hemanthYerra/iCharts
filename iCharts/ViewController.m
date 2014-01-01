//
//  ViewController.m
//  iCharts
//
//  Created by Hemanth Yerra on 31/12/13.
//  Copyright (c) 2013 Arka. All rights reserved.
//

#import "ViewController.h"
#import "TestView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    [self addTestView];
    
}

-(void)addTestView
{
    
    CGRect rect = self.view.frame;
    rect.origin.y = 60;
    TestView *testView = [[TestView alloc] initWithFrame:rect];
    [self.view addSubview:testView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
