//
//  IContacts.h
//  Interview
//
//  Created by Marian Goia on 25/02/15.
//  Copyright (c) 2015 Marian Goia. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface IContacts : MTLModel <MTLJSONSerializing>

@property (strong, nonatomic, readwrite) NSArray *groups;

@end
