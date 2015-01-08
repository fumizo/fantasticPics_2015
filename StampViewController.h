//
//  StampViewController.h
//  fantasticPics
//
//  Created by 山本文子 on 2014/12/20.
//  Copyright (c) 2014年 山本文子. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "DBLibraryManager.h"
#import "DBCameraViewController.h"
#import "DBCameraContainerViewController.h"
#import "DBCameraSegueViewController.h"
@interface StampViewController : UIViewController<DBCameraViewControllerDelegate , UIGestureRecognizerDelegate>{
    
    NSString *stampArray[6];
    int index;
    UIImageView *viewList[100];
    int count;
    
    IBOutlet UIScrollView *stampScrool;
    
    
    
    //ここからCGGestureRecognizer
    CGAffineTransform _currentTransform;
    float _scale;
    float _angle;
    BOOL _isMoving;
    
    
    UIImageView *stampImgView;
    UIView *stampView;

    
}

-(void)stamp1;
-(void)stamp2;
-(void)stamp3;
-(void)stamp4;
-(void)stamp5;
-(void)stamp6;

- (IBAction)backStamp;
- (IBAction)clearStamp;


@property IBOutlet UIImageView * photoView;
@property (nonatomic) UIImage *photoImage;

-(IBAction)saveImage;
//-(IBAction)goNext;

@end