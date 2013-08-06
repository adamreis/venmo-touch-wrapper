//
//  TouchWrapperFinalViewController.m
//  venmo-touch-wrapper
//
//  Created by Adam Reis on 8/6/13.
//  Copyright (c) 2013 Adam Reis. All rights reserved.
//

#import "TouchWrapperFinalViewController.h"

@interface TouchWrapperFinalViewController ()

@end

@implementation TouchWrapperFinalViewController

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

    UIImage *headerImage = [UIImage imageNamed: @"Header"];
    [_topBar setBackgroundImage:headerImage
                  forBarMetrics:UIBarMetricsDefault];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
