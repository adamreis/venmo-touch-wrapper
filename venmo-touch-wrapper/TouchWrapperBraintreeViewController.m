//
//  TouchWrapperBraintreeViewController.m
//  venmo-touch-wrapper
//
//  Created by Adam Reis on 8/5/13.
//  Copyright (c) 2013 Adam Reis. All rights reserved.
//

#import "TouchWrapperBraintreeViewController.h"

@interface TouchWrapperBraintreeViewController (){
    UINavigationItem *_braintreeBarTitle;
}

@end

@implementation TouchWrapperBraintreeViewController


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
//    UIImage *headerImage = [UIImage imageNamed: @"Header"];
//    [_topBar setBackgroundImage:headerImage
//                  forBarMetrics:UIBarMetricsDefault];
    
    [self performSelector:@selector(loadBraintreeView) withObject:nil afterDelay:1];
}

-(void)loadBraintreeView
{
    BTPaymentViewController *paymentViewController = [BTPaymentViewController paymentViewControllerWithVenmoTouchEnabled:YES];
    paymentViewController.delegate = self;
    
    // Add paymentViewController to a navigation controller.
    UINavigationController *paymentNavigationController =
    [[UINavigationController alloc] initWithRootViewController:paymentViewController];
    
    // Add a cancel button to the modal
    paymentViewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]
                                                              initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:paymentNavigationController
                                                              action:@selector(dismissModalViewControllerAnimated:)];
    
    // Now, display the navigation controller that contains the payment form, eg modally:
    [self presentViewController:paymentNavigationController animated:YES completion:nil];
    
}

- (void)paymentViewController:(BTPaymentViewController *)paymentViewController
        didSubmitCardWithInfo:(NSDictionary *)cardInfo
         andCardInfoEncrypted:(NSDictionary *)cardInfoEncrypted {
    NSLog(@"didSubmitCardWithInfo %@ andCardInfoEncrypted %@", cardInfo, cardInfoEncrypted);
    
    [self savePaymentInfoToServer:cardInfoEncrypted];
}

- (void) savePaymentInfoToServer:(NSDictionary *)paymentInfo {
    NSURL *url = [NSURL URLWithString: @"http://venmo-sdk-sample-one.herokuapp.com"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    
    // You need a customer id in order to save a card to the Braintree vault.
    // Here, for the sake of example, we set customer_id to device id.
    // In practice, this is probably whatever user_id your app has assigned to this user.
    NSString *customerId = [[UIDevice currentDevice] identifierForVendor].UUIDString;
    [paymentInfo setValue:customerId forKey:@"customer_id"];
    
    request.HTTPBody = [self postDataFromDictionary:paymentInfo];
    request.HTTPMethod = @"POST";
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *body, NSError *requestError)
     {
         NSError *err = nil;
         NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:body
                                                                            options:kNilOptions error:&err];
         NSLog(@"saveCardToServer: paymentInfo: %@ response: %@, error: %@",
               paymentInfo, responseDictionary, requestError);
         
         if ([[responseDictionary valueForKey:@"success"] isEqualToNumber:@1]) { // Success!
             // Don't forget to call the cleanup method,
             // `prepareForDismissal`, on your `BTPaymentViewController`
//             [BTPaymentViewController prepareForDismissal];
             
             // Now you can dismiss and tell the user everything worked.
             [self dismissViewControllerAnimated:YES completion:^(void) {
                 [[[UIAlertView alloc] initWithTitle:@"Success"
                                             message:@"Saved your card!" delegate:nil
                                   cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
             }];
             
         } else {
             // Card did not save correctly, so show server error using `showErrorWithTitle`
//             [paymentViewController
//              showErrorWithTitle:@"Error saving your card"
//              message:[self messageStringFromResponse:responseDictionary]];
         }
     }];
}
- (NSString *) messageStringFromResponse:(NSDictionary *)responseDictionary {
    return [responseDictionary valueForKey:@"message"];
}
- (NSData *)postDataFromDictionary:(NSDictionary *)params {
    NSMutableString *data = [NSMutableString string];
    
    for (NSString *key in params) {
        NSString *value = [params objectForKey:key];
        if (value == nil) {
            continue;
        }
        if ([value isKindOfClass:[NSString class]]) {
            value = [self URLEncodedStringFromString:value];
        }
        
        [data appendFormat:@"%@=%@&", [self URLEncodedStringFromString:key], value];
    }
    
    return [data dataUsingEncoding:NSUTF8StringEncoding];
}
- (NSString *) URLEncodedStringFromString: (NSString *)string {
    NSMutableString * output = [NSMutableString string];
    const unsigned char * source = (const unsigned char *)[string UTF8String];
    int sourceLen = strlen((const char *)source);
    for (int i = 0; i < sourceLen; ++i) {
        const unsigned char thisChar = source[i];
        if (thisChar == ' '){
            [output appendString:@"+"];
        } else if (thisChar == '.' || thisChar == '-' || thisChar == '_' || thisChar == '~' ||
                   (thisChar >= 'a' && thisChar <= 'z') ||
                   (thisChar >= 'A' && thisChar <= 'Z') ||
                   (thisChar >= '0' && thisChar <= '9')) {
            [output appendFormat:@"%c", thisChar];
        } else {
            [output appendFormat:@"%%%02X", thisChar];
        }
    }
    return output;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
