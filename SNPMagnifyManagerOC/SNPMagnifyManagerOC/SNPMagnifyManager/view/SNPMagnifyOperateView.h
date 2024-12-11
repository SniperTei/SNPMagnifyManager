//
//  SNPMagnifyOperateView.h
//  SNPMagnifyManagerOC
//
//  Created by zhengnan on 2024/12/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// 拖拽视图，用于确定放大镜要放大的区域
@interface SNPMagnifyOperateView : UIView

// 是否可以拖拽
@property (nonatomic, assign) BOOL canMove;
// 移动的回调
@property (nonatomic, copy) void(^moveBlock)(CGRect frame);
// 移动范围
@property (nonatomic, assign) CGRect limitRect;

@end

NS_ASSUME_NONNULL_END
