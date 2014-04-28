//
//  MyCategory.h
//  ManageProduct
//
//  Created by Ngọc Nguyên on 4/28/14.
//  Copyright (c) 2014 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Category_Provider, MyProduct;

@interface MyCategory : NSManagedObject

@property (nonatomic, retain) NSString * category_name;
@property (nonatomic, retain) NSSet *with_product;
@property (nonatomic, retain) NSSet *with_category_provider;
@end

@interface MyCategory (CoreDataGeneratedAccessors)

- (void)addWith_productObject:(MyProduct *)value;
- (void)removeWith_productObject:(MyProduct *)value;
- (void)addWith_product:(NSSet *)values;
- (void)removeWith_product:(NSSet *)values;

- (void)addWith_category_providerObject:(Category_Provider *)value;
- (void)removeWith_category_providerObject:(Category_Provider *)value;
- (void)addWith_category_provider:(NSSet *)values;
- (void)removeWith_category_provider:(NSSet *)values;

@end
