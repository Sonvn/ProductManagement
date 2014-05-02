//
//  PCategory.h
//  ManageProduct
//
//  Created by Ngọc Nguyên on 5/2/14.
//  Copyright (c) 2014 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Category_Provider, Product;

@interface PCategory : NSManagedObject

@property (nonatomic, retain) NSString * category_name;
@property (nonatomic, retain) NSSet *with_category_provider;
@property (nonatomic, retain) NSSet *with_product;
@end

@interface PCategory (CoreDataGeneratedAccessors)

- (void)addWith_category_providerObject:(Category_Provider *)value;
- (void)removeWith_category_providerObject:(Category_Provider *)value;
- (void)addWith_category_provider:(NSSet *)values;
- (void)removeWith_category_provider:(NSSet *)values;

- (void)addWith_productObject:(Product *)value;
- (void)removeWith_productObject:(Product *)value;
- (void)addWith_product:(NSSet *)values;
- (void)removeWith_product:(NSSet *)values;

@end
