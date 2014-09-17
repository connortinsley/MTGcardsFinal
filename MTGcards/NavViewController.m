//
//  NavViewController.m
//  MTGcards
//
//  Created by CCT on 9/8/14.
//  Copyright (c) 2014 CONNOR TINSLEY. All rights reserved.
//

#import "NavViewController.h"
#import "TableViewController.h"

@interface NavViewController ()

@end

@implementation NavViewController

@synthesize tvc;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    tvc = [[TableViewController alloc] initWithStyle:UITableViewStylePlain];
    self.viewControllers = [NSArray arrayWithObject:tvc];

    [tvc release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
