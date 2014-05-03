//
//  DetailCategoryViewController.h
//  ManageProduct
//
//  Created by Ngọc Nguyên on 5/2/14.
//  Copyright (c) 2014 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XCategory.h"

@interface DetailCategoryViewController : UIViewController

@property (nonatomic, strong) XCategory *category;

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@end
