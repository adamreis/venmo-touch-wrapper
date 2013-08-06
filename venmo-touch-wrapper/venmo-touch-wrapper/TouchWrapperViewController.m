//
//  TouchWrapperViewController.m
//  venmo-touch-wrapper
//
//  Created by Adam Reis on 8/5/13.
//  Copyright (c) 2013 Adam Reis. All rights reserved.
//

#import "TouchWrapperViewController.h"
#import "TouchWrapperBraintreeViewController.h"

@interface TouchWrapperViewController () 
@end

@implementation TouchWrapperViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Customize the title text for *all* UINavigationBars
    [[UINavigationBar appearance] setTitleTextAttributes:
        [NSDictionary dictionaryWithObjectsAndKeys:
            
            [UIFont fontWithName:@"Hiragino Kaku Gothic ProN W6 13.0" size:115],
            UITextAttributeFont,
            nil]];
    
    
    
    UIImage *headerImage = [UIImage imageNamed: @"Header"];
    [_topBar setBackgroundImage:headerImage
                             forBarMetrics:UIBarMetricsDefault];
    
//    _topBar.titleTextAttributes
    
    _textLabel.font = [UIFont fontWithName:@"Proxima Nova" size:15];
    _textLabel.font =  [UIFont boldSystemFontOfSize:_textLabel.font.pointSize-3];
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)performSegue:(id)sender {
    [self performSegueWithIdentifier:@"page1Page2" sender:sender];
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    TouchWrapperBraintreeViewController *targetVC = (TouchWrapperBraintreeViewController *)segue.destinationViewController;
////    UIButton *senderButton = [[UIButton alloc] init];
////    senderButton =(UIButton *)sender;
//    
////    targetVC.braintreeBarTitle.title = @"test";
//    [targetVC testest];
//    
//    
//    [super prepareForSegue:segue sender:sender];
//
//}

- (void)viewDidUnload
{
    [super viewDidUnload];
}
@end