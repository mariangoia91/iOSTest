//
//  IContacts.m
//  Interview
//
//  Created by Marian Goia on 25/02/15.
//  Copyright (c) 2015 Marian Goia. All rights reserved.
//

#import "IContacts.h"
#import "IGroup.h"

@implementation IContacts

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    
    return @{
             @"groups": @"groups",
             };
}

+ (NSValueTransformer *)groupsJSONTransformer {
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[IGroup class]];
}

@end
