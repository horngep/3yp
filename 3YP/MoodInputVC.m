//
//  MoodInputVC.m
//  3YP
//
//  Created by I-Horng Huang on 12/02/2015.
//  Copyright (c) 2015 oxfordEngineering. All rights reserved.
//

#import "MoodInputVC.h"
#import "GlobalVar.h"

@interface MoodInputVC ()
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property NSArray *questionArray;
@property int gad7Score;
@property int nextButtonClickedTimes;

//NOTE THAT THIS VC IS EXACTLY THE SAME AS StartQuestion2VC


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

    [self updateQuestion:0];
    self.gad7Score = 0;
    self.nextButtonClickedTimes = 0;
    [self.nextButton setTitle:@"Next" forState:UIControlStateNormal];

}

- (IBAction)nextButtonClicked:(id)sender {

    self.gad7Score += (int)self.segmentedControl.selectedSegmentIndex;
    //TODO: adding score (max 21)

    if (self.nextButtonClickedTimes <6){
        self.nextButtonClickedTimes += 1;
        [self updateQuestion:self.nextButtonClickedTimes];
    } else {
        [self.nextButton setTitle:@"Done" forState:UIControlStateNormal];
        NSLog(@"Total score = %d", self.gad7Score);

        GlobalVar *globals = [GlobalVar sharedInstance];
        globals.moodScore = [NSNumber numberWithInt:self.gad7Score];
    }
}

-(void)updateQuestion:(NSUInteger)questionNo{

    self.questionLabel.text = [self.questionArray objectAtIndex:questionNo];

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
