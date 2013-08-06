//
//  TouchWrapperViewController.h
//  venmo-touch-wrapper
//
//  Created by Adam Reis on 8/5/13.
//  Copyright (c) 2013 Adam Reis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BTPaymentViewController.h"

@interface TouchWrapperViewController : UIViewController <BTPaymentViewControllerDelegate>
@property (strong, nonatomic) IBOutlet UIButton *button1;
@property (strong, nonatomic) IBOutlet UIButton *button2;
@property (strong, nonatomic) IBOutlet UIButton *button3;
@property (strong, nonatomic) IBOutlet UIButton *button4;
@property (strong, nonatomic) IBOutlet UILabel *textLabel;

@property (strong, nonatomic) IBOutlet UINavigationBar *topBar;



- (IBAction)restartSession:(id)sender;
- (IBAction)performSegue:(id)sender;


@end
