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
    UIImageView *imageView2;
    UIImageView *making;


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

    UIImage *startring2 = [UIImage imageNamed:@"fantasticPics_startring"];
    imageView2 = [[UIImageView alloc]initWithImage:startring2];

    [self resetImageView];
    [self resetImageView2];

    
    
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

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    //    タッチされた場所の所得
    UITouch *touch = [touches anyObject];
    //    指一本だけ情報を所得
    CGPoint location = [touch locationInView:self.view];
    //   その位置を所得
    
    UIImage *makingRing = [UIImage imageNamed:@"fantasticPics_startring"];
    making = [[UIImageView alloc]initWithImage:makingRing];
    
//    making.center = CGPointMake(location.x, location.y);
    CGRect rect = CGRectMake(location.x -25, location.y-25, 50, 50);
    making.frame = rect;
    [self.view addSubview:making];
    
    [UIView animateWithDuration:1.1f // アニメーション速度2.5秒
                          delay:0.0f // 1秒後にアニメーション
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         // 画像を2倍に拡大
                         making.transform = CGAffineTransformMakeScale(1.7,  1.7);
                         making.alpha = 0;
                     } completion:^(BOOL finished) {
                         // アニメーション終了時
                     }];
}

-(void)ring{
    // アニメーション
    [UIView animateWithDuration:2.5f // アニメーション速度2.5秒
                          delay:0 // 1秒後にアニメーション
                        options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionRepeat
                     animations:^{
                         // 画像を2倍に拡大
                         imageView.transform = CGAffineTransformMakeScale(1.7,  1.7);
                         imageView.alpha = 0;
                     } completion:^(BOOL finished) {
                         // アニメーション終了時
                         NSLog(@"アニメーション終了");
                     }];
}

-(void)ring2{
    [UIView animateWithDuration:2.5f // アニメーション速度2.5秒
                          delay:1.1f // 1秒後にアニメーション
                        options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionRepeat
                     animations:^{
                         // 画像を2倍に拡大
                         imageView2.transform = CGAffineTransformMakeScale(1.7,  1.7);
                         imageView2.alpha = 0;
                     } completion:^(BOOL finished) {
                         // アニメーション終了時
                         NSLog(@"アニメーション終了");
                     }];

}

-(void)resetImageView{
    CGRect rect = CGRectMake(110, 234, 100, 100);
    
    imageView.frame = rect;
    [self.view addSubview:imageView]; //ring1を表示
    imageView.alpha = 1.0;
    [self ring];

}

-(void)resetImageView2{
    CGRect rect = CGRectMake(110, 234, 100, 100);
    imageView2.frame = rect;
    [self.view addSubview:imageView2]; //ring1を表示
    imageView2.alpha = 1.0;
    [self ring2];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
