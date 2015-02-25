//
//  WSManager.m
//  Interview
//
//  Created by Marian Goia on 24/02/15.
//  Copyright (c) 2015 Marian Goia. All rights reserved.
//

#import "WSManager.h"
#import "AFNetworking.h"
#import <Mantle/Mantle.h>

static NSString * const kBaseResourceURL           = @"http://downloadapp.youwow.me/iPhone/iOSTest/contacts.json#http://downloadapp.youwow.me/iPhone/iOSTest/";
static NSString * const kContactsResourceURL       = @"contacts.json";

@implementation WSManager

+ (id)sharedManager {
    
    static WSManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
    });
    return sharedManager;
}

- (void)requestAllContactGroupsWithCompetionBlock:(void (^) (IContacts *contacts, NSError *error))completionBlock {
    
    NSString *urlString = [NSString stringWithFormat:@"%@%@", kBaseResourceURL, kContactsResourceURL];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *requestOperation = [[AFHTTPRequestOperation alloc] initWithRequest:urlRequest];
    requestOperation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [requestOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        IContacts *contacts = [MTLJSONAdapter modelOfClass:[IContacts class] fromJSONDictionary:operation.responseObject error:nil];
        
        completionBlock(contacts, nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error fetching contacts: %@", error.localizedDescription);
        completionBlock(nil, error);
    }];
    
    [requestOperation start];
}

@end
