//
//  DetailProductViewController.h
//  ManageProduct
//
//  Created by Sonvn on 4/24/14.
//  Copyright (c) 2014 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailProductViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *productNameTextField;
@property (weak, nonatomic) IBOutlet UILabel *categoryProductTextField;
@property (weak, nonatomic) IBOutlet UILabel *providerProductTextField;
@property (weak, nonatomic) IBOutlet UIImageView *productImageView;
@property (strong, nonatomic) NSManagedObject *product;

@end
