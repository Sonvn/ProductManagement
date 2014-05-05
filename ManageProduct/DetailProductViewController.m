//
//  DetailProductViewController.m
//  ManageProduct
//
//  Created by Sonvn on 4/24/14.
//  Copyright (c) 2014 MAC. All rights reserved.
//

#import "DetailProductViewController.h"

@interface DetailProductViewController ()

@end

@implementation DetailProductViewController
@synthesize product;

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
	if (self.product) {
		self.productNameTextField.text = [self.product product_name];
        self.productCategoryTextField.text = [self.product.category category_name];
        self.productProviderTextField.text = [self.product.provider provider_name];
		self.productImageView.image = [UIImage imageWithData:[self.product product_image]];
		
        self.navigationItem.title = [self.product product_name];
	}
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
}

- (void)dismissKeyboard {
    [self.view endEditing:YES];
}

- (void)willMoveToParentViewController:(UIViewController *)parent{
    if (![parent isEqual:self.parentViewController]){
        self.product.product_name = self.productNameTextField.text;
        self.product.category = [XCategory MR_findFirstByAttribute:@"category_name" withValue:self.productCategoryTextField.text];
        self.product.provider = [XProvider MR_findFirstByAttribute:@"provider_name" withValue:self.productProviderTextField.text];
        self.product.product_image = UIImagePNGRepresentation(self.productImageView.image);
    }
    
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([[segue identifier] isEqualToString:@"EditInformation"]) {
		DetailProductViewController *destViewController = segue.destinationViewController;
		//
		//destViewController.product = self.product;
	}
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


/*
   #pragma mark - Navigation

   // In a storyboard-based application, you will often want to do a little preparation before navigation
   - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
   {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
   }
 */

@end
