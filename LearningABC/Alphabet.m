//
//  Alphabet.m
//  LearningABC
//
//  Created by Faiz Rasool on 6/4/13.
//  Copyright (c) 2013 D-Tech. All rights reserved.
//

#import "Alphabet.h"

@implementation Alphabet

@synthesize letter;
@synthesize imageName;
@synthesize soundName;


- (void)dealloc{
    [imageName release];
    [soundName release];
    
    [super dealloc];
}

@end
