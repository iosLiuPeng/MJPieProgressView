//
//  MJPieProgressView.m
//  MJPieProgressView
//
//  Created by 刘鹏 on 2018/4/26.
//  Copyright © 2018年 musjoy. All rights reserved.
//

#import "MJPieProgressView.h"

@implementation MJPieProgressView
#pragma mark - Life Circle
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self viewConfig];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self viewConfig];
}

+(Class)layerClass
{
    return [CAShapeLayer class];
}

#pragma mark - Subjoin
- (void)viewConfig
{
    self.userInteractionEnabled = NO;
}

#pragma mark - Set & Get
- (void)setProgress:(CGFloat)progress
{
    if (progress >= 0 && progress <= 1) {
        _progress = progress;
        
        [self setNeedsDisplay];
    }
}

#pragma mark - Overwirte
- (void)drawRect:(CGRect)rect
{
    CGFloat width = rect.size.width;
    CGFloat height = rect.size.height;
    
    // 最短边
    CGFloat shortSide = MIN(width, height);
    // 半径
    CGFloat radius = shortSide / 2.0 - 1;
    if (_maxWidth > 0) {
        radius = MIN(_maxWidth, shortSide) / 2.0 - 1;
    }
    // 中心点
    CGPoint center = CGPointMake(width / 2.0, height / 2.0);
    
    // 圆环颜色
    UIColor *color = _annulusColor;
    if (color == nil) {
        if (_pieColor) {
            color = _pieColor;// 没有指颜色时，其次显示扇形填充色
        } else {
            color = _bgColor;// 最后显示扇形背景色
        }
    }
    
    // 画圆
    UIBezierPath *roundness = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:0 endAngle:2 * M_PI clockwise:YES];
    roundness.lineWidth = 1;
    if (_bgColor) {
        [_bgColor set];
        [roundness fill];
    }
    [color set];
    [roundness stroke];
    
    // 画扇形
    CGFloat startAngle = - M_PI / 2.0;
    CGFloat endAngle = _progress * 2 * M_PI + startAngle;
    UIBezierPath *sector = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
    [sector addLineToPoint:center];
    [_pieColor set];
    [sector fill];
}

@end
