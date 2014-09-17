//
//  CellViewController.m
//  MTGcards
//
//  Created by CCT on 9/8/14.
//  Copyright (c) 2014 CONNOR TINSLEY. All rights reserved.
//

#import "CellViewController.h"
#import "TableViewController.h"
#import "Card.h"

@interface CellViewController ()

@end

@implementation CellViewController

@synthesize names;

//takes the image data from the webpage specified by the json and creates an image of a particular card
- (void)drawCard
{
    
    NSURL *imageUrl = [NSURL URLWithString: _card.image ];
    NSData *imageData = [NSData dataWithContentsOfURL:imageUrl];
    fullSize = [[UIImageView alloc] initWithImage:[UIImage imageWithData:imageData]];
    [fullSize setFrame:CGRectMake(50, 100, 200, 300)];
    fullSize.userInteractionEnabled = YES;
    [self.view addSubview:fullSize];
}

//creates the label at the bottom that specifies the median price of a card
- (void) drawLabel
{
    UILabel *priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(10,420,450,15)];
    priceLabel.text = [NSString stringWithFormat:@"Median Price: %@", _card.price];
    
    [self.view addSubview:priceLabel];
  
    self.names = [[UILabel alloc] initWithFrame:CGRectMake(10,30,300,100)];
    
    self.names.text = _card.name;
    self.names.textColor = [UIColor whiteColor];
    
    [self.view addSubview:self.names];
    
    [self.names release];
    [priceLabel release];

}

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
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"fire.jpg"]];
        
    [self drawCard];
    [self drawLabel];
    
    [fullSize release];
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}




@end
