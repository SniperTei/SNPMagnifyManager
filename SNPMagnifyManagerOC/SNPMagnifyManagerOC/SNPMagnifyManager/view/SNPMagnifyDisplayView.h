//
//  SNPMagnifyDisplayView.h
//  SNPMagnifyManagerOC
//
//  Created by zhengnan on 2024/12/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SNPMagnifyDisplayView : UIView

/** 目标视图 (注意: 传视图的Window 例子: self.view.window) */
@property (nonatomic, strong) UIView *targetWindow;

/**  目标视图展示位置 (放大镜需要展示的位置) */
@property (nonatomic, assign) CGPoint targetPoint;

/** 放大镜位置调整 (调整放大镜在原始位置上的偏移 Defalut: CGPointMake(0, 0)) */
@property (nonatomic, assign) CGPoint adjustPoint;

@end

NS_ASSUME_NONNULL_END
