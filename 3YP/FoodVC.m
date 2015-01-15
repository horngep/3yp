//
//  FoodVC.m
//  3YP
//
//  Created by I-Horng Huang on 15/01/2015.
//  Copyright (c) 2015 oxfordEngineering. All rights reserved.
//

#import "FoodVC.h"

@interface FoodVC ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;


@end

@implementation FoodVC 

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)submitButtonClicked:(id)sender {

//TODO: send the number back to Main VC (or global variables? appdelegate?)

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
