//
//  mainVC.m
//  3YP
//
//  Created by I-Horng Huang on 11/11/2014.
//  Copyright (c) 2014 oxfordEngineering. All rights reserved.
//

#import "MainVC.h"
#import <UPPlatformSDK/UPPlatformSDK.h>

@interface MainVC ()
@property int userNoOfSteps; //use global variable instead


@property (weak, nonatomic) IBOutlet UILabel *stepsLabel;
@property (weak, nonatomic) IBOutlet UIButton *activityScore;

@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self jawboneRequest];


}

- (void) jawboneRequest
{
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
                                                                                             self.userNoOfSteps = [[[dic1 objectForKey:@"details"] objectForKey:@"steps"] intValue];

                                                                                             // currently only display the number of steps
                                                                                             self.activityScore.titleLabel.text = [NSString stringWithFormat:@"%d",self.userNoOfSteps];
                                                                                             self.stepsLabel.text = [NSString stringWithFormat:@"%d",self.userNoOfSteps];
                                                                                             NSLog(@"steps : %d", self.userNoOfSteps);
                                                                                         }];
                                                       }];
                                                   }
                                               }];
}



@end













