//
//  XCategory.h
//  ManageProduct
//
//  Created by Ngọc Nguyên on 5/3/14.
//  Copyright (c) 2014 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class XProduct, XProvider;

@interface XCategory : NSManagedObject

@property (nonatomic, retain) NSString * category_name;
@property (nonatomic, retain) NSSet *providers;
@property (nonatomic, retain) NSSet *products;
@end

@interface XCategory (CoreDataGeneratedAccessors)

- (void)addProvidersObject:(XProvider *)value;
- (void)removeProvidersObject:(XProvider *)value;
- (void)addProviders:(NSSet *)values;
- (void)removeProviders:(NSSet *)values;

- (void)addProductsObject:(XProduct *)value;
- (void)removeProductsObject:(XProduct *)value;
- (void)addProducts:(NSSet *)values;
- (void)removeProducts:(NSSet *)values;

@end
