//
//  SNPMagnifyManager.h
//  SNPMagnifyManagerOC
//
//  Created by zhengnan on 2024/12/11.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SNPMagnifyManager : NSObject

// 单例
+ (instancetype)sharedManager;

// 只读的操作视图
@property (nonatomic, strong, readonly) UIView *operationView;

- (void)setupMagnifyWithOperateView:(CGRect)operateViewFrame limitRect:(CGRect)limitRect;

- (void)setupMagnifyWithDisplayView:(CGRect)displayViewFrame;

@end

NS_ASSUME_NONNULL_END
