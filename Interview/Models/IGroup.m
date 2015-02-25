//
//  IGroup.m
//  Interview
//
//  Created by Marian Goia on 25/02/15.
//  Copyright (c) 2015 Marian Goia. All rights reserved.
//

#import "IGroup.h"
#import "IContact.h"

@implementation IGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    
    return @{
             @"groupName": @"groupName",
             @"people": @"people",
             };
}

+ (NSValueTransformer *)peopleJSONTransformer {
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[IContact class]];
}

@end
