//
//  mainVC.m
//  3YP
//
//  Created by I-Horng Huang on 11/11/2014.
//  Copyright (c) 2014 oxfordEngineering. All rights reserved.
//

#import "MainVC.h"
#import <UPPlatformSDK/UPPlatformSDK.h>
#import "GlobalVar.h"

@interface MainVC ()


@property (weak, nonatomic) IBOutlet UIButton *stepsScore;
@property (weak, nonatomic) IBOutlet UIButton *sleepScore;
@property (weak, nonatomic) IBOutlet UIButton *caloriesScore;
@property (weak, nonatomic) IBOutlet UIButton *nutritionScore;
@property (weak, nonatomic) IBOutlet UIButton *moodScore;
@property (weak, nonatomic) IBOutlet UIButton *weightScore;

@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];

    [self jawboneRequest];
    [self updateScoreDisplay];
}

-(void)viewDidAppear:(BOOL)animated
{
    [self updateScoreDisplay];
}

-(void)updateScoreDisplay
{
    GlobalVar *globals = [GlobalVar sharedInstance];
    [self.stepsScore setTitle:[NSString stringWithFormat:@"%@",globals.stepsScore] forState:UIControlStateNormal];
    [self.sleepScore setTitle:[NSString stringWithFormat:@"%@",globals.sleepScore] forState:UIControlStateNormal];
    [self.caloriesScore setTitle:[NSString stringWithFormat:@"%@",globals.caloriesScore] forState:UIControlStateNormal];
    [self.nutritionScore setTitle:[NSString stringWithFormat:@"%@",globals.nutritionScore] forState:UIControlStateNormal];
    [self.moodScore setTitle:[NSString stringWithFormat:@"%@",globals.moodScore] forState:UIControlStateNormal];
    [self.weightScore setTitle:[NSString stringWithFormat:@"%@",globals.weightScore] forState:UIControlStateNormal];
}

- (void) jawboneRequest
{
    // get activity
    [[UPPlatform sharedPlatform] startSessionWithClientID:@"rTQr16Hk6qI"
                                             clientSecret:@"218556ce19914176412294e201438b009ba118a8"
                                                authScope:(UPPlatformAuthScopeExtendedRead | UPPlatformAuthScopeMoveRead)
                                               completion:^(UPSession *session, NSError *error) {
                                                   if (session != nil) {
                                                       // Your code to start making API requests goes here.

                                                       // get user
                                                       [UPUserAPI getCurrentUserWithCompletion:^(UPUser *user, UPURLResponse *response, NSError *error) {
                                                           // Your code to process returned UPUser object.
                                                           NSLog(@"logged in as %@", user.firstName);

                                                           // perform a url request to the endpoint: moves
                                                           UPURLRequest *request1 = [UPURLRequest getRequestWithEndpoint:@"nudge/api/v.1.1/users/@me/moves"
                                                                                                                  params:nil];
                                                           [[UPPlatform sharedPlatform] sendRequest:request1
                                                                                         completion:^(UPURLRequest *request, UPURLResponse *response, NSError *error) {
                                                                                             // The resulting response.data is an NSDictionary with the JSON results.

                                                                                             //get number of steps
                                                                                             NSDictionary *dic1 = [[response.data objectForKey:@"items"] firstObject];
                                                                                             GlobalVar *globals = [GlobalVar sharedInstance];
                                                                                             //globals.stepsScore = [[dic1 objectForKey:@"details"] objectForKey:@"steps"];
                                                                                             //TODO: fake data
                                                                                             globals.stepsScore = [NSNumber numberWithInt:79];
                                                                                             globals.sleepScore = [NSNumber numberWithInt:67];
                                                                                             NSLog(@"Successfully obtained data");

                                                                                             [self updateScoreDisplay];
                                                            }];
                                                       }];
                                                   }
                                               }];


    // get sleep
    [[UPPlatform sharedPlatform] startSessionWithClientID:@"rTQr16Hk6qI"
                                             clientSecret:@"218556ce19914176412294e201438b009ba118a8"
                                                authScope:(UPPlatformAuthScopeExtendedRead | UPPlatformAuthScopeMoveRead)
                                               completion:^(UPSession *session, NSError *error) {
                                                   if (session != nil) {
                                                       // Your code to start making API requests goes here.

                                                       // get user
                                                       [UPUserAPI getCurrentUserWithCompletion:^(UPUser *user, UPURLResponse *response, NSError *error) {
                                                           // Your code to process returned UPUser object.
                                                           NSLog(@"logged in as %@", user.firstName);

                                                           // perform a url request to the endpoint: moves
                                                           UPURLRequest *request1 = [UPURLRequest getRequestWithEndpoint:@"https://jawbone.com/nudge/api/v.1.1/users/@me/sleeps"
                                                                                                                  params:nil];
                                                           [[UPPlatform sharedPlatform] sendRequest:request1
                                                                                         completion:^(UPURLRequest *request, UPURLResponse *response, NSError *error) {
                                                                                             // The resulting response.data is an NSDictionary with the JSON results.

                                                                                             // TODO: response.data is not returning anything
                                                                                             if(!error){
                                                                                                 NSLog(@"SLEEP HERE %@",response.data);
                                                                                             }

                                                                                         }];

                                                       }];

                                                   }
                                               }];
}



@end













