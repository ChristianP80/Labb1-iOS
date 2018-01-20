//
//  ViewController.m
//  AppenOmMig
//
//  Created by Christian Persson on 2018-01-15.
//  Copyright © 2018 Christian Persson. All rights reserved.
//

#import "ViewController.h"
#import "SettingsViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIView *ViewController;
@property (weak, nonatomic) IBOutlet UIButton *meButton;
@property (weak, nonatomic) IBOutlet UIButton *storyButton;
@property (weak, nonatomic) IBOutlet UIButton *gameButton;
@property (weak, nonatomic) IBOutlet UIButton *settingsButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.meButton.layer.cornerRadius = 7;
    self.storyButton.layer.cornerRadius = 7;
    self.gameButton.layer.cornerRadius = 7;
    self.settingsButton.layer.cornerRadius = 7;
}

- (void) loadViewIfNeeded {
    [super loadViewIfNeeded];
    [self updateColor];
}

-(void)updateColor{
    SettingsViewController *controller = [[SettingsViewController alloc] init];
    self.ViewController.backgroundColor = [controller getColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
