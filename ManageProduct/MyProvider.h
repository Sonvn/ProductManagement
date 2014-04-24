//
//  Provider.h
//  ManageProduct
//
//  Created by Ngọc Nguyên on 4/24/14.
//  Copyright (c) 2014 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class MyProduct, Provider_Category;

@interface MyProvider : NSManagedObject

@property (nonatomic, retain) NSNumber * provider_id;
@property (nonatomic, retain) NSString * provider_name;
@property (nonatomic, retain) MyProduct *with_product;
@property (nonatomic, retain) Provider_Category *with_provider_category;

@end
