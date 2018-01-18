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
@end

@implementation miniGameViewController
int sliderValue;
int randomNumber;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self newGame];

    // Do any additional setup after loading the view.
}
- (int) randomNumber {
    int randomNumber = arc4random_uniform(100) +1;
    return randomNumber;
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
    randomNumber = [self randomNumber];
    _numberSlider.value = 50;
    [_sliderValue setText:[NSString stringWithFormat:@"%d", [self getValue]]];
}

- (IBAction)sliderChange:(id)sender {
    sliderValue = [self getValue];
    [_sliderValue setText:[NSString stringWithFormat:@"%d", sliderValue]];
}
- (int)getValue {
    return _numberSlider.value;
}
- (IBAction)makeGuess:(id)sender {
    if (sliderValue > randomNumber) {
        [_helpTextLabel setText:[NSString stringWithFormat:@"Guess lower"]];
    } else if (sliderValue < randomNumber) {
        [_helpTextLabel setText:[NSString stringWithFormat:@"Guess higher"]];
    } else if (sliderValue == randomNumber) {
        [_helpTextLabel setText:[NSString stringWithFormat:@"Correct guess"]];
        [self newGame];
    }
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
