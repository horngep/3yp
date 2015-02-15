//
//  WeightInputVC.m
//  3YP
//
//  Created by I-Horng Huang on 16/01/2015.
//  Copyright (c) 2015 oxfordEngineering. All rights reserved.
//

#import "WeightInputVC.h"
#import "GlobalVar.h"

@interface WeightInputVC ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;

@end

@implementation WeightInputVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)submitButtonPressed:(id)sender {

    float weight = [self.textField.text floatValue];
    float height = 1.7f;           // hard coded

    float BMI = weight / (height * height);
    float k = BMI - 21.75f;
    if (k < 0){
        k = -k;
    }

    float weightScore = 100 * (1 - k/40);

    GlobalVar *globals = [GlobalVar sharedInstance];
    globals.weightScore = [NSNumber numberWithInt:weightScore];
    NSLog(@"BMI: %f, k = %f, score: %f",BMI, k, weightScore);
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
