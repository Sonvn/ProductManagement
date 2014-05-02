//
//  Product.h
//  ManageProduct
//
//  Created by Ngọc Nguyên on 5/2/14.
//  Copyright (c) 2014 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class PCategory, Provider;

@interface Product : NSManagedObject

@property (nonatomic, retain) NSString * product_category;
@property (nonatomic, retain) NSString * product_decription;
@property (nonatomic, retain) NSData * product_image;
@property (nonatomic, retain) NSString * product_name;
@property (nonatomic, retain) NSString * product_provider;
@property (nonatomic, retain) PCategory *with_category;
@property (nonatomic, retain) Provider *with_provider;

@end
