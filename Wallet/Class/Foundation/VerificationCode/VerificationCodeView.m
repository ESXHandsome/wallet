//
//  VerificationCodeView.m
//  Wallet
//
//  Created by 谷澍 on 2018/10/29.
//  Copyright © 2018 Ying. All rights reserved.
//
#import "VerificationCodeView.h"
static BOOL status;

@interface VerificationCodeView ()

@property (nonatomic, assign) NSInteger itemCount;//按钮个数

@property (nonatomic, assign) CGFloat itemMargin;//按钮间距

@property (nonatomic, weak) UIControl *maskView;//遮盖

@property (nonatomic, strong) NSMutableArray<UILabel *> *labels;

@property (nonatomic, strong) NSMutableArray *lines;

@property (nonatomic, copy) NSString *tempStr;

@property (nonatomic, copy) NSString *title;//标题内容

@property (nonatomic, copy) NSString * message;//提示信息内容

@property (nonatomic, copy) NSString * types;//提示信息内容

@end

@implementation VerificationCodeView

#pragma mark - 初始化
- (instancetype)initWithCount:(NSInteger)count margin:(CGFloat)margin  message:(NSString *)message title:(NSString *)title
{
    
    if (self = [super init]) {
        
        self.itemCount = count;
        self.itemMargin = margin;
        self.title=title;
        self.message=message;
        [self configTextField];
        
    }
    return self;
}

- (instancetype)initWithCountforCode:(NSInteger)count margin:(CGFloat)margin  message:(NSString *)message title:(NSString *)title type:(NSString *)types
{
    
    if (self = [super init]) {
        
        self.itemCount = count;
        self.itemMargin = margin;
        self.title=title;
        self.message=message;
         self.types=types;
        [self configTextField];
        
    }
    return self;
}

- (void)configTextField
{
    
    self.backgroundColor=[UIColor colorWithString:@"#FBFBFB"];
    
    self.labels = @[].mutableCopy;
    
    UITextField *textField = [[UITextField alloc] init];
    textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    textField.keyboardType = UIKeyboardTypeNumberPad;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHiden:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    [textField addTarget:self action:@selector(tfEditingChanged:) forControlEvents:(UIControlEventEditingChanged)];
    [self addSubview:textField];
    self.textField = textField;
    
    
    //遮挡底部textfiled
    UIButton *maskView = [UIButton new];
    maskView.backgroundColor=[UIColor colorWithString:@"#FBFBFB"];
    [maskView addTarget:self action:@selector(clickMaskView) forControlEvents:(UIControlEventTouchUpInside)];
    [self addSubview:maskView];
    self.maskView = maskView;
 
    
    for (NSInteger i = 0; i < self.itemCount; i++)
    {
        UILabel *label = [UILabel new];
        
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor colorWithString:@"#444444"];
        label.font = [UIFont fontWithName:@"PingFangSC-Medium" size:adaptFontSize(18*2)];
        [label setBackgroundColor:[UIColor colorWithString:@"#E8E8E8"]];
        [self addSubview:label];
        [self.labels addObject:label];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click:)];
        [label addGestureRecognizer:tap];
       label.userInteractionEnabled=YES;

    }
   
    
}


#pragma 监控键盘消失，代理传值
-(void)keyboardWillBeHiden:(NSNotification *)notification {
    if ( [self.delegate respondsToSelector:@selector(returnFieldText:)] ) {
        [self.delegate returnFieldText:self.code];
       
    }
    
}

- (void)layoutSubviewsforcreatPsw {
    
    
    
    if (self.labels.count != self.itemCount) return;
    
    for (NSInteger i = 0; i < self.labels.count; i++)
    {
        UILabel *label = self.labels[i];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_offset(adaptHeight1334(80*2+NAVIGATION_BAR_HEIGHT/2));
            make.left.mas_offset(adaptWidth750(47.5*2+i*48*2));
            make.height.mas_equalTo(adaptHeight1334(40*2));
            make.width.mas_equalTo(adaptWidth750(40*2));
        }];
        
        label.layer.cornerRadius = label.bounds.size.width/2;
        label.layer.masksToBounds = YES;
        
    }
    
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(adaptHeight1334(80*2));
        make.left.mas_offset(adaptWidth750(0));
        make.height.mas_equalTo(adaptHeight1334(40*2));
        make.width.mas_equalTo(SCREEN_WIDTH);
    }];
    [self.maskView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(adaptHeight1334(80*2));
        make.left.mas_offset(adaptWidth750(0));
        make.height.mas_equalTo(adaptHeight1334(40*2));
        make.width.mas_equalTo(SCREEN_WIDTH);
    }];
    UILabel *textlabel = [[UILabel alloc] init];
    textlabel.backgroundColor = [UIColor colorWithString:@"#FBFBFB"];
    textlabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:adaptFontSize(12*2)];
    textlabel.layer.borderColor = [[UIColor grayColor] CGColor];
    textlabel.text = _message;
    textlabel.lineBreakMode = NSTextAlignmentCenter;
    textlabel.numberOfLines = 0;
    [self addSubview:textlabel];
    
    UILabel *titlelabel = [UILabel new];
    titlelabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:adaptFontSize(14*2)];
    titlelabel.text = _title;
    titlelabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:titlelabel];
    
    [titlelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(adaptHeight1334(37*2+NAVIGATION_BAR_HEIGHT/2));
        make.centerX.equalTo(self);
    }];
    [textlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(adaptHeight1334(173*2+NAVIGATION_BAR_HEIGHT/2));
        make.left.mas_offset(adaptWidth750(30*2));
        make.width.mas_offset(adaptWidth750(316*2));
    }];
}

- (void)layoutSubviewsforalert {
 
    if (self.labels.count != self.itemCount) return;
    
    for (NSInteger i = 0; i < self.labels.count; i++)
    {
        UILabel *label = self.labels[i];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_offset(adaptHeight1334(50.5*2));
            make.left.mas_offset(adaptWidth750(15*2+i*48*2));
            make.height.mas_equalTo(adaptHeight1334(40*2));
            make.width.mas_equalTo(adaptWidth750(40*2));
        }];
        
        label.layer.cornerRadius = label.bounds.size.width/2;
        label.layer.masksToBounds = YES;
        
    }
    
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(adaptHeight1334(80*2));
        make.left.mas_offset(adaptWidth750(0));
        make.height.mas_equalTo(adaptHeight1334(40*2));
        make.width.mas_equalTo(adaptWidth750(310*2));
    }];
    [self.maskView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(adaptHeight1334(80*2));
        make.left.mas_offset(adaptWidth750(0));
        make.height.mas_equalTo(adaptHeight1334(40*2));
        make.width.mas_equalTo(adaptWidth750(310*2));
    }];
    UILabel *textlabel = [[UILabel alloc] init];
    textlabel.backgroundColor = [UIColor colorWithString:@"#FBFBFB"];
    textlabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:adaptFontSize(12*2)];
    textlabel.layer.borderColor = [[UIColor grayColor] CGColor];
    textlabel.text = _message;
    textlabel.lineBreakMode = NSTextAlignmentCenter;
    textlabel.numberOfLines = 0;
    [self addSubview:textlabel];
    
    UILabel *titlelabel = [UILabel new];
    titlelabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:adaptFontSize(14*2)];
    titlelabel.text = _title;
    titlelabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:titlelabel];
    
    [titlelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(adaptHeight1334(14*2));
        make.centerX.equalTo(self);
    }];
    [textlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(adaptHeight1334(173*2+NAVIGATION_BAR_HEIGHT/2));
        make.left.mas_offset(adaptWidth750(30*2));
        make.width.mas_offset(adaptWidth750(316*2));
    }];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if ([self.types isEqualToString:@"A"]) {
        [self layoutSubviewsforalert];
    } else {
        [self layoutSubviewsforcreatPsw];
    }
  
}


#pragma mark - 监控键盘弹出
- (void)keyboardWillShow:(NSNotification *)notification
{
    
    status=YES;
    
}


/**
 绘制label
 */
-(void)drawUI {
    
    for (int i = 0; i < self.itemCount; i++)
    {
        
        UILabel *label = [self.labels objectAtIndex:i];
        
        if (status) {
        }
        
        if (i < _textField.text.length) {
            label.text=@"*";
        } else {
            label.text = nil;
            
        }
        if(i==_textField.text.length){
        }
        
    }
    
    
    
}

- (void)tfEditingChanged:(UITextField *)textField
{
    
    if (textField.text.length > self.itemCount) {
        textField.text = [textField.text substringWithRange:NSMakeRange(0, self.itemCount)];
        
    }
    
    [self drawUI];
    
    if (self.tempStr.length < textField.text.length) {
        if (textField.text == nil || textField.text.length <= 0) {
            [self.lines.firstObject animation];
            
        } else if (textField.text.length >= self.itemCount) {
            [self.lines.lastObject animation];
            
            [self animation:self.labels.lastObject];
            
        } else {
            [self.lines[self.textField.text.length - 1] animation];
            UILabel *ff = self.labels[self.textField.text.length - 1];
            [self animation:ff];
        }
    }
    self.tempStr = textField.text;
    //     输入完毕后，自动隐藏键盘
    if (textField.text.length >= self.itemCount) {
        [textField resignFirstResponder];
    }
    
}

/**
 
 动画
 
 @param label <#label description#>
 */
- (void)animation:(UILabel *)label
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.duration = 0.15;
    animation.repeatCount = 1;
    animation.fromValue = @(0.1);
    animation.toValue = @(1);
    [label.layer addAnimation:animation forKey:@"zoom"];
}

- (void)clickMaskView
{
  
    [self.textField becomeFirstResponder];
}

- (BOOL)endEditing:(BOOL)force
{
    [self.textField endEditing:force];
    return [super endEditing:force];
}

- (NSString *)code
{
    return self.textField.text;
}

- (void)click:(UITapGestureRecognizer *)gesture {
    [self clickMaskView];
}
@end
