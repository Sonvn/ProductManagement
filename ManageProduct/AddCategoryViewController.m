//
//  AddCategoryViewController.m
//  ManageProduct
//
//  Created by Sonvn on 4/23/14.
//  Copyright (c) 2014 MAC. All rights reserved.
//

#import "AddCategoryViewController.h"
//#import "CategoryTableViewController.h"

#import "XCategory.h"
#import "AppDelegate.h"

@interface AddCategoryViewController ()

@end

@implementation AddCategoryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
		// Custom initialization
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view
}

- (IBAction)save:(id)sender {
	NSLog(@"Save button");
    
    if (self.categoryNameTextField.text.length > 0){
        XCategory *newCategory = [XCategory MR_createEntity];
        newCategory.category_name = self.categoryNameTextField.text;
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
	
}

- (IBAction)cancel:(id)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
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

@end
