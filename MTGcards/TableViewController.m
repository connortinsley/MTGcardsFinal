//
//  TableViewController.m
//  MTGcards
//
//  Created by CCT on 9/8/14.
//  Copyright (c) 2014 CONNOR TINSLEY. All rights reserved.
//

#import "TableViewController.h"
#import "NavViewController.h"
#import "CellViewController.h"
#import "dataInitializer.h"

@interface TableViewController ()

@end

@implementation TableViewController


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Magic: The Gathering Playing Cards";

    self.tableView.backgroundColor = [UIColor blackColor];
    self.tableView.opaque = NO;
    [self.navigationController.navigationBar setBarTintColor:[UIColor darkGrayColor]];
    

    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];   //need to do this to register class
    
    dispatch_async(dispatch_get_main_queue(), ^{    // Don't wait on grabbing all the data before anything happens
        _cardArray = [ dataInitializer loadJson];
        [self.tableView reloadData];
    });
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [_cardArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *tabitem = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tabitem forIndexPath:indexPath];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tabitem];
    }
    
    Card *card = [_cardArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = card.name;
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.backgroundColor = [UIColor blackColor];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    CellViewController *Cellv = [[CellViewController alloc] initWithNibName:@"CellViewController" bundle:nil];
    
    Cellv.card = [_cardArray objectAtIndex:indexPath.row];    
    
    [self.navigationController pushViewController:Cellv animated:YES];
    [Cellv release];

}


@end
