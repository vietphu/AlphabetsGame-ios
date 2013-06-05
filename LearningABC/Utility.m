//
//  Utility.m
//  LearningABC
//
//  Created by Faiz Rasool on 6/4/13.
//  Copyright (c) 2013 D-Tech. All rights reserved.
//

#import "Utility.h"

@implementation Utility

static Utility * util = nil;

+ (Utility*) sharedUtility{
   if(util == nil)
       util = [[Utility alloc]init];
    
    return util;
}

#pragma mark - Playing Sounds

+ (void) playButtonSound{
    [[SimpleAudioEngine sharedEngine]playEffect:kButtonClickSound];
}

+ (void) playBackgroundMusic:(NSString*)music{
    [[SimpleAudioEngine sharedEngine]playBackgroundMusic:kBackgroundMusicSound loop:YES];
    
}

+ (void) playSoundEffect:(NSString*)sound{
    [[SimpleAudioEngine sharedEngine]playEffect:kBackgroundSoundEffect];
}


@end
