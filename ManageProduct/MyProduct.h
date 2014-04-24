//
//  Product.h
//  ManageProduct
//
//  Created by Ngọc Nguyên on 4/24/14.
//  Copyright (c) 2014 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class MyCategory, MyProvider;

@interface MyProduct : NSManagedObject

@property (nonatomic, retain) NSString * product_category;
@property (nonatomic, retain) NSString * product_decription;
@property (nonatomic, retain) NSNumber * product_id;
@property (nonatomic, retain) NSData * product_image;
@property (nonatomic, retain) NSString * product_name;
@property (nonatomic, retain) NSString * product_provider;
@property (nonatomic, retain) MyCategory *with_category;
@property (nonatomic, retain) MyProvider *with_provider;

@end
