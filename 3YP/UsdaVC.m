//
//  UsdaVC.m
//  3YP
//
//  Created by I-Horng Huang on 25/01/2015.
//  Copyright (c) 2015 oxfordEngineering. All rights reserved.
//

#import "UsdaVC.h"
#import "FoodDetailVC.h"

@interface UsdaVC () <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSArray *searchedFoodArray;


@end

@implementation UsdaVC

// API Key : GqZ0PsBrk1KGw8zyhQ1x6TLQPZMsGhjekVfjj6vu


- (void)viewDidLoad {
    [super viewDidLoad];

    self.searchBar.delegate = self;
    self.searchedFoodArray = [NSArray new];
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
                                                  self.searchedFoodArray = list[@"item"];
                                                  //NSLog(@"%@",self.searchedFoodArray);
                                                  [self.tableView reloadData];
                                                  // now we have array of items
                                              }
                                          }];
    [downloadTask resume];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - SearchBar delegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self searchFood:searchBar.text];
    NSLog(@"Searching");
}

#pragma mark - TableView Datasource and Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.searchedFoodArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    NSDictionary *item = [self.searchedFoodArray objectAtIndex:indexPath.row];
    cell.textLabel.text = item[@"name"];
    NSLog(@"%@",item[@"name"]);
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //send ndbno string to the food detail view
    NSDictionary *selectedItem = [self.searchedFoodArray objectAtIndex:indexPath.row];
    NSString *ndbno = selectedItem[@"ndbno"];

    FoodDetailVC* foodDetailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"FoodDetailVC"];
    foodDetailVC.ndbno = ndbno;
    [self.navigationController pushViewController:foodDetailVC animated:YES];
}

@end
