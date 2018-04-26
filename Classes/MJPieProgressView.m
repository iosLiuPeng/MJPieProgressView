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
    _pieColor = [[UIColor whiteColor] colorWithAlphaComponent:0.7];
    _maxWidth = 50.0;
    
    self.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3];
    self.userInteractionEnabled = NO;
}

#pragma mark - set & get
- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    [self setNeedsDisplay];
}

- (void)setMaxWidth:(CGFloat)maxWidth
{
    _maxWidth = maxWidth;
    [self setNeedsDisplay];
}

- (void)setPieColor:(UIColor *)pieColor
{
    _pieColor = pieColor;
    [self setNeedsDisplay];
}

#pragma mark - Overwirte
- (void)drawRect:(CGRect)rect
{
    CGFloat width = rect.size.width;
    CGFloat height = rect.size.height;
    
    //最短边
    CGFloat shortSide = MIN(width, height);
    //半径
    CGFloat radius = MIN(_maxWidth, shortSide) / 2.0 - 1;
    
    //获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //画圆环
    CGContextAddArc(context, width / 2.0, height / 2.0, radius, 0, 2 * M_PI, 0);
    CGContextSetStrokeColorWithColor(context, _pieColor.CGColor);//设置笔触颜色
    CGContextSetLineWidth(context, 1.0);//设置线条宽度
    CGContextStrokePath(context);//绘画路径
    
    
    //进度
    CGFloat progress = 0;
    if (_progress < 0) {
        progress = 0;
    } else if (_progress > 1) {
        progress = 1;
    } else {
        progress = _progress;
    }
    
    //画扇形
    CGFloat startAngle = - M_PI / 2.0;
    CGFloat endAngle = progress * 2 * M_PI + startAngle;
    CGContextAddArc(context, width / 2.0, height / 2.0, radius, startAngle, endAngle, 0);
    CGContextAddLineToPoint(context, width / 2.0, height / 2.0);
    CGContextClosePath(context);
    CGContextSetFillColorWithColor(context, _pieColor.CGColor);//填充色
    CGContextFillPath(context);//绘画路径
}

@end
