//
//  DoneViewController.m
//  fantasticPics
//
//  Created by 山本文子 on 2015/01/22.
//  Copyright (c) 2015年 山本文子. All rights reserved.
//

#import "DoneViewController.h"

@implementation DoneViewController

-(void)viewDidLoad{
//    [self.navigationController setNavigationBarHidden:YES animated:YES]; //NavigationBarを非表示
}

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:YES]; //NavigationBarを非表示
}

-(IBAction)save{
    //    キャプチャする範囲の指定
    CGRect rect = CGRectMake(0, 70, 320, 320);
    
    UIGraphicsBeginImageContext(rect.size);
    
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *capture = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    //    キャプチャした画像の範囲
    UIImageWriteToSavedPhotosAlbum(capture, nil, nil, nil);
    UIGraphicsEndImageContext();
    
    //    アラートを出す
    UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"【attention】" message:@"SAVE complete!" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alert show ];
    //　　アラートを画面に設定する
    //    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(count) userInfo:nil repeats:YES];
}

-(IBAction)backStart{
    [self dismissViewControllerAnimated:YES completion:nil];

}

-(IBAction)twitter{
    
}

-(IBAction)instagram{
    
}
@end
