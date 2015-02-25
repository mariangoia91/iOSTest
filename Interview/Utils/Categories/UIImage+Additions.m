//
//  UIImage+Additions.m
//  Interview
//
//  Created by Marian Goia on 25/02/15.
//  Copyright (c) 2015 Marian Goia. All rights reserved.
//

#import "UIImage+Additions.h"

@implementation UIImage (Additions)

+ (UIImage *)imageForStatus:(NSString *)status {
    
    if ([status isEqualToString:@"busy"]) {
        return [UIImage imageNamed:@"contacts_list_status_busy"];
        
    } else if ([status isEqualToString:@"online"]) {
        return [UIImage imageNamed:@"contacts_list_status_online"];
        
    } else if ([status isEqualToString:@"offline"]) {
        return [UIImage imageNamed:@"contacts_list_status_offline"];
        
    } else  if ([status isEqualToString:@"away"]) {
        return [UIImage imageNamed:@"contacts_list_status_away"];
        
    } else  if ([status isEqualToString:@"callforwarding"]) {
        return [UIImage imageNamed:@"contacts_lcall_forward"];
    }
    
    return nil;
}

+ (UIImage *)imageForAvatar:(NSString *)avatar {
    
    if ([avatar isEqualToString:@"male"]) {
        return [UIImage imageNamed:@"contacts_list_avatar_male"];
        
    } else if ([avatar isEqualToString:@"female"]) {
        return [UIImage imageNamed:@"contacts_list_avatar_female"];
    }
    
    return [UIImage imageNamed:@"contacts_list_avatar_unknown"];
}

@end
