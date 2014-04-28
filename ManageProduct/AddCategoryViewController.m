//
//  AddCategoryViewController.m
//  ManageProduct
//
//  Created by Sonvn on 4/23/14.
//  Copyright (c) 2014 MAC. All rights reserved.
//

#import "AddCategoryViewController.h"
#import "CategoryTableViewController.h"

#import "MyCategory.h"
#import "AppDelegate.h"

@interface AddCategoryViewController ()

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

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
	//1
	AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
	//2
	self.managedObjectContext = appDelegate.managedObjectContext;
}

- (IBAction)save:(id)sender {
	NSLog(@"Save button");
	NSManagedObjectContext *context = [self managedObjectContext];

	// Create a new device
	MyCategory *newCategory = [NSEntityDescription insertNewObjectForEntityForName:@"Category" inManagedObjectContext:context];
	// Save the object to persistent store
	newCategory.category_name = self.nameTextField.text;

	NSError *error;
	if (![self.managedObjectContext save:&error]) {
		NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
	}

	[self dismissViewControllerAnimated:YES completion:nil];
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
