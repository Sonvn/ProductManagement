//
//  AddProductViewController.h
//  ManageProduct
//
//  Created by Sonvn on 4/24/14.
//  Copyright (c) 2014 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddProductViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *productNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *categoryProductTextField;
@property (weak, nonatomic) IBOutlet UITextField *providerProductTextField;
@property (weak, nonatomic) IBOutlet UIImageView *productImageView;
@property (strong, nonatomic) NSManagedObject *product;
- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;
- (IBAction)takePhoto:  (UIButton *)sender;
- (IBAction)selectPhoto:(UIButton *)sender;


@end
