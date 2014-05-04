//
//  DetailProviderViewController.h
//  ManageProduct
//
//  Created by Ngọc Nguyên on 5/2/14.
//  Copyright (c) 2014 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XProvider.h"

@interface DetailProviderViewController : UIViewController

@property (nonatomic, strong) XProvider *provider;

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@end
