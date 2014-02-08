//
//  CSC470_Level.m
//  SnailsVsSpiders
//
//  Created by Joe Jones on 11/27/13.
//  Copyright (c) 2013 Joe Jones. All rights reserved.
//

#import "CSC470_Level.h"

@implementation CSC470_Level

@synthesize creatureType    = _creatureType;
@synthesize bossType        = _bossType;
@synthesize backGroundImage = _backGroundImage;
@synthesize enemyNumber     = _enemyNumber;
@synthesize hasBoss         = _hasBoss;
@synthesize agentArray      = _agentArray;

//internal vars here
//
CGFloat xValueOfEnemy = 0;
CGFloat yValueOfEnemy = 0;

///////////////////////////////////
//General Constants
///////////////////////////////////
#define ENEMY_OFFSET_1 20
#define ENEMY_OFFSET_2 50


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

//handle creature creation and then build an NSMutable array to pass to the level
//
- (void)buildEnemies:(AgentType)passedAgentType
                       numberOf:(int)passedNumberOfEnemies
                    enemyHealth:(int)passedEnemyHealth
                     enemySpeed:(int)passedEnemySpeed
                     enemyImage:(UIImage*)passedEnemyImage
              enemyExpiredImage:(UIImage*)passedExpiredEnemyImage
    isHorizontalRandomPlacement:(bool)passedIsHorizontalPlacement
                levelToBePlaced:(UIImageView*)passedLevel
                     enemyFrame:(CGRect)passedCGRect
{
    NSMutableArray *arrayOfEnemies = [[NSMutableArray alloc] init];
    
    CGFloat randomX;
    CGFloat randomY;
    CGPoint enemyPostion;
    
    for(int i = 0; i < passedNumberOfEnemies; i++)
    {
        //set up random location here
        //
        if(passedIsHorizontalPlacement)
        {
            randomX = (CGFloat) (arc4random() % ((int) [[UIScreen mainScreen]applicationFrame].size.height-ENEMY_OFFSET_1));
            randomY = [[UIScreen mainScreen]applicationFrame].size.width-ENEMY_OFFSET_2;
        }
        else
        {
            randomX = [[UIScreen mainScreen]applicationFrame].size.height-ENEMY_OFFSET_2;
            randomY = (CGFloat) (arc4random() % ((int) [[UIScreen mainScreen]applicationFrame].size.width-ENEMY_OFFSET_1));
            
        }
        
        //build them creatures
        //
        if(passedAgentType == ROCKET_ANT)
        {
            CSC470_rocketAnt *enemy = [[CSC470_rocketAnt alloc] initWithFrame:passedCGRect];
            
            enemy.health = passedEnemyHealth;
            enemy.speed = passedEnemySpeed;
            enemy.imageToUse = passedEnemyImage;
            enemy.image = passedEnemyImage;
            enemy.expiredImageToUse = passedExpiredEnemyImage;
            
            //set location of the enemy
            //
            enemyPostion = CGPointMake(randomX, randomY);
            enemy.center = enemyPostion;
            
            //now add them to the level layer
            //
            [passedLevel addSubview:enemy];
            
            //now add them
            //
            [arrayOfEnemies addObject:enemy];
            
            
        }
        else
        {
            CSC470_spider *enemy = [[CSC470_spider alloc] initWithFrame:passedCGRect];
            
            enemy.health = passedEnemyHealth;
            enemy.speed = passedEnemySpeed;
            enemy.imageToUse = passedEnemyImage;
            enemy.image = passedEnemyImage;
            enemy.expiredImageToUse = passedExpiredEnemyImage;
            
            //set location of the enemy
            //
            enemyPostion = CGPointMake(randomX, randomY);
            enemy.center = enemyPostion;
            
            //now add them to the level layer
            //
            [passedLevel addSubview:enemy];
            
            //now add them
            //
            [arrayOfEnemies addObject:enemy];
        }
        
        
    }
    
    self.agentArray = arrayOfEnemies;
}


//enemy collision detection (bool) remove enemy if health = 0 from array
//
- (bool) didItemCollideWithEnemy:(CSC470_Agent *)collider
{
    return FALSE;
}

//ememy automove call this method to move all enemy in agent array
//
- (void) enemyAutoMove
{
    for(CSC470_Agent *agent in self.agentArray)
    {
        if(self.creatureType == 0)
        {
            [(CSC470_spider *)agent autoMovement:xValueOfEnemy yValue:yValueOfEnemy];
        }
        else
        {
           [(CSC470_rocketAnt *)agent autoMovement:xValueOfEnemy yValue:yValueOfEnemy];
        }
        xValueOfEnemy++;
        yValueOfEnemy++;
    }
}

//enemy in bounds check if enemys in bounds remove when out
//
- (void) enemyBoundsCheck:(CSC470_Agent *)agent
{
    
}

//hero bounds restrict hero to bounds
//
- (void) heroBoundsCheck:(CSC470_Agent *)agent
{
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
