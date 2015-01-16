//
//  GlobalVar.m
//  3YP
//
//  Created by I-Horng Huang on 16/01/2015.
//  Copyright (c) 2015 oxfordEngineering. All rights reserved.
//

#import "GlobalVar.h"

@implementation GlobalVar


@synthesize sleepScore = _sleepScore;
@synthesize stepsScore = _stepsScore;
@synthesize caloriesScore = _caloriesScore;
@synthesize nutritionScore = _nutritionScore;
@synthesize moodScore = _moodScore;
@synthesize weightScore = _weightScore;


+ (GlobalVar *)sharedInstance {
    static dispatch_once_t onceToken;
    static GlobalVar *instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[GlobalVar alloc] init];
    });
    return instance;
}

- (id)init {
    self = [super init];
    if (self) {

        _sleepScore = [[NSNumber alloc] init];
        _stepsScore = [[NSNumber alloc] init];
        _caloriesScore = [[NSNumber alloc] init];
        _nutritionScore = [[NSNumber alloc] init];
        _moodScore = [[NSNumber alloc] init];
        _weightScore = [[NSNumber alloc] init];

    }
    return self;
}
@end
