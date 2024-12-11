//
//  SNPMagnifyDisplayView.m
//  SNPMagnifyManagerOC
//
//  Created by zhengnan on 2024/12/11.
//

#import "SNPMagnifyDisplayView.h"

@implementation SNPMagnifyDisplayView

// 重写初始化方法
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor blueColor];
    }
    return self;
}

- (void)setAdjustPoint:(CGPoint)adjustPoint {
    _adjustPoint = adjustPoint;
    [self setTargetPoint:self.targetPoint];
}

- (void)setTargetWindow:(UIView *)targetWindow {
    _targetWindow = targetWindow;
//    [self makeKeyAndVisible];
    [self setTargetPoint:self.targetPoint];

}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    //提前位移半个长宽的坑
    CGContextTranslateCTM(ctx, self.frame.size.width * 0.5, self.frame.size.height * 0.5);
    CGContextScaleCTM(ctx, 2.0, 2.0);
    //再次位移后就可以把触摸点移至self.center的位置
    CGContextTranslateCTM(ctx, -1 * self.targetPoint.x, -1 * self.targetPoint.y);
    [self.targetWindow.layer renderInContext:ctx];
}

- (void)setTargetPoint:(CGPoint)targetPoint {
    _targetPoint = targetPoint;
    if (self.targetWindow) {
        CGPoint center = CGPointMake(targetPoint.x, self.center.y);
        if (targetPoint.y > CGRectGetHeight(self.bounds) * 0.5) {
            center.y = targetPoint.y -  CGRectGetHeight(self.bounds) / 2;
        }
        self.center = CGPointMake(center.x + self.adjustPoint.x, center.y + self.adjustPoint.y);
        [self.layer setNeedsDisplay];
    }
}

@end
