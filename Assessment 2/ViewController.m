//
//  ViewController.m
//  Assessment 2
//
//  Created by ETC ComputerLand on 7/31/14.
//  Copyright (c) 2014 cmeats. All rights reserved.
//

#import "ViewController.h"
#import "City.h"
#import "CityDetailViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *cityTableView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    City *versailles = [[City alloc] initWithName:@"Versailles" state:@"IL"];
    City *quincy = [[City alloc] initWithName:@"Quincy" state:@"IL"];
    City *liberty = [[City alloc] initWithName:@"Liberty" state:@"IL"];
    City *payson = [[City alloc] initWithName:@"Payson" state:@"IL"];

    self.cities = [NSMutableArray arrayWithObjects:
                   versailles,
                   quincy,
                   liberty,
                   payson,
                   nil];


}
- (IBAction)onEditButtonPressed:(id)sender
{
    if(self.cityTableView.editing) {
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        [self.cityTableView setEditing:NO animated:YES];
    } else {
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        [self.cityTableView setEditing:YES animated:YES];
    }
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cities.count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    City *city = [self.cities objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    cell.textLabel.text = [NSString stringWithFormat:@"%@, %@", city.name, city.state];
    return cell;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (self.cityTableView.editing) {
//        [self.cities removeObjectAtIndex:indexPath.row];
//        [self.cityTableView reloadData];
//    }
//}


-(void)tableView:(UITableView *)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath
{

}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.cities removeObjectAtIndex:indexPath.row];
    [self.cityTableView reloadData];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.cityTableView indexPathForSelectedRow];
    CityDetailViewController *dvc = [segue destinationViewController];
    dvc.city = self.cities[indexPath.row];
    dvc.cityTableView = self.cityTableView;
}

@end
