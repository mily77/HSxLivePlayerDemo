//
//  ViewController.m
//  HSxLivePlayerDemo
//
//  Created by emily on 2018/9/17.
//  Copyright © 2018年 emily. All rights reserved.
//

#import "ViewController.h"
#import "HSxLiveViewController.h"
#import "HSxPlayerViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)liveButtonAction:(id)sender {
    HSxLiveViewController *liveVC = [[HSxLiveViewController alloc] init];
    [self presentViewController:liveVC animated:YES completion:nil];
}
- (IBAction)playerButtonAction:(id)sender {
    HSxPlayerViewController *playerVC = [[HSxPlayerViewController alloc] init];
    [self presentViewController:playerVC animated:YES completion:nil];
}

@end
