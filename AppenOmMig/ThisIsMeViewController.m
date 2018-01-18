//
//  ThisIsMeViewController.m
//  AppenOmMig
//
//  Created by Christian Persson on 2018-01-17.
//  Copyright © 2018 Christian Persson. All rights reserved.
//

#import "ThisIsMeViewController.h"
#import "SettingsViewController.h"

@interface ThisIsMeViewController ()
@property (strong, nonatomic) IBOutlet UIView *ViewController;

@end

@implementation ThisIsMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
