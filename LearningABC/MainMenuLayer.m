//
//  MainMenuLayer.m
//  LearningABC
//
//  Created by Faiz Rasool on 5/30/13.
//  Copyright 2013 D-Tech. All rights reserved.
//

#import "MainMenuLayer.h"
#import "EducateMenuLayer.h"
// Needed to obtain the Navigation Controller
#import "AppDelegate.h"
#import "GameMenuLayer.h"

@implementation MainMenuLayer
// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	MainMenuLayer *layer = [MainMenuLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
        
       CGSize size = [[CCDirector sharedDirector]winSize];
                CCSprite * bg = [CCSprite spriteWithFile:@"background@2x.png"];
                bg.position = ccp(size.width/2, size.height/2);
               // bg.rotation = 90;
                [self addChild:bg];
        
        // create a menu item using existing sprites
        CCSprite* normal = [CCSprite spriteWithFile:@"Play.png"]; //normal.color = ccRED;
        CCSprite* selected = [CCSprite spriteWithFile:@"Play.png"]; selected.color = ccGRAY;
        CCMenuItemSprite* item2 = [CCMenuItemSprite
                                   itemWithNormalSprite:normal
                                   selectedSprite:selected
                                   target:self
                                   selector:@selector(playMenuItemTouched:)];
        item2.tag = kPlayMenuButtonTag;
        
        // create a menu item using existing sprites
        CCSprite* normal2 = [CCSprite spriteWithFile:@"Educate.png"]; //normal.color = ccRED;
        CCSprite* selected2 = [CCSprite spriteWithFile:@"Educate.png"]; selected2.color = ccGRAY;
        CCMenuItemSprite* item4 = [CCMenuItemSprite
                                   itemWithNormalSprite:normal2
                                   selectedSprite:selected2
                                   target:self
                                   selector:@selector(educateMenuItemTouched:)];
        
        // create the menu using the items
        CCMenu* menu = [CCMenu menuWithItems:item2, item4, nil];
        //CGSize size = [[CCDirector sharedDirector]winSize];
        menu.position = CGPointMake(size.width/2, size.height/2);
        [self addChild:menu];
        // aligning is important, so the menu items don't occupy the same location
        [menu alignItemsVerticallyWithPadding:40];
        
//        [Utility playBackgroundMusic:@"3.png"];
        /*
         // Leaderboards and Achievements
         //
         
         // Default font size will be 28 points.
         [CCMenuItemFont setFontSize:28];
         
         // to avoid a retain-cycle with the menuitem and blocks
         __block id copy_self = self;
         
         // Achievement Menu Item using blocks
         CCMenuItem *itemAchievement = [CCMenuItemFont itemWithString:@"Achievements" block:^(id sender) {
         
         GKAchievementViewController *achivementViewController = [[GKAchievementViewController alloc] init];
         achivementViewController.achievementDelegate = copy_self;
         
         AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
         
         [[app navController] presentModalViewController:achivementViewController animated:YES];
         
         [achivementViewController release];
         }];
         
         // Leaderboard Menu Item using blocks
         CCMenuItem *itemLeaderboard = [CCMenuItemFont itemWithString:@"Leaderboard" block:^(id sender) {
         
         GKLeaderboardViewController *leaderboardViewController = [[GKLeaderboardViewController alloc] init];
         leaderboardViewController.leaderboardDelegate = copy_self;
         
         AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
         
         [[app navController] presentModalViewController:leaderboardViewController animated:YES];
         
         [leaderboardViewController release];
         }];
         
         
         CCMenu *menu = [CCMenu menuWithItems:itemAchievement, itemLeaderboard, nil];
         
         [menu alignItemsHorizontallyWithPadding:20];
         [menu setPosition:ccp( size.width/2, size.height/2 - 50)];
         
         // Add the menu to the layer
         [self addChild:menu];
         */
	}
    
	return self;
}

//- (void)draw{
//    CGSize size = [[CCDirector sharedDirector]winSize];
//    glColor4f(255, 255, 255, 255);
//    CGPoint center = ccp(size.width/2, size.height/2);
//    CGFloat radius = 100.f;
//    CGFloat angle = 360.f;
//    NSInteger segments = 10;
//    BOOL drawLineToCenter = YES;
//    
//    ccDrawCircle(center, radius, angle, segments, drawLineToCenter);
//}

- (void) playMenuItemTouched:(id)sender{
    [Utility playButtonSound];
   [[CCDirector sharedDirector]replaceScene:[CCTransitionFade transitionWithDuration:kReplaceSceneDelay scene:[GameMenuLayer scene]]];
}

- (void) educateMenuItemTouched:(id)sender{
    [Utility playButtonSound];    
    [[CCDirector sharedDirector]replaceScene:[CCTransitionFade transitionWithDuration:kReplaceSceneDelay scene:[EducateMenuLayer scene]]];
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	// don't forget to call "super dealloc"
	[super dealloc];
}


-(void) onEnter
{
    // Called right after a node’s init method is called.
    // If using a CCTransitionScene: called when the transition begins.
    [super onEnter];
}

-(void) onEnterTransitionDidFinish
{
}

-(void) onExit
{
    // Called right before node’s dealloc method is called.
    // If using a CCTransitionScene: called when the transition has ended.
    [super onExit];
}


@end
