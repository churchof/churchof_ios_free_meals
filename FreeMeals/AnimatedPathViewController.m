//
//  AnimatedPathViewController.m
//  AnimatedPath
//
//  Created by Ole Begemann on 08.12.10.
//  Copyright 2010 Ole Begemann. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <CoreText/CoreText.h>

#import "AnimatedPathViewController.h"



@implementation AnimatedPathViewController

@synthesize animationLayer = _animationLayer;
@synthesize pathLayer = _pathLayer;

@synthesize animationLayer2 = _animationLayer2;
@synthesize pathLayer2 = _pathLayer2;

@synthesize animationLayer3 = _animationLayer3;
@synthesize pathLayer3 = _pathLayer3;

@synthesize animationLayer4 = _animationLayer4;
@synthesize pathLayer4 = _pathLayer4;

@synthesize animationLayer5 = _animationLayer5;
@synthesize pathLayer5 = _pathLayer5;

@synthesize animationLayer6 = _animationLayer6;
@synthesize pathLayer6 = _pathLayer6;

@synthesize animationLayer7 = _animationLayer7;
@synthesize pathLayer7 = _pathLayer7;

@synthesize animationLayer8 = _animationLayer8;
@synthesize pathLayer8 = _pathLayer8;

@synthesize animationLayer9 = _animationLayer9;
@synthesize pathLayer9 = _pathLayer9;

@synthesize animationLayer10 = _animationLayer10;
@synthesize pathLayer10 = _pathLayer10;


- (void) setupDrawingLayer
{
    if (self.pathLayer != nil) {
        [self.pathLayer removeFromSuperlayer];
        self.pathLayer = nil;
    }
    
    CGRect pathRect = self.animationLayer.bounds;
    
    float radius = (CGRectGetWidth(pathRect) / 2);
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 2.0 * radius, 2.0 * radius) cornerRadius:radius];
    
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.frame = self.animationLayer.bounds;
    pathLayer.bounds = pathRect;
    pathLayer.geometryFlipped = YES;
    pathLayer.path = circlePath.CGPath;
    pathLayer.strokeColor = [[UIColor whiteColor] CGColor];
    pathLayer.fillColor = nil;
    pathLayer.lineWidth = 5.0f;
    pathLayer.lineJoin = kCALineJoinBevel;
    
    [self.animationLayer addSublayer:pathLayer];

    self.pathLayer = pathLayer;
    
    if (self.pathLayer2 != nil) {
        [self.pathLayer2 removeFromSuperlayer];
        self.pathLayer2 = nil;
    }
    
    CGRect pathRect2 = self.animationLayer2.bounds;
    
    float radius2 = (CGRectGetWidth(pathRect2) / 2);
    UIBezierPath *circlePath2 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 2.0 * radius2, 2.0 * radius2) cornerRadius:radius2];
    
    CAShapeLayer *pathLayer2 = [CAShapeLayer layer];
    pathLayer2.frame = self.animationLayer2.bounds;
    pathLayer2.bounds = pathRect2;
    pathLayer2.geometryFlipped = YES;
    pathLayer2.path = circlePath2.CGPath;
    pathLayer2.strokeColor = [[UIColor whiteColor] CGColor];
    pathLayer2.fillColor = nil;
    pathLayer2.lineWidth = 5.0f;
    pathLayer2.lineJoin = kCALineJoinBevel;
    
    [self.animationLayer2 addSublayer:pathLayer2];
    
    self.pathLayer2 = pathLayer2;

    
    if (self.pathLayer3 != nil) {
        [self.pathLayer3 removeFromSuperlayer];
        self.pathLayer3 = nil;
    }
    
    CGRect pathRect3 = self.animationLayer3.bounds;
    
    float radius3 = (CGRectGetWidth(pathRect3) / 2);
    UIBezierPath *circlePath3 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 2.0 * radius3, 2.0 * radius3) cornerRadius:radius3];
    
    CAShapeLayer *pathLayer3 = [CAShapeLayer layer];
    pathLayer3.frame = self.animationLayer3.bounds;
    pathLayer3.bounds = pathRect3;
    pathLayer3.geometryFlipped = YES;
    pathLayer3.path = circlePath3.CGPath;
    pathLayer3.strokeColor = [[UIColor whiteColor] CGColor];
    pathLayer3.fillColor = nil;
    pathLayer3.lineWidth = 5.0f;
    pathLayer3.lineJoin = kCALineJoinBevel;
    
    [self.animationLayer3 addSublayer:pathLayer3];
    
    self.pathLayer3 = pathLayer3;

    
    if (self.pathLayer4 != nil) {
        [self.pathLayer4 removeFromSuperlayer];
        self.pathLayer4 = nil;
    }
    
    CGRect pathRect4 = self.animationLayer4.bounds;
    
    float radius4 = (CGRectGetWidth(pathRect4) / 2);
    UIBezierPath *circlePath4 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 2.0 * radius4, 2.0 * radius4) cornerRadius:radius4];
    
    CAShapeLayer *pathLayer4 = [CAShapeLayer layer];
    pathLayer4.frame = self.animationLayer4.bounds;
    pathLayer4.bounds = pathRect4;
    pathLayer4.geometryFlipped = YES;
    pathLayer4.path = circlePath4.CGPath;
    pathLayer4.strokeColor = [[UIColor whiteColor] CGColor];
    pathLayer4.fillColor = nil;
    pathLayer4.lineWidth = 5.0f;
    pathLayer4.lineJoin = kCALineJoinBevel;
    
    [self.animationLayer4 addSublayer:pathLayer4];
    
    self.pathLayer4 = pathLayer4;

    
    if (self.pathLayer5 != nil) {
        [self.pathLayer5 removeFromSuperlayer];
        self.pathLayer5 = nil;
    }
    
    CGRect pathRect5 = self.animationLayer5.bounds;
    
    float radius5 = (CGRectGetWidth(pathRect5) / 2);
    UIBezierPath *circlePath5 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 2.0 * radius5, 2.0 * radius5) cornerRadius:radius5];
    
    CAShapeLayer *pathLayer5 = [CAShapeLayer layer];
    pathLayer5.frame = self.animationLayer5.bounds;
    pathLayer5.bounds = pathRect5;
    pathLayer5.geometryFlipped = YES;
    pathLayer5.path = circlePath5.CGPath;
    pathLayer5.strokeColor = [[UIColor whiteColor] CGColor];
    pathLayer5.fillColor = nil;
    pathLayer5.lineWidth = 5.0f;
    pathLayer5.lineJoin = kCALineJoinBevel;
    
    [self.animationLayer5 addSublayer:pathLayer5];
    
    self.pathLayer5 = pathLayer5;

    
    
    
    
    
    if (self.pathLayer6 != nil) {
        [self.pathLayer6 removeFromSuperlayer];
        self.pathLayer6 = nil;
    }
    
    CGRect pathRect6 = self.animationLayer6.bounds;

    UIBezierPath *linePath6 = [UIBezierPath bezierPath];
    [linePath6 moveToPoint: CGPointMake(.28 * (CGRectGetWidth(self.view.layer.bounds) - 80.0f), (1.0 - .38) * (CGRectGetWidth(self.view.layer.bounds) - 80.0f))];
    [linePath6 addLineToPoint:CGPointMake(.56 * (CGRectGetWidth(self.view.layer.bounds) - 80.0f), (1.0 - .35) * (CGRectGetWidth(self.view.layer.bounds) - 80.0f))];
    
    CAShapeLayer *pathLayer6 = [CAShapeLayer layer];
    pathLayer6.frame = self.animationLayer.bounds;
    pathLayer6.bounds = pathRect6;
    pathLayer6.geometryFlipped = YES;
    pathLayer6.path = linePath6.CGPath;
    pathLayer6.strokeColor = [[UIColor whiteColor] CGColor];
    pathLayer6.fillColor = nil;
    pathLayer6.lineWidth = 5.0f;
    pathLayer6.lineJoin = kCALineJoinBevel;
    
    [self.animationLayer6 addSublayer:pathLayer6];
    
    self.pathLayer6 = pathLayer6;
    
    
    
    
    if (self.pathLayer7 != nil) {
        [self.pathLayer7 removeFromSuperlayer];
        self.pathLayer7 = nil;
    }
    
    CGRect pathRect7 = self.animationLayer7.bounds;
    
    UIBezierPath *linePath7 = [UIBezierPath bezierPath];
    [linePath7 moveToPoint: CGPointMake(.25 * (CGRectGetWidth(self.view.layer.bounds) - 80.0f), (1.0 - .44) * (CGRectGetWidth(self.view.layer.bounds) - 80.0f))];
    [linePath7 addLineToPoint:CGPointMake(.36 * (CGRectGetWidth(self.view.layer.bounds) - 80.0f), (1.0 - .68) * (CGRectGetWidth(self.view.layer.bounds) - 80.0f))];
    
    CAShapeLayer *pathLayer7 = [CAShapeLayer layer];
    pathLayer7.frame = self.animationLayer.bounds;
    pathLayer7.bounds = pathRect7;
    pathLayer7.geometryFlipped = YES;
    pathLayer7.path = linePath7.CGPath;
    pathLayer7.strokeColor = [[UIColor whiteColor] CGColor];
    pathLayer7.fillColor = nil;
    pathLayer7.lineWidth = 5.0f;
    pathLayer7.lineJoin = kCALineJoinBevel;
    
    [self.animationLayer7 addSublayer:pathLayer7];
    
    self.pathLayer7 = pathLayer7;

    
    
    if (self.pathLayer8 != nil) {
        [self.pathLayer8 removeFromSuperlayer];
        self.pathLayer8 = nil;
    }
    
    CGRect pathRect8 = self.animationLayer8.bounds;
    
    UIBezierPath *linePath8 = [UIBezierPath bezierPath];
    [linePath8 moveToPoint: CGPointMake(.27 * (CGRectGetWidth(self.view.layer.bounds) - 80.0f), (1.0 - .42) * (CGRectGetWidth(self.view.layer.bounds) - 80.0f))];
    [linePath8 addLineToPoint:CGPointMake(.64 * (CGRectGetWidth(self.view.layer.bounds) - 80.0f), (1.0 - .62) * (CGRectGetWidth(self.view.layer.bounds) - 80.0f))];
    
    CAShapeLayer *pathLayer8 = [CAShapeLayer layer];
    pathLayer8.frame = self.animationLayer.bounds;
    pathLayer8.bounds = pathRect8;
    pathLayer8.geometryFlipped = YES;
    pathLayer8.path = linePath8.CGPath;
    pathLayer8.strokeColor = [[UIColor whiteColor] CGColor];
    pathLayer8.fillColor = nil;
    pathLayer8.lineWidth = 5.0f;
    pathLayer8.lineJoin = kCALineJoinBevel;
    
    [self.animationLayer8 addSublayer:pathLayer8];
    
    self.pathLayer8 = pathLayer8;

    
    
    if (self.pathLayer9 != nil) {
        [self.pathLayer9 removeFromSuperlayer];
        self.pathLayer9 = nil;
    }
    
    CGRect pathRect9 = self.animationLayer9.bounds;
    
    UIBezierPath *linePath9 = [UIBezierPath bezierPath];
    [linePath9 moveToPoint: CGPointMake(.42 * (CGRectGetWidth(self.view.layer.bounds) - 80.0f), (1.0 - .68) * (CGRectGetWidth(self.view.layer.bounds) - 80.0f))];
    [linePath9 addLineToPoint:CGPointMake(.60 * (CGRectGetWidth(self.view.layer.bounds) - 80.0f), (1.0 - .41) * (CGRectGetWidth(self.view.layer.bounds) - 80.0f))];
    
    CAShapeLayer *pathLayer9 = [CAShapeLayer layer];
    pathLayer9.frame = self.animationLayer.bounds;
    pathLayer9.bounds = pathRect9;
    pathLayer9.geometryFlipped = YES;
    pathLayer9.path = linePath9.CGPath;
    pathLayer9.strokeColor = [[UIColor whiteColor] CGColor];
    pathLayer9.fillColor = nil;
    pathLayer9.lineWidth = 5.0f;
    pathLayer9.lineJoin = kCALineJoinBevel;
    
    [self.animationLayer9 addSublayer:pathLayer9];
    
    self.pathLayer9 = pathLayer9;

    
    if (self.pathLayer10 != nil) {
        [self.pathLayer10 removeFromSuperlayer];
        self.pathLayer10 = nil;
    }
    
    CGRect pathRect10 = self.animationLayer10.bounds;
    
    UIBezierPath *linePath10 = [UIBezierPath bezierPath];
    [linePath10 moveToPoint: CGPointMake(.67 * (CGRectGetWidth(self.view.layer.bounds) - 80.0f), (1.0 - .43) * (CGRectGetWidth(self.view.layer.bounds) - 80.0f))];
    [linePath10 addLineToPoint:CGPointMake(.69 * (CGRectGetWidth(self.view.layer.bounds) - 80.0f), (1.0 - .59) * (CGRectGetWidth(self.view.layer.bounds) - 80.0f))];
    
    CAShapeLayer *pathLayer10 = [CAShapeLayer layer];
    pathLayer10.frame = self.animationLayer.bounds;
    pathLayer10.bounds = pathRect10;
    pathLayer10.geometryFlipped = YES;
    pathLayer10.path = linePath10.CGPath;
    pathLayer10.strokeColor = [[UIColor whiteColor] CGColor];
    pathLayer10.fillColor = nil;
    pathLayer10.lineWidth = 5.0f;
    pathLayer10.lineJoin = kCALineJoinBevel;
    
    [self.animationLayer10 addSublayer:pathLayer10];
    
    self.pathLayer10 = pathLayer10;


}


- (void) startAnimation
{
    [self.pathLayer removeAllAnimations];
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 2.0;
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    [self.pathLayer addAnimation:pathAnimation forKey:@"strokeEnd"];
    
    [self.pathLayer2 removeAllAnimations];
    CABasicAnimation *pathAnimation2 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation2.duration = 1.8;
    pathAnimation2.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation2.toValue = [NSNumber numberWithFloat:1.0f];
    [self.pathLayer2 addAnimation:pathAnimation2 forKey:@"strokeEnd"];

    [self.pathLayer3 removeAllAnimations];
    CABasicAnimation *pathAnimation3 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation3.duration = 1.2;
    pathAnimation3.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation3.toValue = [NSNumber numberWithFloat:1.0f];
    [self.pathLayer3 addAnimation:pathAnimation3 forKey:@"strokeEnd"];

    [self.pathLayer4 removeAllAnimations];
    CABasicAnimation *pathAnimation4 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation4.duration = 1.4;
    pathAnimation4.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation4.toValue = [NSNumber numberWithFloat:1.0f];
    [self.pathLayer4 addAnimation:pathAnimation4 forKey:@"strokeEnd"];

    [self.pathLayer5 removeAllAnimations];
    CABasicAnimation *pathAnimation5 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation5.duration = 1.5;
    pathAnimation5.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation5.toValue = [NSNumber numberWithFloat:1.0f];
    [self.pathLayer5 addAnimation:pathAnimation5 forKey:@"strokeEnd"];

    [self.pathLayer6 removeAllAnimations];
    CABasicAnimation *pathAnimation6 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation6.duration = 1.0;
    pathAnimation6.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation6.toValue = [NSNumber numberWithFloat:1.0f];
    [self.pathLayer6 addAnimation:pathAnimation6 forKey:@"strokeEnd"];

    [self.pathLayer7 removeAllAnimations];
    CABasicAnimation *pathAnimation7 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation7.duration = 1.8;
    pathAnimation7.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation7.toValue = [NSNumber numberWithFloat:1.0f];
    [self.pathLayer7 addAnimation:pathAnimation7 forKey:@"strokeEnd"];

    [self.pathLayer8 removeAllAnimations];
    CABasicAnimation *pathAnimation8 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation8.duration = 1.2;
    pathAnimation8.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation8.toValue = [NSNumber numberWithFloat:1.0f];
    [self.pathLayer8 addAnimation:pathAnimation8 forKey:@"strokeEnd"];

    [self.pathLayer9 removeAllAnimations];
    CABasicAnimation *pathAnimation9 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation9.duration = 1.8;
    pathAnimation9.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation9.toValue = [NSNumber numberWithFloat:1.0f];
    [self.pathLayer9 addAnimation:pathAnimation9 forKey:@"strokeEnd"];

    [self.pathLayer10 removeAllAnimations];
    CABasicAnimation *pathAnimation10 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation10.duration = 1.5;
    pathAnimation10.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation10.toValue = [NSNumber numberWithFloat:1.0f];
    [self.pathLayer10 addAnimation:pathAnimation10 forKey:@"strokeEnd"];

}


- (void) animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{

}

- (void)viewDidLoad 
{
    [super viewDidLoad];
    
    self.animationLayer = [CALayer layer];
    self.animationLayer.frame = CGRectMake(40.0f, (CGRectGetHeight(self.view.layer.bounds) / 2 - ((CGRectGetWidth(self.view.layer.bounds) - 80.0f) / 2)),
                                           CGRectGetWidth(self.view.layer.bounds) - 80.0f,
                                           CGRectGetWidth(self.view.layer.bounds) - 80.0f);
    [self.view.layer addSublayer:self.animationLayer];
    
    
    float x2 = .55 * (CGRectGetWidth(self.view.layer.bounds) - 80.0f);
    float y2 = .22 * (CGRectGetWidth(self.view.layer.bounds) - 80.0f);
    float circumference2 = .22 * (CGRectGetWidth(self.view.layer.bounds) - 80.0f);
    self.animationLayer2 = [CALayer layer];
    self.animationLayer2.frame = CGRectMake(40.0f + x2, (CGRectGetHeight(self.view.layer.bounds) / 2 - ((CGRectGetWidth(self.view.layer.bounds) - 80.0f) / 2) + y2),
                                           circumference2,
                                           circumference2);
    [self.view.layer addSublayer:self.animationLayer2];

    
    float x3 = .63 * (CGRectGetWidth(self.view.layer.bounds) - 80.0f);
    float y3 = .58 * (CGRectGetWidth(self.view.layer.bounds) - 80.0f);
    float circumference3 = .14 * (CGRectGetWidth(self.view.layer.bounds) - 80.0f);
    self.animationLayer3 = [CALayer layer];
    self.animationLayer3.frame = CGRectMake(40.0f + x3, (CGRectGetHeight(self.view.layer.bounds) / 2 - ((CGRectGetWidth(self.view.layer.bounds) - 80.0f) / 2) + y3),
                                            circumference3,
                                            circumference3);
    [self.view.layer addSublayer:self.animationLayer3];

    
    float x4 = .17 * (CGRectGetWidth(self.view.layer.bounds) - 80.0f);
    float y4 = .33 * (CGRectGetWidth(self.view.layer.bounds) - 80.0f);
    float circumference4 = .12 * (CGRectGetWidth(self.view.layer.bounds) - 80.0f);
    self.animationLayer4 = [CALayer layer];
    self.animationLayer4.frame = CGRectMake(40.0f + x4, (CGRectGetHeight(self.view.layer.bounds) / 2 - ((CGRectGetWidth(self.view.layer.bounds) - 80.0f) / 2) + y4),
                                            circumference4,
                                            circumference4);
    [self.view.layer addSublayer:self.animationLayer4];

    
    float x5 = .33 * (CGRectGetWidth(self.view.layer.bounds) - 80.0f);
    float y5 = .67 * (CGRectGetWidth(self.view.layer.bounds) - 80.0f);
    float circumference5 = .13 * (CGRectGetWidth(self.view.layer.bounds) - 80.0f);
    self.animationLayer5 = [CALayer layer];
    self.animationLayer5.frame = CGRectMake(40.0f + x5, (CGRectGetHeight(self.view.layer.bounds) / 2 - ((CGRectGetWidth(self.view.layer.bounds) - 80.0f) / 2) + y5),
                                            circumference5,
                                            circumference5);
    [self.view.layer addSublayer:self.animationLayer5];
    
    self.animationLayer6 = [CALayer layer];
    self.animationLayer6.frame = CGRectMake(40.0f, (CGRectGetHeight(self.view.layer.bounds) / 2 - ((CGRectGetWidth(self.view.layer.bounds) - 80.0f) / 2)),
                                           CGRectGetWidth(self.view.layer.bounds) - 80.0f,
                                           CGRectGetWidth(self.view.layer.bounds) - 80.0f);
    [self.view.layer addSublayer:self.animationLayer6];

    self.animationLayer7 = [CALayer layer];
    self.animationLayer7.frame = CGRectMake(40.0f, (CGRectGetHeight(self.view.layer.bounds) / 2 - ((CGRectGetWidth(self.view.layer.bounds) - 80.0f) / 2)),
                                           CGRectGetWidth(self.view.layer.bounds) - 80.0f,
                                           CGRectGetWidth(self.view.layer.bounds) - 80.0f);
    [self.view.layer addSublayer:self.animationLayer7];

    self.animationLayer8 = [CALayer layer];
    self.animationLayer8.frame = CGRectMake(40.0f, (CGRectGetHeight(self.view.layer.bounds) / 2 - ((CGRectGetWidth(self.view.layer.bounds) - 80.0f) / 2)),
                                           CGRectGetWidth(self.view.layer.bounds) - 80.0f,
                                           CGRectGetWidth(self.view.layer.bounds) - 80.0f);
    [self.view.layer addSublayer:self.animationLayer8];

    self.animationLayer9 = [CALayer layer];
    self.animationLayer9.frame = CGRectMake(40.0f, (CGRectGetHeight(self.view.layer.bounds) / 2 - ((CGRectGetWidth(self.view.layer.bounds) - 80.0f) / 2)),
                                           CGRectGetWidth(self.view.layer.bounds) - 80.0f,
                                           CGRectGetWidth(self.view.layer.bounds) - 80.0f);
    [self.view.layer addSublayer:self.animationLayer9];

    self.animationLayer10 = [CALayer layer];
    self.animationLayer10.frame = CGRectMake(40.0f, (CGRectGetHeight(self.view.layer.bounds) / 2 - ((CGRectGetWidth(self.view.layer.bounds) - 80.0f) / 2)),
                                           CGRectGetWidth(self.view.layer.bounds) - 80.0f,
                                           CGRectGetWidth(self.view.layer.bounds) - 80.0f);
    [self.view.layer addSublayer:self.animationLayer10];

    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(exit)
     name:@"LoadingFinished"
     object:nil];

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self setupDrawingLayer];
    [self startAnimation];
}

- (void)exit
{
    [self performSelector:@selector(exitOnceAnimationCompleted) withObject:nil afterDelay:1.8];
}

- (void)exitOnceAnimationCompleted
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)dealloc 
{
    self.animationLayer = nil;
    self.pathLayer = nil;
}


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation 
{
    return UIInterfaceOrientationIsPortrait(interfaceOrientation);
}

- (void)viewDidUnload 
{
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

@end