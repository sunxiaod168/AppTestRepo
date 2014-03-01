//
//  ViewController.m
//  FlowerColorTable
//
//  Created by 孙晓冬 on 14-3-1.
//  Copyright (c) 2014年 孙晓冬. All rights reserved.
//

#import "ViewController.h"
#define kSectionCount 2
#define kRedSection 0
#define kBlueSection 1

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.redFlowers = [[NSArray alloc] initWithObjects:@"Gerbera",@"Peony", @"Rose", @"Poppy", nil];
    self.blueFlower = [[NSArray alloc] initWithObjects:@"Hydrangea", @"Sea Holly", @"Phlox", @"Iris", nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return kSectionCount;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == kRedSection) {
        return [self.redFlowers count];
    }else{
        return [self.blueFlower count];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == kRedSection) {
        return @"Red";
    }else{
        return @"Blue";
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"flowerCell"];
    if (indexPath.section == kRedSection) {
        cell.textLabel.text = [self.redFlowers objectAtIndex:indexPath.row];
    }else{
        cell.textLabel.text = [self.blueFlower objectAtIndex:indexPath.row];
    }
    UIImage *flowerImage = [UIImage imageNamed:[[NSString alloc] initWithFormat:@"%@.png", cell.textLabel.text]];
    cell.imageView.image = flowerImage;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIAlertView *showSelection;
    NSString *flowerMessage;
    switch (indexPath.section) {
        case kRedSection:
            flowerMessage = [[NSString alloc] initWithFormat:@"You chose the red flower - %@", [self.redFlowers objectAtIndex:indexPath.row]];
            break;
        case kBlueSection:
            flowerMessage = [[NSString alloc] initWithFormat:@"You chose the blue flower - %@", [self.blueFlower objectAtIndex:indexPath.row]];
            break;
            
        default:
            flowerMessage = [[NSString alloc] initWithFormat:@"I have no idea what you chose?!"];
            break;
    }
    showSelection = [[UIAlertView alloc] initWithTitle:@"Flower Selected"
                                               message:flowerMessage
                                              delegate:nil
                                             cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [showSelection show];
}

@end
