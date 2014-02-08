//
//  CSC470_Level.h
//  SnailsVsSpiders
//
//  Created by Joe Jones on 11/27/13.
//  Copyright (c) 2013 Joe Jones. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CSC470_Agent.h"
#import "CSC470_spider.h"
#import "CSC470_rocketAnt.h"

//set up agent enums here
//
typedef enum AgentType : NSUInteger
{
    SPIDER,
    HERO,
    ROCKET_ANT
} AgentType;


@interface CSC470_Level : UIImageView

@property (nonatomic) int creatureType;
@property (nonatomic, weak) NSString *bossType;
@property (nonatomic, weak) UIImage *backGroundImage;
@property (nonatomic) int enemyNumber;
@property (nonatomic) BOOL hasBoss;
@property (nonatomic, weak) NSMutableArray *agentArray;

//methods here
//
- (void)buildEnemies:(AgentType)passedAgentType
                       numberOf:(int)passedNumberOfEnemies
                    enemyHealth:(int)passedEnemyHealth
                     enemySpeed:(int)passedEnemySpeed
                     enemyImage:(UIImage*)passedEnemyImage
              enemyExpiredImage:(UIImage*)passedExpiredEnemyImage
    isHorizontalRandomPlacement:(bool)passedIsHorizontalPlacement
                levelToBePlaced:(UIImageView*)passedLevel
                     enemyFrame:(CGRect)passedCGRect;

//enemy collision detection (bool) remove enemy if health = 0 from array
//
- (bool) didItemCollideWithEnemy:(CSC470_Agent *)collider;

//ememy automove call this method to move all enemy in agent array
//
- (void) enemyAutoMove;

//enemy in bounds check if enemys in bounds remove when out
//
- (void) enemyBoundsCheck:(CSC470_Agent *)agent;

//hero bounds restrict hero to bounds
//
- (void) heroBoundsCheck:(CSC470_Agent *)agent;

@end
