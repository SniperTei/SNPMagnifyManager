//
//  SNPMagnifyManager.m
//  SNPMagnifyManagerOC
//
//  Created by zhengnan on 2024/12/11.
//

#import "SNPMagnifyManager.h"
#import "SNPMagnifyDisplayView.h"
#import "SNPMagnifyOperateView.h"

@interface SNPMagnifyManager ()
// 操作视图
@property (nonatomic, strong) SNPMagnifyOperateView *operateView;
// 展示视图
@property (nonatomic, strong) SNPMagnifyDisplayView *displayView;
// 限制视图范围
// @property (nonatomic, strong) SNPMagnifyMoveLimitView *limitView;

@end

@implementation SNPMagnifyManager

+ (instancetype)sharedManager {
    static SNPMagnifyManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[SNPMagnifyManager alloc] init];
    });
    return manager;
}

// 初始化操作和展示视图
// - (void)setupMagnifyWithOperateView:(CGRect)operateViewFrame displayView:(CGRect)displayViewFrame {
//     // 创建放大镜操作视图
//     SNPMagnifyOperateView *operateV = [[SNPMagnifyOperateView alloc] initWithFrame:operateViewFrame];
// //    [operateView addSubview:operateV];
//     _operateView = operateV;
//     // _operateView.backgroundColor = [UIColor redColor];
//     // 边框
//     _operateView.layer.borderWidth = 1;
//     _operateView.layer.borderColor = [UIColor blackColor].CGColor;
//     // 添加到window
//     UIWindow *window = [UIApplication sharedApplication].keyWindow;
//     [window addSubview:_operateView];
    
//     // 创建放大镜展示视图
//     SNPMagnifyDisplayView *displayV = [[SNPMagnifyDisplayView alloc] initWithFrame:displayViewFrame];
//     _displayView = displayV;
//     _displayView.backgroundColor = [UIColor blueColor];
//     _displayView.adjustPoint = CGPointMake(0, -1 * displayViewFrame.size.height * 0.5);
//     // 边框
//     _displayView.layer.borderWidth = 1;
//     _displayView.layer.borderColor = [UIColor blackColor].CGColor;
//     // 添加到window
//     [window addSubview:_displayView];
//     _displayView.targetWindow = window;
//     // _displayView.targetPoint = _operateView.center;
    
//     // weak
//     __weak typeof(self) weakSelf = self;
//     _operateView.moveBlock = ^(CGRect frame) {
//         // 通过frame计算center
//         CGPoint center = CGPointMake(frame.origin.x + frame.size.width * 0.5, frame.origin.y + frame.size.height * 0.5);
//         weakSelf.displayView.targetPoint = center;
//     };
// }

// 初始化操作视图
- (void)setupMagnifyWithOperateView:(CGRect)operateViewFrame limitRect:(CGRect)limitRect {
    // 创建放大镜操作视图
    SNPMagnifyOperateView *operateV = [[SNPMagnifyOperateView alloc] initWithFrame:operateViewFrame];
    _operateView = operateV;
    _operateView.backgroundColor = [UIColor clearColor];
    _operateView.limitRect = limitRect;
    // 边框
    _operateView.layer.borderWidth = 1;
    _operateView.layer.borderColor = [UIColor blackColor].CGColor;
    // 添加到window
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:_operateView];
}

// 初始化展示视图
- (void)setupMagnifyWithDisplayView:(CGRect)displayViewFrame {
    // 创建放大镜展示视图
    SNPMagnifyDisplayView *displayV = [[SNPMagnifyDisplayView alloc] initWithFrame:displayViewFrame];
    _displayView = displayV;
    _displayView.backgroundColor = [UIColor blueColor];
    _displayView.adjustPoint = CGPointMake(0, -1 * displayViewFrame.size.height * 0.5);
    // 边框
    _displayView.layer.borderWidth = 1;
    _displayView.layer.borderColor = [UIColor blackColor].CGColor;
    // 添加到window
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:_displayView];
    _displayView.targetWindow = window;
    // _displayView.targetPoint = _operateView.center;

    // weak
    __weak typeof(self) weakSelf = self;
    _operateView.moveBlock = ^(CGRect frame) {
        // 通过frame计算center
        CGPoint center = CGPointMake(frame.origin.x + frame.size.width * 0.5, frame.origin.y + frame.size.height * 0.5);
        weakSelf.displayView.targetPoint = center;
    };
}


// 销毁操作和展示视图
- (void)destroyMagnify {
    [_operateView removeFromSuperview];
    [_displayView removeFromSuperview];
    _operateView = nil;
    _displayView = nil;
}

@end
