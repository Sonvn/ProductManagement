//
//  AddProductViewController.m
//  ManageProduct
//
//  Created by Sonvn on 4/24/14.
//  Copyright (c) 2014 MAC. All rights reserved.
//

#import "AddProductViewController.h"
#import "XProduct.h"

@interface AddProductViewController ()

@end


@implementation AddProductViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
		// Custom initialization
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
}

- (void)dismissKeyboard {
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

/*
   #pragma mark - Navigation

   // In a storyboard-based application, you will often want to do a little preparation before navigation
   - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
   {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
   }
 */

- (IBAction)save:(id)sender {
	if (self.productNameTextField.text.length > 0) {
		XProduct *product = [XProduct MR_createEntity];
		product.product_name = self.productNameTextField.text;
        product.category = [XCategory MR_findFirstByAttribute:@"category_name" withValue:self.productCategoryTextField.text];
        product.provider = [XProvider MR_findFirstByAttribute:@"provider_name" withValue:self.productProviderTextField.text];
		product.product_image = UIImagePNGRepresentation(self.productImageView.image);
        
        [self.managedObject addProductsObject:product];
        
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
	}

	[self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancel:(id)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)takePhoto:(UIButton *)sender {
	UIImagePickerController *picker = [[UIImagePickerController alloc] init];
	picker.delegate = self;
	picker.allowsEditing = YES;
	picker.sourceType = UIImagePickerControllerSourceTypeCamera;

	[self presentViewController:picker animated:YES completion:NULL];
}

- (IBAction)selectPhoto:(UIButton *)sender {
	UIImagePickerController *picker = [[UIImagePickerController alloc] init];
	picker.delegate = self;
	picker.allowsEditing = YES;
	picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;

	[self presentViewController:picker animated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
	UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
	self.productImageView.image = chosenImage;

	[picker dismissViewControllerAnimated:YES completion:NULL];
}

@end
