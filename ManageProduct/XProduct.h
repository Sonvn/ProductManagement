//
//  XProduct.h
//  ManageProduct
//
//  Created by Ngọc Nguyên on 5/3/14.
//  Copyright (c) 2014 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class XCategory, XProvider;

@interface XProduct : NSManagedObject

@property (nonatomic, retain) NSString * product_description;
@property (nonatomic, retain) NSData * product_image;
@property (nonatomic, retain) NSString * product_name;
@property (nonatomic, retain) XCategory *category;
@property (nonatomic, retain) XProvider *provider;

@end
