//
//  User.h
//  NSDefaultsPractice
//
//  Created by Anish Kodeboyina on 9/30/16.
//  Copyright © 2016 Anish Kodeboyina. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;

@property (nonatomic, strong) NSString *emailID;
@property (nonatomic) NSInteger age;

+ (id)sharedInstance;

+ (void)storeUser:(User *)user;

@end
