//
//  FoodWebVC.m
//  3YP
//
//  Created by I-Horng Huang on 15/01/2015.
//  Copyright (c) 2015 oxfordEngineering. All rights reserved.
//

#import "FoodWebVC.h"

@interface FoodWebVC () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation FoodWebVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"CalorieKing Food Database";
    
    NSString *urlString = @"http://www.calorieking.com/foods/";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:urlRequest];

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
