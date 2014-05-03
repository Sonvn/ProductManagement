//
//  CategoryTableViewController.m
//  ManageProduct
//
//  Created by Ngọc Nguyên on 4/22/14.
//  Copyright (c) 2014 MAC. All rights reserved.
//

#import "CategoryTableViewController.h"
#import "AddCategoryViewController.h"
#import "DetailCategoryViewController.h"
#import "XCategory.h"

@interface CategoryTableViewController ()

@end

@implementation CategoryTableViewController

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
//    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	self.categories = [XCategory MR_findAll];
	[self.tableView reloadData];
	NSLog(@"viewDidAppear. There are %lu categories", (unsigned long)[self.categories count]);
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)addCategory:(id)sender {
	AddCategoryViewController *AddCategoryVC = [[AddCategoryViewController alloc] initWithNibName:nil bundle:nil];
	[self.navigationController pushViewController:AddCategoryVC animated:NO];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
	// Return the number of sections.
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
	// Return the number of rows in the section.
	return [self.categories count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListCategoriesCell" forIndexPath:indexPath];

	// Configure the cell...
	XCategory *category = [self.categories objectAtIndex:indexPath.row];
	cell.textLabel.text = category.category_name;
	return cell;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
	NSLog(@"accessory button at row %ld", (long)indexPath.row);
}

/*
   // Override to support conditional editing of the table view.
   - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
   {
    // Return NO if you do not want the specified item to be editable.
    return YES;
   }
 */

/*
   // Override to support editing the table view.
   - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
   {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
   }
 */

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
    if ([segue.identifier isEqualToString:@"ToCategoryDetailViewSegue"]){
        DetailCategoryViewController *source = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSLog(@"Selected row %ld", (long)indexPath.row);
        source.category = [self.categories objectAtIndex:indexPath.row];
    }

}

@end
