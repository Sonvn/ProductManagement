//
//  Category_Provider.h
//  ManageProduct
//
//  Created by Ngọc Nguyên on 4/28/14.
//  Copyright (c) 2014 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class MyCategory, MyProvider;

@interface Category_Provider : NSManagedObject

@property (nonatomic, retain) NSNumber * category;
@property (nonatomic, retain) NSNumber * provider;
@property (nonatomic, retain) MyCategory *with_category;
@property (nonatomic, retain) MyProvider *with_provider;

@end
