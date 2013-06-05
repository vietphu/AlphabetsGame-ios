//
//  Utility.h
//  LearningABC
//
//  Created by Faiz Rasool on 6/4/13.
//  Copyright (c) 2013 D-Tech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utility : NSObject

+ (Utility*) sharedUtility;
+ (void) playButtonSound;
+ (void) playBackgroundMusic:(NSString*)music;
+ (void) playSoundEffect:(NSString*)sound;

@end
