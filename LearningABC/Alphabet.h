//
//  Alphabet.h
//  LearningABC
//
//  Created by Faiz Rasool on 6/4/13.
//  Copyright (c) 2013 D-Tech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Alphabet : CCLayer

@property (nonatomic) int letter;
@property (nonatomic, strong) NSString * imageName;
@property (nonatomic, strong) NSString * soundName;

@end
