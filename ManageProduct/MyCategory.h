//
//  Category.h
//  ManageProduct
//
//  Created by Ngọc Nguyên on 4/24/14.
//  Copyright (c) 2014 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class MyProduct, Provider_Category;

@interface MyCategory : NSManagedObject

@property (nonatomic, retain) NSNumber * category_id;
@property (nonatomic, retain) NSString * category_name;
@property (nonatomic, retain) MyProduct *with_product;
@property (nonatomic, retain) Provider_Category *with_provider_category;

@end
