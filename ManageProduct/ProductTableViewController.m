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
    
    self.products = [[self.managedObject products] allObjects];
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
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	// Return the number of rows in the section.
	return [self.products count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CellIdentifier = @"Cell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

	// Configure the cell...
	XProduct *product = [self.products objectAtIndex:indexPath.row];
	cell.textLabel.text = product.product_name;
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
        XProduct *productToDelete = [self.products objectAtIndex:indexPath.row];
        [self.managedObject removeProductsObject:productToDelete];
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
        
        self.products = [[self.managedObject products] allObjects];
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
    else if ([segue.identifier isEqualToString:@"ProductTable2ProductDetailSegueID"]){
        DetailProductViewController *dest = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        XProduct *product = [self.products objectAtIndex:indexPath.row];
        
        dest.product = product;
    }
}

@end
