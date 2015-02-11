//
//  UsdaVC.m
//  3YP
//
//  Created by I-Horng Huang on 25/01/2015.
//  Copyright (c) 2015 oxfordEngineering. All rights reserved.
//

#import "UsdaVC.h"

@interface UsdaVC ()

@end

@implementation UsdaVC

- (void)viewDidLoad {
    [super viewDidLoad];

    // API Key : GqZ0PsBrk1KGw8zyhQ1x6TLQPZMsGhjekVfjj6vu
    [self searchFood:@"potatoes"];
}

- (void)searchFood:(NSString *)foodString{
    // SEARCH using food name to obtain ndbno
    NSString *searchRequest = [NSString stringWithFormat:@"http://api.data.gov/usda/ndb/search/?format=json&q=%@&sort=n&max=25&offset=0&api_key=GqZ0PsBrk1KGw8zyhQ1x6TLQPZMsGhjekVfjj6vu",foodString];

    NSURL *url = [NSURL URLWithString:searchRequest];
    NSURLSessionDataTask *downloadTask = [[NSURLSession sharedSession]
                                          dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                              // Handle response here

                                              NSError *e = nil;
                                              NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: &e];

                                              if (!jsonDic) {
                                                  NSLog(@"Error parsing JSON: %@", e);
                                              } else {
                                                  //handle the jsonArray to get ndbno
                                                  NSDictionary *list = jsonDic[@"list"];
                                                  NSArray *item = list[@"item"];

                                                  // now we have array of items
                                                  NSDictionary *firstItem = item.firstObject;
                                                  NSString *ndbno = firstItem[@"ndbno"];
                                                  NSLog(@"NDBno = %@",ndbno);
                                                  [self getFoodReport:ndbno];


                                              }
                                          }];
    [downloadTask resume];
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
