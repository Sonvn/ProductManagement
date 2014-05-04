//
//  DetailProductViewController.h
//  ManageProduct
//
//  Created by Sonvn on 4/24/14.
//  Copyright (c) 2014 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XProduct.h"
#import "XCategory.h"
#import "XProvider.h"

@interface DetailProductViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *productNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *categoryProductTextField;
@property (weak, nonatomic) IBOutlet UITextField *providerProductTextField;
@property (weak, nonatomic) IBOutlet UIImageView *productImageView;

@property (strong, nonatomic) id product;

@end
