//
//  dataInitializer.m
//  MTGcards
//
//  Created by CCT on 9/8/14.
//  Copyright (c) 2014 CONNOR TINSLEY. All rights reserved.
//

#import "dataInitializer.h"
#import "Card.h"

#define API_URL "https://api.deckbrew.com/mtg/cards"


@implementation dataInitializer

//takes the price represented as cents by a single integer and turns it into a proper money format string
+(NSString*) formatMoney:(NSNumber*) money
{
    if(money)
    {
        
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
        NSString *formattedString = [formatter stringFromNumber:money];
        [formatter release];
        
        return formattedString;
        
    }
    
    else return @"Unknown";

}

//grabs the contents of a webpage and returns it in json form
+(NSMutableDictionary*) grabJson:(int) page
{
    
    NSString *webPage = [NSString stringWithFormat: @"%s?page=%i", API_URL, page];
    NSURL *rURL = [NSURL URLWithString:webPage];
    NSData *data = [NSData dataWithContentsOfURL:rURL];
    NSError *error;
    
    NSMutableDictionary *json = [NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingMutableContainers error: &error];
    
    return json;
}

//Extract the necessary information from the json, create a card object from it, and add it to the cards array
+(NSMutableArray *)parseJson:(NSMutableDictionary *)json
{
    NSMutableArray *cards = [[NSMutableArray alloc] init];
    for(NSDictionary *dict in json)
    {
        Card *card = [[Card alloc] init];
        
        NSArray *editionsArray = [dict valueForKey:@"editions"];
        NSDictionary *editionObject = editionsArray[0];
        
        card.image = [editionObject valueForKey:@"image_url"];
        card.name = [dict valueForKey:@"name"];
        
        NSDictionary *medianPrice = [editionObject valueForKey:@"price"];
        NSString *price = [medianPrice valueForKey:@"median"];
        NSString *formattedPrice = [ self formatMoney:[NSNumber numberWithFloat:([price floatValue]*.01)]];
        
        card.price = price ? formattedPrice : @"Unknown";
        [cards addObject:card];
        [card release];
    }
    
    return cards;
}

//Used to grab multiple json objects
+(NSMutableArray*) loadJson
{
    NSMutableArray* cards = [[NSMutableArray alloc] init];
    
    for(int page = 2; page <= 101; page=page+1)  // 100 pages/10,000 cards      use page <= 300 to get cards A-Zzz (I think all of them?)
    {
        NSMutableDictionary *json = [self grabJson: page];
        NSMutableArray *cards_for_page = [self parseJson: json];
        [cards addObjectsFromArray:cards_for_page];
    }
    
    return cards;
}

@end
