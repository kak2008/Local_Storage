//
//  User.m
//  NSDefaultsPractice
//
//  Created by Anish Kodeboyina on 9/30/16.
//  Copyright © 2016 Anish Kodeboyina. All rights reserved.
//

#import "User.h"

NSString *const kStorageKeyUser = @"user";

NSString *const kCoderKeyFirstName = @"firstName";
NSString *const kCoderKeyLastName = @"lastName";
NSString *const kCoderKeyEmailID = @"emailID";
NSString *const kCoderKeyAge = @"age";

@implementation User

- (void)encodeWithCoder:(NSCoder *)coder {
    
    [coder encodeObject:self.firstName forKey:kCoderKeyFirstName];
    [coder encodeObject:self.lastName forKey:kCoderKeyLastName];
    [coder encodeObject:self.emailID forKey:kCoderKeyEmailID];
    [coder encodeInteger:self.age forKey:kCoderKeyAge];
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        self.firstName = [coder decodeObjectForKey:kCoderKeyFirstName];
        self.lastName = [coder decodeObjectForKey:kCoderKeyLastName];
        self.emailID = [coder decodeObjectForKey:kCoderKeyEmailID];
        self.age = [coder decodeIntegerForKey:kCoderKeyAge];
    }
    return self;
}

+(id)sharedInstance {
    static User *sharedInstace = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        User *user = [self loadUser];
        if (user) {
            sharedInstace = user;
        }
        else {
            sharedInstace = [User new];
        }
    });
    
    return sharedInstace;
}

#pragma Storage Helper Methods

+ (void)storeUser:(User *)user {
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:user];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:data forKey:kStorageKeyUser];
    [defaults synchronize];
}

+ (User *)loadUser {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *responseData = [defaults objectForKey:kStorageKeyUser];
    User *user = [NSKeyedUnarchiver unarchiveObjectWithData:responseData];
    
    return user;
}


@end
