//
//  TouchWrapperBraintreeViewController.h
//  venmo-touch-wrapper
//
//  Created by Adam Reis on 8/5/13.
//  Copyright (c) 2013 Adam Reis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BTPaymentViewController.h"


@interface TouchWrapperBraintreeViewController : UIViewController <BTPaymentViewControllerDelegate>
@property (strong, nonatomic) IBOutlet UINavigationItem *braintreeBarTitle;
@property (strong, nonatomic) IBOutlet UINavigationBar *braintreeBar;
@property (strong, nonatomic) IBOutlet UINavigationBar *topBar;

@end
