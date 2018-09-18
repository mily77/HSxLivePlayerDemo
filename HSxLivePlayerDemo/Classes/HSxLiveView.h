//
//  HSxLiveView.h
//  HSxLivePlayerDemo
//
//  Created by emily on 2018/9/12.
//  Copyright © 2018年 emily. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, HSxLiveViewClick) {
    HSxLiveViewClickStart = 101,
    HSxLiveViewClickStop = 102,
    HSxLiveViewClickResetCamera = 103,
    HSxLiveViewClickBeauty = 104,
    HSxLiveViewClickClose =105,
};

typedef void(^HSxLiveClickCompletion)(HSxLiveViewClick Click);

@interface HSxLiveView : UIView
-(instancetype)initWithFrame:(CGRect)frame completion:(HSxLiveClickCompletion)completion;

- (void)updateOnlyLiveVieWithMessage:(NSString *)message;
@end

NS_ASSUME_NONNULL_END
