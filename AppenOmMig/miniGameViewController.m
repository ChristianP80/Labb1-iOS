//
//  miniGameViewController.m
//  AppenOmMig
//
//  Created by Christian Persson on 2018-01-15.
//  Copyright © 2018 Christian Persson. All rights reserved.
//

#import "miniGameViewController.h"
#import "SettingsViewController.h"

@interface miniGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *instructionLabel;
@property (weak, nonatomic) IBOutlet UILabel *helpTextLabel;
@property (weak, nonatomic) IBOutlet UISlider *numberSlider;
@property (weak, nonatomic) IBOutlet UILabel *sliderValue;
@property (weak, nonatomic) IBOutlet UIButton *guessButton;
@property (strong, nonatomic) IBOutlet UIView *ViewController;
@property (nonatomic) int randomNumber;
@end

@implementation miniGameViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self newGame];
    self.guessButton.layer.cornerRadius = 7;
}

- (void) loadViewIfNeeded {
    [super loadViewIfNeeded];
    [self updateColor];
}

-(void)updateColor{
    SettingsViewController *controller = [[SettingsViewController alloc] init];
    self.ViewController.backgroundColor = [controller getColor];
}

- (void)newGame {
    self.randomNumber = [self rndNumber];
    self.numberSlider.value = 50;
    self.sliderValue.text = [NSString stringWithFormat:@"%d", (int)self.numberSlider.value];
}

- (int) rndNumber {
    int tempRandom = arc4random_uniform(100) +1;
    return tempRandom;
}

- (IBAction)sliderChange:(id)sender {
    [self.sliderValue setText:[NSString stringWithFormat:@"%d", (int)self.numberSlider.value]];
}

- (IBAction)makeGuess:(id)sender {
    if ((int)self.numberSlider.value > self.randomNumber) {
        [self.helpTextLabel setText:[NSString stringWithFormat:@"Guess lower"]];
    } else if ((int)self.numberSlider.value < self.randomNumber) {
        [self.helpTextLabel setText:[NSString stringWithFormat:@"Guess higher"]];
    } else if ((int)self.numberSlider.value == self.randomNumber) {
        [self.helpTextLabel setText:[NSString stringWithFormat:@"Correct guess"]];
        [self newGame];
    }
} //

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
