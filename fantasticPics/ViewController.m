//
//  ViewController.m
//  fantasticPics
//
//  Created by 山本文子 on 2014/12/08.
//  Copyright (c) 2014年 山本文子. All rights reserved.
//

#import "ViewController.h"
#import "StampViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self barButtonCustom];
    
    /*
    //デバイス取得
    AVCaptureDevice* device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    //入力作成
    AVCaptureDeviceInput* deviceInput = [AVCaptureDeviceInput deviceInputWithDevice:device error:NULL];
    
    //ビデオデータ出力作成
    NSDictionary* settings = @{(id)kCVPixelBufferPixelFormatTypeKey:[NSNumber numberWithInt:kCVPixelFormatType_32BGRA]};
    AVCaptureVideoDataOutput* dataOutput = [[AVCaptureVideoDataOutput alloc] init];
    dataOutput.videoSettings = settings;
    [dataOutput setSampleBufferDelegate:self queue:dispatch_get_main_queue()];
    
    //セッション作成
    self.session = [[AVCaptureSession alloc] init];
    [self.session addInput:deviceInput];
    [self.session addOutput:dataOutput];
    self.session.sessionPreset = AVCaptureSessionPresetHigh;
    
    AVCaptureConnection *videoConnection = NULL;
    
    // カメラの向きなどを設定する
    [self.session beginConfiguration];
    
    for ( AVCaptureConnection *connection in [dataOutput connections] )
    {
        for ( AVCaptureInputPort *port in [connection inputPorts] )
        {
            if ( [[port mediaType] isEqual:AVMediaTypeVideo] )
            {
                videoConnection = connection;
                
            }
        }
    }
    if([videoConnection isVideoOrientationSupported]) // **Here it is, its always false**
    {
        [videoConnection setVideoOrientation:AVCaptureVideoOrientationPortrait];
    }
    
    [self.session commitConfiguration];
    // セッションをスタートする
    [self.session startRunning];
     */
}



- (void) openCamera{
    DBCameraContainerViewController *cameraContainer = [[DBCameraContainerViewController alloc] initWithDelegate:self];
    [cameraContainer setFullScreenMode];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:cameraContainer];
    [nav setNavigationBarHidden:YES];
    [self presentViewController:nav animated:YES completion:nil];
}

- (IBAction)openingCamera{
    [self openCamera];
}

//Use your captured image
#pragma mark - DBCameraViewControllerDelegate

- (void) camera:(id)cameraViewController didFinishWithImage:(UIImage *)image withMetadata:(NSDictionary *)metadata
{
    imageView.image = image;
    
    //スタンプビューに遷移するよ
    StampViewController *stampVC = [self.storyboard instantiateViewControllerWithIdentifier:@"stamp"];
    
//    stampVC.photoView.image = image;
    stampVC.photoImage = image;
//    [detail setDetailImage:image];
    [self.navigationController pushViewController:stampVC animated:NO];
    [cameraViewController restoreFullScreenMode];
    [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void) dismissCamera:(id)cameraViewController{
    [self dismissViewControllerAnimated:YES completion:nil];
    [cameraViewController restoreFullScreenMode];
}

- (void) barButtonCustom{
    //navのbackのボタンをカスタムする
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] init];
    barButton.title = @"TOPへ";
    self.navigationItem.backBarButtonItem = barButton;
}

/*
 

//delegateメソッド。各フレームにおける処理
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection
{
    // 画像の表示
    self.imageView.image = [self imageFromSampleBufferRef:sampleBuffer];
}

// CMSampleBufferRefをUIImageへ
- (UIImage *)imageFromSampleBufferRef:(CMSampleBufferRef)sampleBuffer
{
    // イメージバッファの取得
    CVImageBufferRef    buffer;
    buffer = CMSampleBufferGetImageBuffer(sampleBuffer);
    
    // イメージバッファのロック
    CVPixelBufferLockBaseAddress(buffer, 0);
    // イメージバッファ情報の取得
    uint8_t*    base;
    size_t      width, height, bytesPerRow;
    base = CVPixelBufferGetBaseAddress(buffer);
    width = CVPixelBufferGetWidth(buffer);
    height = CVPixelBufferGetHeight(buffer);
    bytesPerRow = CVPixelBufferGetBytesPerRow(buffer);
    
    // ビットマップコンテキストの作成
    CGColorSpaceRef colorSpace;
    CGContextRef    cgContext;
    colorSpace = CGColorSpaceCreateDeviceRGB();
    cgContext = CGBitmapContextCreate(
                                      base, width, height, 8, bytesPerRow, colorSpace,
                                      kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedFirst);
    CGColorSpaceRelease(colorSpace);
    
    // 画像の作成
    CGImageRef  cgImage;
    UIImage*    image;
    cgImage = CGBitmapContextCreateImage(cgContext);
    image = [UIImage imageWithCGImage:cgImage scale:1.0f
                          orientation:UIImageOrientationUp];
    CGImageRelease(cgImage);
    CGContextRelease(cgContext);
    
    // イメージバッファのアンロック
    CVPixelBufferUnlockBaseAddress(buffer, 0);
    return image;
}
 
 */


@end