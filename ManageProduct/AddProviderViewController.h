//
//  AddProviderViewController.h
//  ManageProduct
//
//  Created by Sonvn on 4/24/14.
//  Copyright (c) 2014 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddProviderViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *providerNameTextField;

- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;

@end
