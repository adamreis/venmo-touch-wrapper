//
//  TouchWrapperViewController.m
//  venmo-touch-wrapper
//
//  Created by Adam Reis on 8/5/13.
//  Copyright (c) 2013 Adam Reis. All rights reserved.
//

#import "TouchWrapperViewController.h"

@interface TouchWrapperViewController () {
    UILabel *_textLabel;
}
@end

@implementation TouchWrapperViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)button1:(UIButton *)sender {
}
- (IBAction)button1Touch:(id)sender {
//    NSLog(@"button 1 tapped");
    _textLabel.text = @"button1";
}

- (IBAction)button2Touch:(id)sender {
    _textLabel.text = @"button2";
}

- (IBAction)button3Touch:(id)sender {
    _textLabel.text = @"button3";
}

- (IBAction)button4Touch:(id)sender {
    _textLabel.text = @"button4";
}
@end
