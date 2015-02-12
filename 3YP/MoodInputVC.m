//
//  MoodInputVC.m
//  3YP
//
//  Created by I-Horng Huang on 12/02/2015.
//  Copyright (c) 2015 oxfordEngineering. All rights reserved.
//

#import "MoodInputVC.h"

@interface MoodInputVC ()
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property NSArray *questionArray;


@end

@implementation MoodInputVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.questionArray = [[NSArray alloc] initWithObjects:
                          @"1. Feeling nervous, anxious or on edge",
                          @"2. Not being able to stop or control worrying",
                          @"3. Worrying too much about different things ",
                          @"4. Trouble relaxing",
                          @"5. Being so restless that it is hard to sit still ",
                          @"6. Becoming easily annoyed or irritable ",
                          @"7. Feeling afraid as if something awful might happen ", nil];
}

- (IBAction)nextButtonClicked:(id)sender {
    //TODO: adding score (max 21)
    //TODO: everytime pressing next, change question
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
