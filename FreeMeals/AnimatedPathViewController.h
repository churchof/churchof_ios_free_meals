//
//  AnimatedPathViewController.h
//  AnimatedPath
//
//  Created by Ole Begemann on 08.12.10.
//  Copyright 2010 Ole Begemann. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>



@interface AnimatedPathViewController : UIViewController 
{
	CALayer *_animationLayer;
    CAShapeLayer *_pathLayer;
    
    CALayer *_animationLayer2;
    CAShapeLayer *_pathLayer2;

    CALayer *_animationLayer3;
    CAShapeLayer *_pathLayer3;

    CALayer *_animationLayer4;
    CAShapeLayer *_pathLayer4;

    CALayer *_animationLayer5;
    CAShapeLayer *_pathLayer5;
    
    CALayer *_animationLayer6;
    CAShapeLayer *_pathLayer6;

    CALayer *_animationLayer7;
    CAShapeLayer *_pathLayer7;

    CALayer *_animationLayer8;
    CAShapeLayer *_pathLayer8;

    CALayer *_animationLayer9;
    CAShapeLayer *_pathLayer9;

    CALayer *_animationLayer10;
    CAShapeLayer *_pathLayer10;
}

@property (nonatomic, retain) CALayer *animationLayer;
@property (nonatomic, retain) CAShapeLayer *pathLayer;

@property (nonatomic, retain) CALayer *animationLayer2;
@property (nonatomic, retain) CAShapeLayer *pathLayer2;

@property (nonatomic, retain) CALayer *animationLayer3;
@property (nonatomic, retain) CAShapeLayer *pathLayer3;

@property (nonatomic, retain) CALayer *animationLayer4;
@property (nonatomic, retain) CAShapeLayer *pathLayer4;

@property (nonatomic, retain) CALayer *animationLayer5;
@property (nonatomic, retain) CAShapeLayer *pathLayer5;

@property (nonatomic, retain) CALayer *animationLayer6;
@property (nonatomic, retain) CAShapeLayer *pathLayer6;

@property (nonatomic, retain) CALayer *animationLayer7;
@property (nonatomic, retain) CAShapeLayer *pathLayer7;

@property (nonatomic, retain) CALayer *animationLayer8;
@property (nonatomic, retain) CAShapeLayer *pathLayer8;

@property (nonatomic, retain) CALayer *animationLayer9;
@property (nonatomic, retain) CAShapeLayer *pathLayer9;

@property (nonatomic, retain) CALayer *animationLayer10;
@property (nonatomic, retain) CAShapeLayer *pathLayer10;

@end

