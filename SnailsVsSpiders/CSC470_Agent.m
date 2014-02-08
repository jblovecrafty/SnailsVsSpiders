//
//  CSC470_Agent.m
//  SnailsVsSpiders
//
//  Created by Joe Jones on 11/27/13.
//  Copyright (c) 2013 Joe Jones. All rights reserved.
//

#import "CSC470_Agent.h"

@implementation CSC470_Agent

@synthesize health               =_health;
@synthesize speed                = _speed;
@synthesize imageToUse           = _imageToUse;
@synthesize expiredImageToUse    = _expiredImageToUse;


//this is the method that a caller can use for automoving the agent
//
-(void)autoMovement:(CGFloat)passedXValue yValue:(CGFloat) passedYValue
{
    self.center = CGPointMake(passedXValue, passedYValue);
}
@end
