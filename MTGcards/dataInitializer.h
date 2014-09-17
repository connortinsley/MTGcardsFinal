//
//  dataInitializer.h
//  MTGcards
//
//  Created by CCT on 9/8/14.
//  Copyright (c) 2014 CONNOR TINSLEY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface dataInitializer : NSObject

+(NSMutableArray*) loadJson;
+(NSString*) formatMoney:(NSNumber*) money;
@end
