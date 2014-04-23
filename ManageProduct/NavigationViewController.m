//
//  NavigationViewController.m
//  REMenuExample
//
//  Created by Roman Efimov on 4/18/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//
//  Sample icons from http://icons8.com/download-free-icons-for-ios-tab-bar
//


#import "NavigationViewController.h"
#import "AccessKey.h"
#import "CategoryTableViewController.h"
#import "ProductTableViewController.h"
#import "ProviderTableViewController.h"

@interface NavigationViewController ()

@property (strong, readwrite, nonatomic) REMenu *menu;

@end

@implementation NavigationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (REUIKitIsFlatMode()) {
        [self.navigationBar performSelector:@selector(setBarTintColor:) withObject:[UIColor colorWithRed:0/255.0 green:213/255.0 blue:161/255.0 alpha:1]];
        self.navigationBar.tintColor = [UIColor whiteColor];
    } else {
        self.navigationBar.tintColor = [UIColor colorWithRed:0 green:179/255.0 blue:134/255.0 alpha:1];
    }
    
    __typeof (self) __weak weakSelf = self;

    REMenuItem *categoryItem = [[REMenuItem alloc] initWithTitle:@"Category"
                                                       image:[UIImage imageNamed:@"Icon_Home"]
                                            highlightedImage:nil
                                                      action:^(REMenuItem *item) {
                                                          CategoryTableViewController *controller = [[CategoryTableViewController alloc] init];                                                     [weakSelf setViewControllers:@[controller] animated:NO];
                                                      }];
    
    REMenuItem *providerItem = [[REMenuItem alloc] initWithTitle:@"Provider"
                                                          image:[UIImage imageNamed:@"Icon_Explore"]
                                               highlightedImage:nil
                                                         action:^(REMenuItem *item) {
                                                                ProviderTableViewController *controller =[[ProviderTableViewController alloc] init];
                                                             [weakSelf setViewControllers:@[controller] animated:NO];
                                                         }];
    
    REMenuItem *accessKeyItem = [[REMenuItem alloc] initWithTitle:@"Access Key"
                                                           image:[UIImage imageNamed:@"Icon_Activity"]
                                                highlightedImage:nil
                                                          action:^(REMenuItem *item) {
                                                              UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"please add an access key" message:@"include numbers and chracters" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
                                                              alert.alertViewStyle = UIAlertViewStyleSecureTextInput;
                                                              [alert show];
                                                          }];
    
    
    
    // You can also assign a custom view for any particular item
    // Uncomment the code below and add `customViewItem` to `initWithItems` array, for example:
    // self.menu = [[REMenu alloc] initWithItems:@[homeItem, exploreItem, activityItem, profileItem, customViewItem]]
    //
    /*
    UIView *customView = [[UIView alloc] init];
    customView.backgroundColor = [UIColor blueColor];
    customView.alpha = 0.4;
    REMenuItem *customViewItem = [[REMenuItem alloc] initWithCustomView:customView action:^(REMenuItem *item) {
        NSLog(@"Tap on customView");
    }];
    */
    
    categoryItem.tag = 0;
    providerItem.tag = 1;
    accessKeyItem.tag = 2;
    
    self.menu = [[REMenu alloc] initWithItems:@[categoryItem, providerItem, accessKeyItem]];
    
    // Background view
    //
    //self.menu.backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 1)];
    //self.menu.backgroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    //self.menu.backgroundView.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.600];

    //self.menu.imageAlignment = REMenuImageAlignmentRight;
    //self.menu.closeOnSelection = NO;
    //self.menu.appearsBehindNavigationBar = NO; // Affects only iOS 7
    if (!REUIKitIsFlatMode()) {
        self.menu.cornerRadius = 4;
        self.menu.shadowRadius = 4;
        self.menu.shadowColor = [UIColor blackColor];
        self.menu.shadowOffset = CGSizeMake(0, 1);
        self.menu.shadowOpacity = 1;
    }
    
    // Blurred background in iOS 7
    //
    //self.menu.liveBlur = YES;
    //self.menu.liveBlurBackgroundStyle = REMenuLiveBackgroundStyleDark;
    
    self.menu.imageOffset = CGSizeMake(5, -1);
    self.menu.waitUntilAnimationIsComplete = NO;
    self.menu.badgeLabelConfigurationBlock = ^(UILabel *badgeLabel, REMenuItem *item) {
        badgeLabel.backgroundColor = [UIColor colorWithRed:0 green:179/255.0 blue:134/255.0 alpha:1];
        badgeLabel.layer.borderColor = [UIColor colorWithRed:0.000 green:0.648 blue:0.507 alpha:1.000].CGColor;
    };
    
}

- (void)toggleMenu
{
    if (self.menu.isOpen)
        return [self.menu close];
    
    [self.menu showFromNavigationController:self];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString *result = [[alertView textFieldAtIndex:0] text];
    NSLog(@"Enter: %@", result);
    if (result.length <= 0 || buttonIndex == 0) {
        return;
    }
    
    
}

@end
