//
//  CSC470ViewController.m
//  SnailsVsSpiders
//
//  Created by Joe Jones on 11/27/13.
//  Copyright (c) 2013 Joe Jones. All rights reserved.
//

#import "CSC470ViewController.h"
#import "CSC470_Hero.h"
#import "CSC470_spider.h"
#import "CSC470_rocketAnt.h"
#import "CSC470_Level.h"

@interface CSC470ViewController ()

@end

@implementation CSC470ViewController

///////////////////////////////////
//Hero Stats
///////////////////////////////////
#define HERO_MAIN_IMAGE @"Snail.png"
#define HERO_DEAD_IMAGE @"SnailDead.png"
#define HERO_HEALTH 3
#define HERO_SPEED 1
#define HERO_WIDTH 107
#define HERO_HEIGHT 101

///////////////////////////////////
//Spider Stats
///////////////////////////////////
#define SPIDER_MAIN_IMAGE @"Spider.png"
#define SPIDER_DEAD_IMAGE @"SpiderDead.png"
#define SPIDER_HEALTH 1
#define SPIDER_SPEED 1
#define SPIDER_WIDTH 79
#define SPIDER_HEIGHT 77

///////////////////////////////////
//Ant Rocket Stats
///////////////////////////////////
#define ANT_ROCKET_MAIN_IMAGE @"AntRocket.png"
#define ANT_ROCKET_DEAD_IMAGE @"AntRocketDead.png"
#define ANT_ROCKET_HEALTH 1
#define ANT_ROCKET_SPEED 2
#define ANT_ROCKET_WIDTH 199
#define ANT_ROCKET_HEIGHT 110

///////////////////////////////////
//Level 1 Stats
///////////////////////////////////
#define LEVEL1_BACKGROUND_IMAGE @"SpiderAndSnailBackGround.png"
#define LEVEL1_ENEMY_TYPE @"Spider"
#define LEVEL1_ENEMY_NUMBER 5
#define LEVEL1_HAS_BOSS 0
#define LEVEL1_BOSS_TYPE @"none"

///////////////////////////////////
//Level 2 Stats
///////////////////////////////////
#define LEVEL2_BACKGROUND_IMAGE @"SpiderAndSnailBackGround.png"
#define LEVEL2_ENEMY_TYPE @"AntRocket"
#define LEVEL2_ENEMY_NUMBER 5
#define LEVEL2_HAS_BOSS 0
#define LEVEL2_BOSS_TYPE @"none"

///////////////////////////////////
//General Constants
///////////////////////////////////
#define ENEMY_OFFSET_1 20
#define ENEMY_OFFSET_2 50

//set up vars
//
@synthesize screenWidth = _screenWidth;
@synthesize screenHeight = _screenHeight;
bool setUp = true;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //set up bounds
    //
    self.screenWidth = [[UIScreen mainScreen]applicationFrame].size.width;
    self.screenHeight = [[UIScreen mainScreen]applicationFrame].size.height;
    
    //set up timer
    //
    [self initializeGameTimer];

    
    //create hero here
    //
    
    CSC470_Hero *subImageView = [[CSC470_Hero alloc] initWithFrame: CGRectMake(0.0, 0.0, 101.0, 107.0)];
    subImageView.image = [UIImage imageNamed:HERO_MAIN_IMAGE];
    
    [self.mainContextView addSubview:subImageView];
    
    //CGRect enemyRect = CGRectMake(0.0, 0.0, SPIDER_HEIGHT, SPIDER_WIDTH);
    
    [self.mainContextView buildEnemies:SPIDER numberOf:3 enemyHealth:1 enemySpeed:2 enemyImage:[UIImage imageNamed:SPIDER_MAIN_IMAGE] enemyExpiredImage:[UIImage imageNamed:SPIDER_DEAD_IMAGE] isHorizontalRandomPlacement:NO levelToBePlaced:self.mainContextView enemyFrame:CGRectMake(0.0, 0.0, SPIDER_HEIGHT, SPIDER_WIDTH)];
    
    self.mainContextView.image = [UIImage imageNamed:LEVEL1_BACKGROUND_IMAGE];
    self.mainContextView.creatureType = 0;
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*//handle creature creation and then build an NSMutable array to pass to the level
//
- (NSMutableArray*)buildEnemies:(AgentType)passedAgentType
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
            randomX = (CGFloat) (arc4random() % ((int) self.screenHeight-ENEMY_OFFSET_1));
            randomY = self.screenWidth-ENEMY_OFFSET_2;
        }
        else
        {
            randomX = self.screenHeight-ENEMY_OFFSET_2;
            randomY = (CGFloat) (arc4random() % ((int) self.screenWidth-ENEMY_OFFSET_1));
            
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
    
    return arrayOfEnemies;
}*/




//handle level creation
//

//handle game state and turn
//
//Create the game timer to keep us on track
//
- (void) initializeGameTimer
{
    if(gameTimer == nil)
    {
        gameTimer = [CADisplayLink displayLinkWithTarget:self selector:@selector(gameTurnLogic:)];
    }
    
    gameTimer.frameInterval = 5;
    
    [gameTimer addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
}

//handle the game logic
//
- (void) gameTurnLogic:(CADisplayLink *)gameTimer
{
    [self.mainContextView enemyAutoMove];
}

//handle button inputs
//



@end
