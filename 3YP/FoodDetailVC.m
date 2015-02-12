//
//  FoodDetailVC.m
//  3YP
//
//  Created by I-Horng Huang on 12/02/2015.
//  Copyright (c) 2015 oxfordEngineering. All rights reserved.
//

#import "FoodDetailVC.h"

@interface FoodDetailVC ()

@end

@implementation FoodDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"NDBno = %@",self.ndbno);
    // Burgerkind chicken NDBno = 21256
    [self getFoodReport:self.ndbno];
}


- (void)getFoodReport:(NSString *)ndbno{
    // SEARCH using food name to obtain ndbno
    NSString *searchRequest = [NSString stringWithFormat:@"http://api.data.gov/usda/ndb/reports/?ndbno=%@&type=f&format=json&api_key=GqZ0PsBrk1KGw8zyhQ1x6TLQPZMsGhjekVfjj6vu",ndbno];

    NSURL *url = [NSURL URLWithString:searchRequest];
    NSURLSessionDataTask *downloadTask = [[NSURLSession sharedSession]
                                          dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                              // Handle response here

                                              NSError *e = nil;
                                              NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: &e];

                                              if (!jsonDic) {
                                                  NSLog(@"Error parsing JSON: %@", e);
                                              } else {
                                                  NSDictionary *report = jsonDic[@"report"];
                                                  NSDictionary *food = report[@"food"];
                                                  NSArray *nutrients = food[@"nutrients"];
                                                  NSLog(@"nutrients array : %@",nutrients);

                                                  // TODO: retrieve useful information
                                                  
                                              }
                                          }];
    [downloadTask resume];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
