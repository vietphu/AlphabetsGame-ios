//
//  GameLayer.m
//  LearningABC
//
//  Created by Faiz Rasool on 6/5/13.
//  Copyright 2013 D-Tech. All rights reserved.
//

#import "GameLayer.h"


@implementation GameLayer
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	GameLayer *layer = [GameLayer node];
	
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
        
        CCMenuItemFont * back = [CCMenuItemFont itemWithString:@"Back" target:self selector:@selector(backButtonTouched:)];
        CCMenu * bMenu = [CCMenu menuWithItems:back, nil];
        
        bMenu.position = ccp(30, size.height - 20);
        
        
        [self addChild:bMenu];
        
        [self scheduleUpdate];
    }
    
	return self;
}

- (void)scheduleUpdate{
    [self schedule:@selector(addBubbleToGameScene:) interval:4];
}

- (void) backButtonTouched:(id)sender{
    [Utility playButtonSound];
    [[CCDirector sharedDirector]replaceScene:[CCTransitionFade transitionWithDuration:kReplaceSceneDelay scene:[GameMenuLayer scene]]];
}

- (void) addBubbleToGameScene:(ccTime)delta{
    CGSize size = [[CCDirector sharedDirector]winSize];
    CCSprite * sprite = [CCSprite spriteWithFile:@"bubble.png"];
    sprite.position = ccp(size.width/2, size.height/2);
    [self addChild:sprite];
    CGPoint pos = sprite.position;
    [sprite runAction:[CCBlink actionWithDuration:2 blinks:3]];
    sprite.position = pos;
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
