//
//  SettingsViewController.m
//  AppenOmMig
//
//  Created by Christian Persson on 2018-01-15.
//  Copyright © 2018 Christian Persson. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISlider *redAmount;
@property (weak, nonatomic) IBOutlet UISlider *greenAmount;
@property (weak, nonatomic) IBOutlet UISlider *blueAmount;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;

@end

@implementation SettingsViewController
float redColor;
float greenColor;
float blueColor;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self refresh];
    _saveButton.layer.cornerRadius = 7;
    
    // Do any additional setup after loading the view.
}
- (void)loadViewIfNeeded {
    self.view.backgroundColor =[self getColor];    
}

- (IBAction)sliderChanged:(id)sender {
    [self refresh];
}
-(void)refresh {
    self.view.backgroundColor = [self currentColor];
}
-(UIColor*)currentColor {
    return [UIColor colorWithRed:self.redAmount.value
                           green:self.greenAmount.value
                           blue:self.blueAmount.value
                           alpha:1.0f];
}
-(UIColor*) defaultColor {
    return [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:1.0f];
}
-(UIColor*) getColor {
    if ([[self savedColor]isEqual:[self defaultColor]]){
        return [UIColor colorWithRed:0.59f green:0.87f blue:0.92f alpha:1.0f];
    } else {
        return [self savedColor];
    }
}

- (IBAction)saveChanges {
    [[NSUserDefaults standardUserDefaults] setFloat:self.redAmount.value forKey:@"redColorPreference"];
    [[NSUserDefaults standardUserDefaults] setFloat:self.greenAmount.value forKey:@"greenColorPreference"];
    [[NSUserDefaults standardUserDefaults] setFloat:self.blueAmount.value forKey:@"blueColorPreference"];
    [self savedColor];

}
-(UIColor*)savedColor {
    redColor = [[NSUserDefaults standardUserDefaults] floatForKey:@"redColorPreference"];
    greenColor = [[NSUserDefaults standardUserDefaults] floatForKey:@"greenColorPreference"];
    blueColor = [[NSUserDefaults standardUserDefaults] floatForKey:@"blueColorPreference"];
    return [UIColor colorWithRed:redColor green:greenColor blue:blueColor alpha:1.0f];
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
