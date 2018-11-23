//
//  WLNScanCtr.m
//  KangYangChain
//
//  Created by edz on 2018/10/24.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNScanCtr.h"
#import <AVFoundation/AVFoundation.h>

#define ScanHeight (DEVICEWidth  * 0.65)
#define ViewSpacing ((DEVICEWidth  * 0.35))
#define ScanApla 0.35
#define ScanLineHeight 1

@interface WLNScanCtr ()<AVCaptureMetadataOutputObjectsDelegate>
{
    AVCaptureSession * session;//输入输出的中间桥梁
    AVCaptureVideoPreviewLayer * layer;//扫描界面
    UIImageView *boxview;//扫描框
    UILabel* scanLab;//扫描线
    UIView *topView;
    UIView *leftView;
    UIView *rightView;
    UIView *downView;
    UILabel *contentLab; //放入框内自动扫描字样
    UIButton *flashlightBtn;
}
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) WLNScanTipView *tipView;


@end

@implementation WLNScanCtr

- (WLNScanTipView *)tipView{
    if (_tipView == nil) {
        _tipView = [[WLNScanTipView alloc]initWithFrame:self.view.bounds];
        _tipView.hidden = YES;
        
    }
    return _tipView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"扫码".Intl;
    
    [self.view addSubview:self.tipView];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    
    if (![self isCameraAuthorized]) {
        
        [self requestCameraAuthorization];
        
    }else{
        [self create];
        
    }
}

// 请访问求相机授权
- (void)requestCameraAuthorization
{
    NSString *title = @"请在 设置-隐私-相机 选项中,允许访问你的相机";
    
    AVAuthorizationStatus auth = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (auth == AVAuthorizationStatusNotDetermined) {
        
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if (granted) {
                    
                    [self create];
                    
                }else{
                    self.tipView.hidden = NO;
                }
                
            });
        }];
    }else{
        self.tipView.hidden = NO;
    }
    
}
// 设备是否被授权访问相机
-(BOOL)isCameraAuthorized
{
    AVAuthorizationStatus auth = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    return (auth == AVAuthorizationStatusAuthorized);
}

- (void)create{
    
    AVCaptureDevice * device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    //创建输入流
    AVCaptureDeviceInput * input = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
    //创建输出流
    AVCaptureMetadataOutput * output = [[AVCaptureMetadataOutput alloc]init];
    //设置代理 在主线程里刷新
    [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    output.rectOfInterest = CGRectMake(0.1f, 0.1f, 0.8f, 0.8f);
    //初始化链接对象
    session = [[AVCaptureSession alloc]init];
    //高质量采集率
    [session setSessionPreset:AVCaptureSessionPresetHigh];
    
    if ([session canAddInput:input]) {
        [session addInput:input];
        
    }else{
        [SVProgressHUD showErrorWithStatus:@"未找到输入设备!"];
        [self customPop];
        return;
    }
    if ([session canAddOutput:output]) {
        [session addOutput:output];
    }else{
        [SVProgressHUD showErrorWithStatus:@"未找到输出设备!"];
        [self customPop];
        return;
    }
    //设置扫码支持的编码格式(如下设置条形码和二维码兼容)
    output.metadataObjectTypes=@[AVMetadataObjectTypeQRCode,AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode128Code];
    
    layer = [AVCaptureVideoPreviewLayer layerWithSession:session];
    layer.videoGravity=AVLayerVideoGravityResizeAspectFill;
    layer.frame=CGRectMake(0, 0,DEVICEWidth,DEVICEHEIGHT);
    
    //扫描框
    boxview = [[UIImageView alloc] initWithFrame:CGRectMake( (DEVICEWidth - ScanHeight)/2, 100, ScanHeight, ScanHeight)];
    boxview.image = @"pic_saoma".image;
    
    
    //扫描线
    scanLab = [[UILabel alloc] init];
    scanLab.frame = CGRectMake(-10, 0, ScanHeight+20, ScanLineHeight);
    scanLab.backgroundColor = [UIColor greenColor];
    
    //开始捕获
    DISPATCH_CHILD(^{
        
        [self->session startRunning];
        
        DISPATCH_MAIN(^{
            
            [self.view.layer addSublayer:self->layer];
            [self.view addSubview:self->boxview];
            [self->boxview addSubview:self->scanLab];
//            [self addShadowView];
            
            self.timer = [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(moveScanLayer:) userInfo:nil repeats:YES];
            [self.timer fire];
            
            
            
        });
        
    });
}
- (void)moveScanLayer:(NSTimer *)timer
{
    [UIView animateWithDuration:2 animations:^{
        self->scanLab.frame = CGRectMake(-10, ScanHeight,ScanHeight+20, ScanLineHeight);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:2 animations:^{
            self->scanLab.frame =CGRectMake(-10 , 0 ,ScanHeight+20, ScanLineHeight);
        }];
    }];
}
#pragma mark 扫码结果操作
-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{
    [self->session stopRunning];

    
    if (metadataObjects.count != 0) {
        
        AVMetadataMachineReadableCodeObject *obj = metadataObjects.firstObject;

        [SVProgressHUD showSuccessWithStatus:[NSString stringWithFormat:@"识别成功:地址:%@",obj.stringValue]];

        if (_didResultBackBlock) {
            
            _didResultBackBlock(obj.stringValue);
        }
    }else{
        
        [SVProgressHUD showErrorWithStatus:@"未能识别"];
    }
    [self.navigationController popViewControllerAnimated:YES];
  
    
}
@end
