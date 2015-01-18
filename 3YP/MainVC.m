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


@property (weak, nonatomic) IBOutlet UILabel *stepsLabel;
@property (weak, nonatomic) IBOutlet UIButton *activityScore;

@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self jawboneRequest];
}

-(void)viewDidAppear:(BOOL)animated
{
    GlobalVar *globals = [GlobalVar sharedInstance];
    NSLog([NSString stringWithFormat:@"Mood score: %@",globals.moodScore]) ;
    NSLog([NSString stringWithFormat:@"Calories score: %@",globals.caloriesScore]) ;
    NSLog([NSString stringWithFormat:@"Steps score: %@",globals.stepsScore]) ;
    NSLog([NSString stringWithFormat:@"Sleep score: %@",globals.sleepScore]) ;
    NSLog([NSString stringWithFormat:@"Nutrition score: %@",globals.nutritionScore]) ;
    NSLog([NSString stringWithFormat:@"Weight score: %@",globals.weightScore]) ;
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
                                                                                             globals.stepsScore = [[dic1 objectForKey:@"details"] objectForKey:@"steps"];
                                                                                             NSLog(@"Successfully obtained data");
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













