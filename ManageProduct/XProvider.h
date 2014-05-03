//
//  XProvider.h
//  ManageProduct
//
//  Created by Ngọc Nguyên on 5/3/14.
//  Copyright (c) 2014 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class XCategory, XProduct;

@interface XProvider : NSManagedObject

@property (nonatomic, retain) NSString * provider_name;
@property (nonatomic, retain) NSSet *categories;
@property (nonatomic, retain) NSSet *products;
@end

@interface XProvider (CoreDataGeneratedAccessors)

- (void)addCategoriesObject:(XCategory *)value;
- (void)removeCategoriesObject:(XCategory *)value;
- (void)addCategories:(NSSet *)values;
- (void)removeCategories:(NSSet *)values;

- (void)addProductsObject:(XProduct *)value;
- (void)removeProductsObject:(XProduct *)value;
- (void)addProducts:(NSSet *)values;
- (void)removeProducts:(NSSet *)values;

@end
