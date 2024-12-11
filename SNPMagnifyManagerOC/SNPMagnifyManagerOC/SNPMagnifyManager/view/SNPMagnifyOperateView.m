//
//  SNPMagnifyOperateView.m
//  SNPMagnifyManagerOC
//
//  Created by zhengnan on 2024/12/11.
//

#import "SNPMagnifyOperateView.h"

@interface SNPMagnifyOperateView ()<UIGestureRecognizerDelegate>

@property (nonatomic, strong) UILabel *addLabel;
// 添加pan手势
@property (nonatomic, strong) UIPanGestureRecognizer *pan;
// startPoint
@property (nonatomic, assign) CGPoint startPoint;

@end

@implementation SNPMagnifyOperateView

// 重写初始化方法
- (instancetype)initWithFrame:(CGRect)frame {
   if (self = [super initWithFrame:frame]) {
       self.backgroundColor = [UIColor clearColor];
       [self setup];
   }
   return self;
}

- (void)setup {
    // 添加pan手势
    self.pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    [self addGestureRecognizer:self.pan];

}

#pragma mark - pan手势
- (void)panAction:(UIPanGestureRecognizer *)pan {
    // if (!self.canMove) { // 不可以拖拽
    //     return;
    // }
    switch (pan.state) {
        case UIGestureRecognizerStateBegan:
            NSLog(@"开始拖拽");
            [pan setTranslation:CGPointZero inView:self];
            self.startPoint = [pan translationInView:self];
            break;
        case UIGestureRecognizerStateChanged:
            // NSLog(@"正在拖拽");
            [self moveViewWithPan:pan];
            break;
        case UIGestureRecognizerStateEnded:
            NSLog(@"结束拖拽");
            break;
        default:
            break;
    }
}

- (void)moveViewWithPan:(UIPanGestureRecognizer *)pan {
    // 获取偏移量
    CGPoint transP = [pan translationInView:self];
    // 如果有设置移动范围
    // if (self.limitRect.size.width > 0 && self.limitRect.size.height > 0) {
    //     // 计算frame
    //     CGRect frame = self.frame;
    //     frame.origin.x += transP.x;
    //     frame.origin.y += transP.y;
    //     // 判断frame是否超出限制范围
    //     if (!CGRectContainsRect(self.limitRect, frame)) {
    //         return;
    //     }
    // }

    // 修改操作视图的位置
    self.transform = CGAffineTransformTranslate(self.transform, transP.x, transP.y);
    // 复位
    [pan setTranslation:CGPointZero inView:self];
    // 打印self.frame
    // NSLog(@"self.frame: %@", NSStringFromCGRect(self.frame));
    // 打印self.center
    // NSLog(@"self.center: %@", NSStringFromCGPoint(self.center));
    if (self.moveBlock) {
        self.moveBlock(self.frame);
    }
}

@end
