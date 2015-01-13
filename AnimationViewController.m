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

@implementation AnimationViewController{
    UIImageView *imageView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.flipGrid = [[ImageFlipGrid alloc]initWithImage: [UIImage imageNamed:@"fantasticPics_first_animation.png"] gridCount:CGSizeMake(20,4)];
    
    [self.view addSubview: self.flipGrid.view];
    
    CGRect originalFrame = self.flipGrid.view.frame;
    originalFrame.origin.y = 40;
    self.flipGrid.view.frame = originalFrame;
    
    
    
    UIImage *startring = [UIImage imageNamed:@"fantasticPics_startring"];
    imageView = [[UIImageView alloc]initWithImage:startring];
//    imageView.center = CGPointMake(160, 284);
//    UIGraphicsBeginImageContext(CGSizeMake(100,100));
    CGRect rect = CGRectMake(110, 234, 100, 100);
    imageView.frame = rect;
    
    [self.view addSubview:imageView];
    
    
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

-(void)big{
    
}

-(void)small{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
