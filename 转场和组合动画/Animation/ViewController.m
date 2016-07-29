//
//  ViewController.m
//  Animation
//
//  Created by Luxurious on 16/7/28.
//  Copyright © 2016年 yohe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *bigView;
@property (nonatomic,assign)int index;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
- (IBAction)preBtn:(id)sender;
- (IBAction)nextBtn:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onTap)];
    [self.bigView addGestureRecognizer:tap];
    self.index = 1;
    self.imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",self.index]];
    // Do any additional setup after loading the view, typically from a nib.
}
//组合动画
-(void)onTap
{
    //平移动画
    CABasicAnimation *an = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    an.toValue = @(100);
    //缩放动画
    CABasicAnimation *an2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    an2.toValue  = @(0.3);
    //旋转动画
    CABasicAnimation *an3 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    an3.toValue  =@(M_PI_2);
    
    //组合动画
    CAAnimationGroup *goup = [CAAnimationGroup animation];
    goup.animations = @[an,an2,an3];
    goup.duration = 2.0f;
    goup.removedOnCompletion = NO;
    goup.fillMode = kCAFillModeForwards;
    [self.bigView.layer addAnimation:goup forKey:nil];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)preBtn:(id)sender {
    self.index--;
    if(self.index<1)
    {
        self.index = 7;
    }
    self.imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",self.index]];
    //核心动画
    CATransition *ca = [CATransition animation];
    //设置过渡效果
    ca.type = @"cube";
    //设置动画的过渡方向
    ca.startProgress = 0.5;
    ca.subtype = kCATransitionFromTop;
    //设置时间
    ca.duration = 2.0;
    [self.imgView.layer addAnimation:ca forKey:nil];
}

- (IBAction)nextBtn:(id)sender {
    self.index++;
    if(self.index>7)
    {
        self.index = 1;
    }
    self.imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",self.index]];
    //核心动画
    CATransition *ca = [CATransition animation];
    //设置过渡效果
    ca.type = @"rippleEffect";
    //设置动画的过渡方向
    ca.subtype = kCATransitionFromBottom;
    //设置动画的起点
    ca.endProgress = 1;
    //设置时间
    ca.duration = 2.0;
    [self.imgView.layer addAnimation:ca forKey:nil];
}
@end
