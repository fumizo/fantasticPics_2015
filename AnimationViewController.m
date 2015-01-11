//
//  AnimationViewController.m
//  fantasticPics
//
//  Created by 山本文子 on 2015/01/11.
//  Copyright (c) 2015年 山本文子. All rights reserved.
//

#import "AnimationViewController.h"
#import "ImageFlipGrid.h"
#import "mrmUtility.h"

@implementation AnimationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.flipGrid = [[ImageFlipGrid alloc]initWithImage: [UIImage imageNamed:@"fantasticPics_first_animation.png"] gridCount:CGSizeMake(20,4)];
    
    [self.view addSubview: self.flipGrid.view];
    
    CGRect originalFrame = self.flipGrid.view.frame;
    originalFrame.origin.y = 40;
    self.flipGrid.view.frame = originalFrame;
    
    
    //Animate flip grid
    //    flipGrid.view.layer.transform = [mrmUtility rotateView:flipGrid.view byX:0 byY:0];
    //
    //    CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    //
    //    basic.duration = 5.0;
    //    basic.autoreverses = YES;
    //    basic.byValue = [NSNumber numberWithFloat: M_PI/20];
    //    basic.repeatCount = 9999;
    //
    //
    //    [flipGrid.view.layer addAnimation:basic forKey:@"basic"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
