//
//  HSxLiveViewController.m
//  HSxLivePlayerDemo
//
//  Created by emily on 2018/9/17.
//  Copyright © 2018年 emily. All rights reserved.
//

#import "HSxLiveViewController.h"
#import <LFLiveKit.h>
#import "HSxLiveView.h"
#import "HSxLiveSession.h"

@interface HSxLiveViewController ()<HSxLiveSessionDelegate>
@property (nonatomic, strong) LFLiveSession *session;
@property (nonatomic, strong) HSxLiveView *liveView;
@property (nonatomic, strong) HSxLiveSession *liveSession;
@end

@implementation HSxLiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    HSxLiveView *liveView = [[HSxLiveView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) completion:^(HSxLiveViewClick Click) {
        [self doSomeThingWithHSxLiveViewClick:(HSxLiveViewClick)Click];
    }];
    self.liveView = liveView;
    [self.view addSubview:liveView];
    
    HSxLiveSession *livewSession = [[HSxLiveSession alloc] initWithDefaultSessionWithdelegate:self preView:liveView];
    self.liveSession = livewSession;
}
-(void)liveCallBackMessage:(NSString *)callBackMessage {
    [self.liveView updateOnlyLiveVieWithMessage:callBackMessage];
}


-(void)doSomeThingWithHSxLiveViewClick:(HSxLiveViewClick)Click {
    switch (Click) {
        case HSxLiveViewClickStart:
        {
            [self liveSessionStartLive];
        }
            break;
        case HSxLiveViewClickStop:
        {
            [self.liveSession stopLive];
        }
            break;
        case HSxLiveViewClickResetCamera:
        {
            [self.liveSession resetCamera];
        }
            break;
        case HSxLiveViewClickClose:
        {
            [self dismissViewControllerAnimated:YES completion:nil];
        }
            break;
        case HSxLiveViewClickBeauty:
        {
            NSLog(@"dd");
            self.session.beautyFace = !self.session.beautyFace;
        }
            break;
            
        default:
            break;
    }
}

-(void)liveSessionStartLive {
    [self.liveSession startLiveWithStreamString:@"rtmp://192.168.6.68:1935/hls/77"];
}

@end
