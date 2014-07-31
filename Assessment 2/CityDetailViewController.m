//
//  CityDetailViewController.m
//  Assessment 2
//
//  Created by ETC ComputerLand on 7/31/14.
//  Copyright (c) 2014 cmeats. All rights reserved.
//

#import "CityDetailViewController.h"

@interface CityDetailViewController ()
@property (strong, nonatomic) IBOutlet UILabel *cityLabel;
@property (strong, nonatomic) IBOutlet UILabel *stateLabel;
@property (strong, nonatomic) IBOutlet UITextField *cityTextField;
@property (strong, nonatomic) IBOutlet UITextField *stateTextField;

@end

@implementation CityDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.cityTextField.hidden = YES;
    self.stateTextField.hidden = YES;

    self.cityLabel.text = self.city.name;
    self.stateLabel.text = self.city.state;
}
- (IBAction)onEditButtonPressed:(id)sender {
    if (self.editing) {
        self.editing = NO;
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        self.cityLabel.hidden = NO;
        self.cityTextField.hidden = YES;

        self.stateLabel.hidden = NO;
        self.stateTextField.hidden = YES;

        self.city.name = self.cityTextField.text;
        self.city.state = self.stateTextField.text;

        self.cityLabel.text = self.city.name;
        self.stateLabel.text = self.city.state;


        [self.cityTableView reloadData];
    } else {
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        self.editing = YES;


        self.cityLabel.hidden = YES;
        self.cityTextField.hidden = NO;

        self.stateLabel.hidden = YES;
        self.stateTextField.hidden = NO;

        self.cityTextField.text = self.city.name;
        self.stateTextField.text = self.city.state;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
