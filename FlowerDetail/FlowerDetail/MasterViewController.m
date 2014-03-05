//
//  MasterViewController.m
//  FlowerDetail
//
//  Created by 孙晓冬 on 14-3-1.
//  Copyright (c) 2014年 孙晓冬. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"

@interface MasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation MasterViewController

- (void)awakeFromNib
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.preferredContentSize = CGSizeMake(320.0, 600.0);
    }
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    self.navigationItem.leftBarButtonItem = self.editButtonItem;

//    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
//    self.navigationItem.rightBarButtonItem = addButton;
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    [self createFlowerData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.flowerSections count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.flowerData objectAtIndex:section] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self.flowerSections objectAtIndex:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"flowerCell"];
    NSDictionary *data = [[self.flowerData objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    cell.textLabel.text = [data objectForKey:@"name"];
    cell.detailTextLabel.text = [data objectForKey:@"url"];
    cell.imageView.image = [UIImage imageNamed:[data objectForKey:@"picture"]];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
        NSDictionary *data = [[self.flowerData objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
        self.detailViewController.detailItem = data;
   
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        self.detailViewController = [segue destinationViewController];
    }
}

- (void)createFlowerData {
    NSMutableArray *redFlowers;
    NSMutableArray *blueFlowers;
    
    self.flowerSections = [[NSArray alloc] initWithObjects:@"Red Flowers", @"Blue Flowers", nil];
    redFlowers = [[NSMutableArray alloc] init];
    blueFlowers = [[NSMutableArray alloc] init];
    
    [redFlowers addObject:
     [[NSDictionary alloc] initWithObjectsAndKeys:
      @"Poppy", @"name", @"poppy.png", @"picture", @"http://en.wikipedia.org/wiki/Poppy", @"url",nil]];
    [redFlowers addObject:
     [[NSDictionary alloc] initWithObjectsAndKeys:
      @"Tulip", @"name", @"tulip.png", @"picture", @"http://en.wikipedia.org/wiki/Tulip", @"url",nil]];
    [blueFlowers addObject:
     [[NSDictionary alloc] initWithObjectsAndKeys:
      @"Hyacinth", @"name", @"hyacinth", @"picture", @"http://en.wikipedia.org/wiki/Hyacinth", @"url",nil]];
    [blueFlowers addObject:
     [[NSDictionary alloc] initWithObjectsAndKeys:
      @"Hydrangea", @"name", @"hydrangea.png", @"picture", @"http://en.wikipedia.org/wiki/Hydrangea", @"url",nil]];
    self.flowerData = [[NSArray alloc] initWithObjects:redFlowers, blueFlowers, nil];
    
    
}

@end
