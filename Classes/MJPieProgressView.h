//
//  MJPieProgressView.h
//  MJPieProgressView
//
//  Created by 刘鹏 on 2018/4/26.
//  Copyright © 2018年 musjoy. All rights reserved.
//  饼状图进度条

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface MJPieProgressView : UIView
@property (nonatomic, assign) IBInspectable CGFloat progress;     ///< 进度
@property (nonatomic, strong) IBInspectable UIColor *pieColor;    ///< 扇形颜色
@property (nonatomic, strong) IBInspectable UIColor *annulusColor;///< 圆环颜色
@property (nonatomic, strong) IBInspectable UIColor *bgColor;     ///< 扇形背景颜色

@property (nonatomic, assign) IBInspectable CGFloat maxWidth;     ///< 最大宽度
@end
