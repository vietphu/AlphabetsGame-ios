//
//  EducateMenuLayer.m
//  LearningABC
//
//  Created by Faiz Rasool on 5/31/13.
//  Copyright 2013 D-Tech. All rights reserved.
//

#import "GameMenuLayer.h"


@implementation GameMenuLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	GameMenuLayer *layer = [GameMenuLayer node];
	
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
        self.isTouchEnabled = YES;
//        // background image
        CCSprite * bg = [CCSprite spriteWithFile:@"background@2x.png"];
        bg.position = ccp(size.width/2, size.height/2);

        [self addChild:bg];
        
        
//        CCSprite * back = [CCSprite spriteWithFile:@"English.png"];
//        back.position = CGPointMake(0, size.height);
//        [self addChild:back];
        
        CCMenuItemFont * back = [CCMenuItemFont itemWithString:@"Back" target:self selector:@selector(backButtonTouched:)];
        CCMenu * bMenu = [CCMenu menuWithItems:back, nil];
        
        bMenu.position = ccp(30, size.height - 20);
        
        
        [self addChild:bMenu];
        
        // create a menu item using existing sprites
        CCSprite* normal = [CCSprite spriteWithFile:@"English.png"]; //normal.color = ccRED;
        CCSprite* selected = [CCSprite spriteWithFile:@"English.png"]; selected.color = ccGRAY;
        CCMenuItemSprite* item2 = [CCMenuItemSprite
                                   itemWithNormalSprite:normal
                                   selectedSprite:selected
                                   target:self
                                   selector:@selector(menuItemTouched:)];
        item2.tag = kPlayEnglishButtonTag;
        
        // create a menu item using existing sprites
        CCSprite* normal2 = [CCSprite spriteWithFile:@"ArabicMaths.png"]; //normal.color = ccRED;
        CCSprite* selected2 = [CCSprite spriteWithFile:@"ArabicMaths.png"]; selected2.color = ccGRAY;
        CCMenuItemSprite* item4 = [CCMenuItemSprite
                                   itemWithNormalSprite:normal2
                                   selectedSprite:selected2
                                   target:self
                                   selector:@selector(menuItemTouched:)];
        item4.tag = kPlayArabicButtonTag;
        
        // create a menu item using existing sprites
        normal = [CCSprite spriteWithFile:@"Maths.png"]; //normal.color = ccRED;
        selected = [CCSprite spriteWithFile:@"Maths.png"]; selected.color = ccGRAY;
        CCMenuItemSprite* item3 = [CCMenuItemSprite
                                   itemWithNormalSprite:normal
                                   selectedSprite:selected
                                   target:self
                                   selector:@selector(menuItemTouched:)];
        item3.tag = kPlayMathsButtonTag;
        
        // create a menu item using existing sprites
        normal2 = [CCSprite spriteWithFile:@"Arabic.png"]; //normal.color = ccRED;
        selected2 = [CCSprite spriteWithFile:@"Arabic.png"]; selected2.color = ccGRAY;
        CCMenuItemSprite* item1 = [CCMenuItemSprite
                                   itemWithNormalSprite:normal2
                                   selectedSprite:selected2
                                   target:self
                                   selector:@selector(menuItemTouched:)];
        item1.tag = kPlayArabicButtonTag;
        
        // create the menu using the items
        CCMenu* menu = [CCMenu menuWithItems:item1, item2, item3, item4, nil];
        menu.position = CGPointMake(size.width/2, size.height/2);
        [self addChild:menu];
        // aligning is important, so the menu items don't occupy the same location
        [menu alignItemsInColumns:[NSNumber numberWithInt:2],[NSNumber numberWithInt:2], nil];
        
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

- (void) backButtonTouched:(id)sender{
    [Utility playButtonSound];    
    [[CCDirector sharedDirector]replaceScene:[CCTransitionFade transitionWithDuration:kReplaceSceneDelay scene:[MainMenuLayer scene]]];
}

- (void) menuItemTouched:(CCMenuItem*)sender{
    [Utility playButtonSound];
    
    switch (sender.tag) {
        case kPlayEnglishButtonTag:
            [[CCDirector sharedDirector]replaceScene:[CCTransitionFade transitionWithDuration:kReplaceSceneDelay scene:[GameLayer scene]]];
            break;
        default:
            break;
    }
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
    id view = touch.view;
    if([view isKindOfClass:[CCSprite class]])
        CCLOG(@"Back Button Tapped");
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
