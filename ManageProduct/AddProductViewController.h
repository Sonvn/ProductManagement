//
//  AddProductViewController.h
//  ManageProduct
//
//  Created by Sonvn on 4/24/14.
//  Copyright (c) 2014 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XCategory.h"
#import "XProvider.h"

@interface AddProductViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *productNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *categoryProductTextField;
@property (weak, nonatomic) IBOutlet UITextField *providerProductTextField;
@property (weak, nonatomic) IBOutlet UIImageView *productImageView;

@property (nonatomic, strong) id managedObject;

- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;
- (IBAction)takePhoto:  (UIButton *)sender;
- (IBAction)selectPhoto:(UIButton *)sender;


@end
