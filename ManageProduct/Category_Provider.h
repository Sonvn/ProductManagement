//
//  Category_Provider.h
//  ManageProduct
//
//  Created by Ngọc Nguyên on 5/2/14.
//  Copyright (c) 2014 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class PCategory, Provider;

@interface Category_Provider : NSManagedObject

@property (nonatomic, retain) NSNumber * category;
@property (nonatomic, retain) NSNumber * provider;
@property (nonatomic, retain) PCategory *with_category;
@property (nonatomic, retain) Provider *with_provider;

@end
