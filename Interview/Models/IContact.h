//
//  IContact.h
//  Interview
//
//  Created by Marian Goia on 25/02/15.
//  Copyright (c) 2015 Marian Goia. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface IContact : MTLModel <MTLJSONSerializing>

@property (strong, nonatomic, readwrite) NSString *firstName;
@property (strong, nonatomic, readwrite) NSString *lastName;
@property (strong, nonatomic, readwrite) NSString *statusIcon;
@property (strong, nonatomic, readwrite) NSString *statusMessage;

@end
