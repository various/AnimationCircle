//
//  ViewController.m
//  stokeEndStudy
//
//  Created by Tim Geng on 3/3/15.
//  Copyright (c) 2015 PwC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong) CAShapeLayer *layer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _layer = [CAShapeLayer layer];
    [self.view.layer addSublayer:_layer];
    _layer.strokeColor = [UIColor redColor].CGColor;
    _layer.fillColor = [UIColor clearColor].CGColor;
    _layer.lineWidth = 2.0;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 100) radius:100 startAngle:0 endAngle:M_PI * 2 - 0.1 clockwise:YES];
    _layer.path = path.CGPath;
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = 2.0;
    animation.fromValue = [NSNumber numberWithFloat:0.0];
    animation.toValue = [NSNumber numberWithFloat:1.0];
    animation.delegate = self;
    [_layer addAnimation:animation forKey:nil];

    self.layer.frame = CGRectMake(100, 100, 200, 200);
    //self.layer.backgroundColor = [UIColor blueColor].CGColor;
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.repeatCount = 10;
    animation.duration = 5.0;
    animation.fromValue = @(0);
    animation.toValue = @(2 * M_PI);
    [_layer addAnimation:animation forKey:nil];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
