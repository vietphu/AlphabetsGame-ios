//
//  EducateMenuLayer.m
//  LearningABC
//
//  Created by Faiz Rasool on 5/31/13.
//  Copyright 2013 D-Tech. All rights reserved.
//

#import "EducateLayer.h"


@implementation EducateLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	EducateLayer *layer = [EducateLayer node];
	
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
        
                
        CCMenuItemFont * back = [CCMenuItemFont itemWithString:@"Back" target:self selector:@selector(backButtonTouched:)];
        CCMenu * bMenu = [CCMenu menuWithItems:back, nil];
        
        bMenu.position = ccp(30, size.height - 20);
        
        
        [self addChild:bMenu];
        
        CCSprite* tempAlphabet = [CCSprite spriteWithFile:@"B.png"];
        tempAlphabet.position = CGPointMake(20,200);
        [self addChild:tempAlphabet];
        
        // Add Alphabets to the scene
        [self initAlphabets];
        
    }
	return self;
}

- (void) initAlphabets{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    // using a temporary sprite is the easiest way to get the image's size
    CCSprite* tempAlphabet = [CCSprite spriteWithFile:@"B.png"];
    float imageWidth = [tempAlphabet texture].contentSize.width;
    // Use as many alphabets as can fit next to each other over the whole screen width.
    
    int numAlphabets = screenSize.width / imageWidth;
    // Initialize the alphabets array using alloc.
    alphabets = [[CCArray alloc] initWithCapacity:numAlphabets];
    for (int i = 0; i < numAlphabets; i++)
    {
        CCSprite* alphabet = [CCSprite spriteWithFile:@"A.png"];
//        [self addChild:alphabet z:0 tag:2];

        // Also add the spider to the spiders array.
        [alphabets addObject:alphabet];
    }
    // call the method to reposition all spiders
    [self resetAlphabets];
}

- (void) resetAlphabets{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    // Get any spider to get its image width
    CCSprite* tempAlphabet = [alphabets lastObject];
    CGSize size = [tempAlphabet texture].contentSize;
    int numAlphabets = [alphabets count];
    for (int i = 0; i < numAlphabets; i++)
    {
        // Put each spider at its designated position outside the screen
        CCSprite* alphabet = [alphabets objectAtIndex:i];
        CGPoint point = CGPointMake(size.width * i  ,
                                    screenSize.height * 0.5);
        alphabet.position = point;
        [self addChild:alphabet];
        [alphabet stopAllActions];
    }
}

- (void) backButtonTouched:(id)sender{
    [Utility playButtonSound];
    [[CCDirector sharedDirector]replaceScene:[CCTransitionFade transitionWithDuration:kReplaceSceneDelay scene:[EducateMenuLayer scene]]];
}

#pragma mark - Handling Touches

- (void)registerWithTouchDispatcher {
    [[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    return YES;
}

- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event{
    
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
