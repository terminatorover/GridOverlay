//
//  RGLayer.m
//  ScanBarCodes
//
//  Created by Vensi Developer on 8/20/14.
//  Copyright (c) 2014 Infragistics. All rights reserved.
//
#define NO_SECTIONS_FOR_HORIZONTAL_GRID 8
#define NO_SECTIONS_FOR_VERTICAL_GRID 4

#import "RGLayer.h"

@implementation RGLayer

-(void)drawInContext:(CGContextRef)ctx
{
    UIGraphicsPushContext(ctx);
    //line

    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 20);
    CGContextSetStrokeColorWithColor(context, [[UIColor lightGrayColor] CGColor]);
    
    //getting screen specs
    CGRect deviceScreenFrame =  [self currentScreenBoundsDependOnOrientation];
    CGFloat screenWidth = deviceScreenFrame.size.width;
    CGFloat screenHeight = deviceScreenFrame.size.height;
    
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    bezierPath.lineWidth = 2;
    
    //HORIZONTAL LINES
    NSInteger horizontalLineYCoordinate = 0 ;
    NSInteger yIncrements = screenHeight / NO_SECTIONS_FOR_HORIZONTAL_GRID;
    
    while(  horizontalLineYCoordinate <= screenHeight)
    {
        
        [bezierPath moveToPoint:CGPointMake(0.0f, horizontalLineYCoordinate + yIncrements)];
        [bezierPath addLineToPoint:CGPointMake(screenWidth,horizontalLineYCoordinate + yIncrements )];
        [bezierPath stroke];
        
        horizontalLineYCoordinate += yIncrements;
    }
    //VERTICAL LINES
    
    NSInteger verticalLineXCoordinate = 0 ;
    NSInteger xIncrements = screenWidth / NO_SECTIONS_FOR_VERTICAL_GRID;
    
    while ( verticalLineXCoordinate  < screenWidth)
    {
        [bezierPath moveToPoint:CGPointMake(verticalLineXCoordinate + xIncrements, 0)];
        [bezierPath addLineToPoint:CGPointMake(verticalLineXCoordinate + xIncrements,screenHeight )];
        [bezierPath stroke];
        verticalLineXCoordinate += xIncrements;
    }


    UIGraphicsPopContext();
}


-(CGRect)currentScreenBoundsDependOnOrientation
{
    
    CGRect screenBounds = [UIScreen mainScreen].bounds ;
    CGFloat width = CGRectGetWidth(screenBounds)  ;
    CGFloat height = CGRectGetHeight(screenBounds) ;
    UIInterfaceOrientation interfaceOrientation = [UIApplication sharedApplication].statusBarOrientation;
    
    if(UIInterfaceOrientationIsPortrait(interfaceOrientation)){
        screenBounds.size = CGSizeMake(width, height);
    }else if(UIInterfaceOrientationIsLandscape(interfaceOrientation)){
        screenBounds.size = CGSizeMake(height, width);
    }
    return screenBounds ;
}

@end
