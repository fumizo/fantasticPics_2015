//
//  StampViewController.m
//  fantasticPics
//
//  Created by 山本文子 on 2014/12/20.
//  Copyright (c) 2014年 山本文子. All rights reserved.
//

#import "StampViewController.h"

@interface StampViewController ()

@end

@implementation StampViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    // UIPinchGestureRecognizerを登録
//    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchAction:)];
//    [stampView addGestureRecognizer:pinch];
    
    
    index =0;
    stampArray[0] = @"UT_990yen_sozai";  //990円のやつ
    stampArray[1] = @"simamura_logo_sozai";  //しまむらロゴ
    stampArray[2] = @"MUSEE_summer_sozai";   //ミュゼ200円
    stampArray[3] = @"MUSEE.logo_sozai";     //ミュゼロゴ
    stampArray[4] = @"highBall_miho_sozai";  //うちのハイボールは角だから
    stampArray[5] = @"highBall_haikara_sozai";  //お好きでしょハイから
    
    //    スクロールビューの初期化
    stampScrool.frame = self.view.bounds;
    //    スクロールしたときに反動させるかどうか
    stampScrool.bounces=YES;
    //    サイズを設定する
    CGRect rect = CGRectMake(0, 0, 900, 100);
    //　　UIImageViewを生成
    UIImageView *imageView =[[UIImageView alloc]initWithFrame:rect];
//    //    スクロールビューに背景画像を設定
//    imageView.image =[UIImage imageNamed:@"gurade.png"];
    
    //    UIScrollViewのインスタンスに画像を貼付ける
    [stampScrool addSubview:imageView];
    
    //    UIScrollViewのインスタンスに画像をつける
    [stampScrool addSubview:imageView];
    
    //    UIScrollViewのコンテンツサイズを画像のサイズに合わせる
    stampScrool.contentSize = imageView.bounds.size;
    
    //    for文を使ってボタンの位置をずらす
    for (int i=0;  i<6; i++) {
        //        ボタンの種類を設定
        UIButton *tapbtn =[UIButton buttonWithType:UIButtonTypeCustom];
        
        tapbtn.userInteractionEnabled = true;
        
        //        サイズと位置
        tapbtn.frame=CGRectMake(i*100, 0, 100, 100);
        
        //        ボタンの背景画像設定
        [tapbtn setBackgroundImage:[UIImage imageNamed:stampArray[i]] forState:UIControlStateNormal];
        
        //        ボタンが押されたときの処理
        [tapbtn addTarget:self action:@selector(tap:) forControlEvents:UIControlEventTouchUpInside];
        
        tapbtn.tag=i;
        
        [stampScrool addSubview:tapbtn];
    }
}

//UIGestureRecognizerについて
//ジェスチャーの同時処理を許可
- (BOOL) gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}



//ボタンが押されたときの処理
-(void)tap:(UIButton*)button{
    switch (button.tag) {
        case 0:
            [self stamp1];
            break;
        case 1:
            [self stamp2];
            break;
        case 2:
            [self stamp3];
            break;
        case 3:
            [self stamp4];
            break;
        case 4:
            [self stamp5];
            break;
        case 5:
            [self stamp6];
            break;
            
        default:
            break;
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    //    タッチされた場所の所得
    UITouch *touch = [touches anyObject];
    //    指一本だけ情報を所得
    CGPoint location = [touch locationInView:self.view];
    //   その位置を所得
    if(index > 0){

        stampImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:stampArray[index-1]]];
        ///[stampImgView isEqual: [[UIImageView alloc] initWithImage:[UIImage imageNamed:stampArray[index-1]]]];

//        stampImgView = [[UIImageView alloc] initWithImage:stampImgView.image];
        
        stampView =  [[UIView alloc] initWithFrame:CGRectMake(0,0,stampImgView.frame.size.width,stampImgView.frame.size.height)];
        [stampView addSubview:stampImgView];
        stampView.center = CGPointMake(location.x, location.y);
        
        viewList[count] = stampImgView;
        count = count +1;
    
        // UIPinchGestureRecognizerを登録
        UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchAction:)];
        pinch.delegate = self;
        [stampView addGestureRecognizer:pinch];
        [self.view addSubview:stampView]; //画像に表示する
        
    }
//    // UIPinchGestureRecognizerを登録
//    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchAction:)];
//    [self.view addGestureRecognizer:pinch];

}

//拡大縮小する
- (void)pinchAction:(UIPinchGestureRecognizer *)sender {
    stampView = sender.view;
    CGFloat scale = [sender scale];
    
    // ピンチの操作開始してからの拡大縮小を、transformで設定
    stampView.transform = CGAffineTransformConcat(stampView.transform, CGAffineTransformMakeScale(scale, scale));
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    NSData* imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"hogehoge"];
    if(imageData) {
        self.photoView.image = [UIImage imageWithData:imageData];
        
        NSLog(@"復元完了");
        [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"hogehoge"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
    }else{
        self.photoView.image = self.photoImage;
    }
}

- (IBAction)saveImage {
    //    キャプチャする範囲の指定
    CGRect rect = CGRectMake(0, 46, 320, 320);
    
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
-(IBAction)back{
    
    NSData* imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"cache"];
    if(imageData) {
        UIImage *image = [UIImage imageWithData:imageData];
        
        NSLog(@"復元完了");
        [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"cache"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        DBCameraSegueViewController *segue = [[DBCameraSegueViewController alloc] initWithImage:image thumb:image boolsecond:true];
        [self presentViewController:segue animated:YES completion:nil];
    }else{
        NSLog(@"復元失敗");
    }
}



-(void)stamp1{
    index = 1;
}
-(void)stamp2{
    index = 2;
}
-(void)stamp3{
    index = 3;
}
-(void)stamp4{
    index = 4;
}
-(void)stamp5{
    index = 5;
}
-(void)stamp6{
    index = 6;
    
}



-(IBAction)backStamp{
    if (count > 0) {
        count = count-1;
        [viewList[count] removeFromSuperview];
    }
    else{count =0;
    }
}

-(IBAction)clearStamp{
    for(int i = count; i !=0; i= i-1){
        [viewList[i-1] removeFromSuperview];
        
        viewList[count] = Nil;
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
