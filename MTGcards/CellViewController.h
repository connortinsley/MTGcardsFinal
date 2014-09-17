//
//  CellViewController.h
//  MTGcards
//
//  Created by CCT on 9/8/14.
//  Copyright (c) 2014 CONNOR TINSLEY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Card.h"

@protocol MyUsefulDelegate <NSObject>
- (void)infoReturned:(id)objectReturned;
@end

@interface CellViewController : UIViewController

{
    UIImageView *fullSize;
}

- (void) drawCard;
- (void) drawLabel;


@property (strong, nonatomic) UILabel *names;
@property (strong, nonatomic) UILabel *types;

@property (strong, nonatomic) Card *card;

@end
