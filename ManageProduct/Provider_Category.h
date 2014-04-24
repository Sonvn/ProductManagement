//
//  Provider_Category.h
//  ManageProduct
//
//  Created by Ngọc Nguyên on 4/24/14.
//  Copyright (c) 2014 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class MyCategory, MyProvider;

@interface Provider_Category : NSManagedObject

@property (nonatomic, retain) NSString * id;
@property (nonatomic, retain) NSNumber * id_category;
@property (nonatomic, retain) NSNumber * id_product;
@property (nonatomic, retain) MyCategory *with_category;
@property (nonatomic, retain) MyProvider *with_provider;

@end
