//
//  CSC470ViewController.h
//  SnailsVsSpiders
//
//  Created by Joe Jones on 11/27/13.
//  Copyright (c) 2013 Joe Jones. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuartzCore/CADisplayLink.h"
#import "CSC470_Level.h"



@interface CSC470ViewController : UIViewController
{
    CADisplayLink *gameTimer;
}

@property(nonatomic) CGFloat screenWidth;
@property(nonatomic) CGFloat screenHeight;


@property (weak, nonatomic) IBOutlet CSC470_Level *mainContextView;
@end
