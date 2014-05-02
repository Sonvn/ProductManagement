//
//  AddCategoryViewController.h
//  ManageProduct
//
//  Created by Sonvn on 4/23/14.
//  Copyright (c) 2014 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddCategoryViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *categoryNameTextField;

- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;

@end
