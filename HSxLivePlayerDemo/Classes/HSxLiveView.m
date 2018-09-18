//
//  HSxLiveView.m
//  HSxLivePlayerDemo
//
//  Created by emily on 2018/9/12.
//  Copyright © 2018年 emily. All rights reserved.
//

#import "HSxLiveView.h"
#import "UIView+YYAdd.h"

@interface HSxLiveView ()

@property (nonatomic, strong) UIButton *beautyButton;
@property (nonatomic, strong) UIButton *cameraButton;
@property (nonatomic, strong) UIButton *closeButton;
@property (nonatomic, strong) UIButton *startLiveButton;
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UILabel *stateLabel;
@property (nonatomic, strong) HSxLiveClickCompletion liveCompletion;

@end

@implementation HSxLiveView

-(instancetype)initWithFrame:(CGRect)frame completion:(HSxLiveClickCompletion)completion {
    if (self = [super initWithFrame:frame]) {
        self.liveCompletion = completion;
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:self.containerView];
        [self.containerView addSubview:self.stateLabel];
        [self.containerView addSubview:self.closeButton];
        [self.containerView addSubview:self.cameraButton];
        [self.containerView addSubview:self.beautyButton];
        [self.containerView addSubview:self.startLiveButton];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:self.containerView];
        [self.containerView addSubview:self.stateLabel];
        [self.containerView addSubview:self.closeButton];
        [self.containerView addSubview:self.cameraButton];
        [self.containerView addSubview:self.beautyButton];
        [self.containerView addSubview:self.startLiveButton];
    }
    return self;
}

-(void)updateOnlyLiveVieWithMessage:(NSString *)message {
    self.stateLabel.text = message;
}

- (UIView *)containerView {
    if (!_containerView) {
        _containerView = [UIView new];
        _containerView.frame = self.bounds;
        _containerView.backgroundColor = [UIColor clearColor];
        _containerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return _containerView;
}

- (UILabel *)stateLabel {
    if (!_stateLabel) {
        _stateLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 80, 40)];
        _stateLabel.text = @"未连接";
        _stateLabel.textColor = [UIColor whiteColor];
        _stateLabel.font = [UIFont boldSystemFontOfSize:14.f];
    }
    return _stateLabel;
}

- (UIButton *)closeButton {
    if (!_closeButton) {
        _closeButton = [UIButton new];
        _closeButton.tag = HSxLiveViewClickClose;
        _closeButton.size = CGSizeMake(44, 44);
        _closeButton.left = self.width - 10 - _closeButton.width;
        _closeButton.top = 20;
        [_closeButton setImage:[UIImage imageNamed:@"close_preview"] forState:UIControlStateNormal];
        _closeButton.exclusiveTouch = YES;
        [_closeButton addTarget:self action:@selector(liveViewClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeButton;
}

-(UIButton *)cameraButton {
    if (!_cameraButton) {
        _cameraButton = [[UIButton alloc] init];
        _cameraButton.tag = HSxLiveViewClickResetCamera;
        _cameraButton.size = CGSizeMake(44, 44);
        _cameraButton.origin = CGPointMake(_closeButton.left - 10 - _cameraButton.width, 20);
        [_cameraButton setImage:[UIImage imageNamed:@"camra_preview"] forState:UIControlStateNormal];
        _cameraButton.exclusiveTouch = YES;
        [_cameraButton addTarget:self action:@selector(liveViewClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cameraButton;
}
- (UIButton *)beautyButton {
    if (!_beautyButton) {
        _beautyButton = [UIButton new];
        _beautyButton.tag = HSxLiveViewClickBeauty;
        _beautyButton.size = CGSizeMake(44, 44);
        _beautyButton.origin = CGPointMake(_cameraButton.left - 10 - _beautyButton.width, 20);
        [_beautyButton setImage:[UIImage imageNamed:@"camra_beauty"] forState:UIControlStateNormal];
        [_beautyButton setImage:[UIImage imageNamed:@"camra_beauty_close"] forState:UIControlStateSelected];
        _beautyButton.exclusiveTouch = YES;
        [_beautyButton addTarget:self action:@selector(liveViewClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _beautyButton;
}

- (UIButton *)startLiveButton {
    if (!_startLiveButton) {
        _startLiveButton = [UIButton new];
        _startLiveButton.size = CGSizeMake(self.width - 60, 44);
        _startLiveButton.left = 30;
        _startLiveButton.bottom = self.height - 50;
        _startLiveButton.layer.cornerRadius = _startLiveButton.height/2;
        [_startLiveButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_startLiveButton.titleLabel setFont:[UIFont systemFontOfSize:16]];
        [_startLiveButton setTitle:@"开始直播" forState:UIControlStateNormal];
        [_startLiveButton setBackgroundColor:[UIColor colorWithRed:50 green:32 blue:245 alpha:1]];
        _startLiveButton.exclusiveTouch = YES;
        [_startLiveButton addTarget:self action:@selector(startLiveButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _startLiveButton;
}

-(void)liveViewClick:(UIButton *)sender {
    self.liveCompletion(sender.tag);
}

-(void)startLiveButtonClick:(UIButton *)sender {
    self.startLiveButton.selected = !self.startLiveButton.selected;
    if (!self.startLiveButton.selected) {
        [self.startLiveButton setTitle:@"开始直播" forState:UIControlStateNormal];
        self.liveCompletion(HSxLiveViewClickStop);
    } else {
        [self.startLiveButton setTitle:@"结束直播" forState:UIControlStateNormal];
        self.liveCompletion(HSxLiveViewClickStart);
    }
}
@end
