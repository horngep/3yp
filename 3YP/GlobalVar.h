//
//  GlobalVar.h
//  3YP
//
//  Created by I-Horng Huang on 16/01/2015.
//  Copyright (c) 2015 oxfordEngineering. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GlobalVar : NSObject
{
    NSNumber *_sleepScore;
    NSNumber *_stepsScore;
    NSNumber *_caloriesScore;
    NSNumber *_nutritionScore;
    NSNumber *_moodScore;
    NSNumber *_weightScore;

}

+ (GlobalVar *)sharedInstance;

@property(strong, nonatomic, readwrite) NSNumber *sleepScore;
@property(strong, nonatomic, readwrite) NSNumber *stepsScore;
@property(strong, nonatomic, readwrite) NSNumber *caloriesScore;
@property(strong, nonatomic, readwrite) NSNumber *nutritionScore;
@property(strong, nonatomic, readwrite) NSNumber *moodScore;
@property(strong, nonatomic, readwrite) NSNumber *weightScore;


@end
