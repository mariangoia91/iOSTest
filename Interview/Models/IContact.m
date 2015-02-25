//
//  IContact.m
//  Interview
//
//  Created by Marian Goia on 25/02/15.
//  Copyright (c) 2015 Marian Goia. All rights reserved.
//

#import "IContact.h"

@implementation IContact

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    
    return @{
             @"firstName": @"firstName",
             @"lastName": @"lastName",
             @"statusIcon": @"statusIcon",
             @"statusMessage": @"statusMessage",
             };
}

@end
