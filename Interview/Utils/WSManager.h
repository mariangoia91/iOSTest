//
//  WSManager.h
//  Interview
//
//  Created by Marian Goia on 24/02/15.
//  Copyright (c) 2015 Marian Goia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IContacts.h"

@interface WSManager : NSObject

+ (id)sharedManager;

- (void)requestAllContactGroupsWithCompetionBlock:(void (^) (IContacts *contacts, NSError *error))completionBlock;

@end
