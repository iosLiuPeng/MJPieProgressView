//
//  ViewController.m
//  MJPieProgressView
//
//  Created by 刘鹏 on 2018/4/26.
//  Copyright © 2018年 musjoy. All rights reserved.
//

#import "ViewController.h"
#import "MJPieProgressView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet MJPieProgressView *view1;
@property (weak, nonatomic) IBOutlet MJPieProgressView *view2;
@property (weak, nonatomic) IBOutlet MJPieProgressView *view3;

@property (weak, nonatomic) IBOutlet UISlider *slider;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)sliderAction:(UISlider *)sender {
    _view1.progress = sender.value;
    _view2.progress = sender.value;
    _view3.progress = sender.value;
}


@end
