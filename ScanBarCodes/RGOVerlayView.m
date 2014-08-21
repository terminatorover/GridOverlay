//
//  RGOVerlayView.m
//  ScanBarCodes
//
//  Created by Vensi Developer on 8/20/14.
//  Copyright (c) 2014 Infragistics. All rights reserved.
//

#import "RGOVerlayView.h"

@implementation RGOVerlayView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    UIBezierPath* starPath = UIBezierPath.bezierPath;
    [starPath moveToPoint: CGPointMake(89, 42)];
    [starPath addLineToPoint: CGPointMake(100.99, 56.41)];
    [starPath addLineToPoint: CGPointMake(121.34, 61.35)];
    [starPath addLineToPoint: CGPointMake(108.4, 75.19)];
    [starPath addLineToPoint: CGPointMake(108.98, 92.65)];
    [starPath addLineToPoint: CGPointMake(89, 86.8)];
    [starPath addLineToPoint: CGPointMake(69.02, 92.65)];
    [starPath addLineToPoint: CGPointMake(69.6, 75.19)];
    [starPath addLineToPoint: CGPointMake(56.66, 61.35)];
    [starPath addLineToPoint: CGPointMake(77.01, 56.41)];
    [starPath closePath];
    [UIColor.redColor setStroke];
    starPath.lineWidth = 1;
    [starPath stroke];

}


@end
