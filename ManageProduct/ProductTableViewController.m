//
//  ProductTableViewController.m
//  ManageProduct
//
//  Created by Sonvn on 4/24/14.
//  Copyright (c) 2014 MAC. All rights reserved.
//

#import "ProductTableViewController.h"
#import "DetailProductViewController.h"
#import "AddProductViewController.h"
#import "XProduct.h"

@interface ProductTableViewController ()

@property (nonatomic, strong) NSArray *products;

@end


@implementation ProductTableViewController

- (id)initWithStyle:(UITableViewStyle)style {
	self = [super initWithStyle:style];
	if (self) {
		// Custom initialization
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];

	// Uncomment the following line to preserve selection between presentations.
	// self.clearsSelectionOnViewWillAppear = NO;

	// Uncomment the following line to display an Edit button in the navigation bar for this view controller.
	// self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];

	if (self.managedObject) {
		self.products = [[self.managedObject products] allObjects];
	}
	else {
		self.products = [XProduct MR_findAll];
	}

	[self.tableView reloadData];

	NSLog(@"ProductTable:viewDidAppear. There are %lu products", (unsigned long)[self.products count]);
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	// Return the number of sections.
	return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	// Return the number of rows in the section.
	if (section == 0) {
		if ([self.managedObject isKindOfClass:[XCategory class]]) {
			return [self.managedObject providers].count;
		}
		else if ([self.managedObject isKindOfClass:[XProvider class]]) {
			return [self.managedObject categories].count;
		}
		else return 0;
	}
	else if (section == 1) {
		return [self.products count];
	}
	else return 0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	if ([self.managedObject isKindOfClass:[XCategory class]]) {
		if (section == 0) return @"Providers";
        else if (section == 1) return [NSString stringWithFormat:@"All Products in category %@", [self.managedObject category_name]];
        else return @"";
	}
	else if ([self.managedObject isKindOfClass:[XProvider class]]) {
		if (section == 0) return @"Providers";
        else if (section == 1) return [NSString stringWithFormat:@"All Products of %@", [self.managedObject provider_name]];
        else return @"";
	}
	else return @"";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListProductsCell" forIndexPath:indexPath];

	// Configure the cell...
	if (indexPath.section == 0) {
		if ([self.managedObject isKindOfClass:[XCategory class]]) {
			XProvider *provider = [[self.managedObject providers].allObjects objectAtIndex:indexPath.row];
			cell.textLabel.text = provider.provider_name;
		}
		else if ([self.managedObject isKindOfClass:[XProvider class]]) {
			XCategory *category = [[self.managedObject categories].allObjects objectAtIndex:indexPath.row];
			cell.textLabel.text = category.category_name;
		}
	}
	else if (indexPath.section == 1) {
		XProduct *product = [self.products objectAtIndex:indexPath.row];
		cell.textLabel.text = product.product_name;
	}

	return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
	// Return NO if you do not want the specified item to be editable.
	return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
	if (editingStyle == UITableViewCellEditingStyleDelete) {
		[tableView beginUpdates];

		// Delete the row from the data source
		if (indexPath.section == 0) {
		}
		else if (indexPath.section == 1) {
			XProduct *productToDelete = [self.products objectAtIndex:indexPath.row];

			if (self.managedObject) {
				[self.managedObject removeProductsObject:productToDelete];
				self.products = [[self.managedObject products] allObjects];
			}
			else {
				[productToDelete MR_deleteEntity];
				self.products = [XProduct MR_findAll];
			}
		}

		[[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];

		[tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];

		[tableView endUpdates];
	}
	else if (editingStyle == UITableViewCellEditingStyleInsert) {
		// Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
	}
}

/*
   // Override to support rearranging the table view.
   - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
   {
   }
 */

/*
   // Override to support conditional rearranging of the table view.
   - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
   {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
   }
 */


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	// Get the new view controller using [segue destinationViewController].
	// Pass the selected object to the new view controller.
	if ([segue.identifier isEqualToString:@"ProductTable2AddProductSegueID"]) {
		UINavigationController *destNavigationController = [segue destinationViewController];
		AddProductViewController *destViewController = [destNavigationController viewControllers][0];

		destViewController.managedObject = self.managedObject;
	}
	else if ([segue.identifier isEqualToString:@"ProductTable2ProductDetailSegueID"]) {
		DetailProductViewController *dest = [segue destinationViewController];
		NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
		XProduct *product = [self.products objectAtIndex:indexPath.row];

		dest.product = product;
	}
}

@end
