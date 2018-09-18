//
//  HSxLiveSession.h
//  HSxLivePlayerDemo
//
//  Created by emily on 2018/9/12.
//  Copyright © 2018年 emily. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol HSxLiveSessionDelegate <NSObject>

// 返回的message
- (void)liveCallBackMessage:(NSString *)callBackMessage;

@end

@interface HSxLiveSession : NSObject
// 是否正在直播
@property (assign, nonatomic,readonly)  BOOL isPlaying;
//  传入代理和需要展示的父视图
- (instancetype)initWithDefaultSessionWithdelegate:(id<HSxLiveSessionDelegate>)delegate preView:(UIView *)preView;
// 根据需要推流的地址(rtmp地址)
- (void)startLiveWithStreamString:(NSString *)streamString;
// 停止直播
- (void)stopLive;
// 摄像头翻转
- (void)resetCamera;


@end

NS_ASSUME_NONNULL_END
