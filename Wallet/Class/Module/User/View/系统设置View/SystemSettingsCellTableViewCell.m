//
//  SystemSettingsCellTableViewCell.m
//  Wallet
//
//  Created by 谷澍 on 2018/11/12.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "SystemSettingsCellTableViewCell.h"
#import "SetTouchID.h"
#import "LLTouchID.h"

@interface SystemSettingsCellTableViewCell ()

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *rightLabel;
@property (strong, nonatomic) UISwitch *switchTouchID;

@end
@implementation SystemSettingsCellTableViewCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configUI];
    }
    return self;
}

- (void)configUI {
    
    self.backgroundColor = [UIColor clearColor];
    
    [self addSubview:self.rightLabel];
    [self addSubview:self.titleLabel];
   
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(adaptHeight1334(14*2));
        make.left.mas_offset(adaptWidth750(22*2));
        make.height.mas_equalTo(adaptHeight1334(17*2));
    }];
    
    [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(adaptHeight1334(14*2));
        make.right.mas_offset(adaptWidth750(-41*2));
        make.height.mas_equalTo(adaptHeight1334(17*2));
    }];
  
}
-(void)drawUI{
     [self addSubview:self.switchTouchID];
    [self.switchTouchID mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(adaptHeight1334(10*2));
        make.right.mas_offset(adaptWidth750(-41*2));
        make.height.mas_equalTo(adaptHeight1334(16*2));
        make.width.mas_offset(adaptWidth750(36*2));
    }];
}

- (void)cornerRadius:(type)type {
    if (type == top) {
        [_titleLabel setText:@"指纹"];
        [self drawUI];
    } else if (type == medium){
         [_titleLabel setText:@"选择语言"];
         NSString * Language =  [[NSUserDefaults standardUserDefaults] objectForKey:@"Language"];
        [_rightLabel setText:Language];
    } else if (type == bottom) {
        
        [_titleLabel setText:@"选择货币"];
         NSString * currency =  [[NSUserDefaults standardUserDefaults] objectForKey:@"currency"];
         [_rightLabel setText:currency];
    } else  {
        
    }
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:adaptFontSize(14*2)];
        _titleLabel.textColor = GetColor(@"#444444");
    }
    return _titleLabel;
}

- (UILabel *)rightLabel {
    if (!_rightLabel) {
        _rightLabel = [[UILabel alloc] init];
        _rightLabel.font = [UIFont systemFontOfSize:adaptFontSize(14*2)];
        _rightLabel.textColor = GetColor(@"#444444");
    }
    return _rightLabel;
}

- (UISwitch *)switchTouchID {
    if (!_switchTouchID) {
        _switchTouchID = [[UISwitch alloc] init];
        NSString *state= [[NSUserDefaults standardUserDefaults] objectForKey:@"state"];
        if([state isEqualToString:@"YES"]){
             _switchTouchID.on=YES;
        }else{
             _switchTouchID.on=NO;
        }
       
        // 添加事件
        [_switchTouchID addTarget:self action:@selector(switchChange:) forControlEvents:UIControlEventValueChanged];   // 开关事件切换通知
    }
    return _switchTouchID;
}

-(void)switchChange:(id)sender{
    UISwitch* openbutton = (UISwitch*)sender;
    Boolean ison = openbutton.isOn;
    if(ison){
        NSLog(@"打开了");
        
        SetTouchID *manager =  [SetTouchID sharedInstance];
        [manager initOpenTouchID];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(isOpen) name:LLValidateTouchIDSuccess object:nil];
    }else{
        NSLog(@"关闭了");
        [[NSUserDefaults standardUserDefaults] setObject:@"NO" forKey:@"state"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}
-(void) isOpen {
    [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"state"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
