//
//  SplashLayer.m
//  LearningABC
//
//  Created by Faiz Rasool on 5/31/13.
//  Copyright 2013 D-Tech. All rights reserved.
//

#import "SplashLayer.h"


@implementation SplashLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	SplashLayer *layer = [SplashLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

//
-(id) init
{
	if( (self=[super init])) {
        
		// ask director for the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
        
		CCSprite *background;
		
		if( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ) {
            background = [CCSprite spriteWithFile:@"spalsh.png"];
//            if(size.width > 480){
//                background = [CCSprite spriteWithFile:@"spalsh.png"];
//            }
//            else{
//                background = [CCSprite spriteWithFile:@"Default@2x.png"];
//			background.rotation = 90;
//            }
		} else {
			background = [CCSprite spriteWithFile:@"Default-Landscape~ipad.png"];
		}
		background.position = ccp(size.width/2, size.height/2);
            
		// add the label as a child to this Layer
		[self addChild: background];
        [self performSelector:@selector(loadMainMenuLayer) withObject:nil afterDelay:1];
	}
	
	return self;
}


- (void) loadMainMenuLayer{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:kReplaceSceneDelay scene:[MainMenuLayer scene] ]];
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
