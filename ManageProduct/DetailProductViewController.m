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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (self.product) {
        
        [self.productNameTextField setText:[self.product valueForKey:@"product_name"]];
        [self.providerProductTextField setText:[self.product valueForKey:@"product_provider"]];
        [self.categoryProductTextField setText:[self.product valueForKey:@"product_category"]];
        self.navigationItem.title = self.productNameTextField.text;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"EditInformation"]) {
        DetailProductViewController *destViewController = segue.destinationViewController;
        //
        //destViewController.product = self.product;
    }
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
