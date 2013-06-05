//
//  EducateMenuLayer.h
//  LearningABC
//
//  Created by Faiz Rasool on 5/31/13.
//  Copyright 2013 D-Tech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "EducateMenuLayer.h"

@interface EducateLayer : CCLayer {
    CCArray* alphabets;
    float alphabetMoveDuration;
    int numAlphabetsMoved;
}

+(CCScene *) scene;

@end
