//
//  TouchWrapperModelController.h
//  venmo-touch-wrapper
//
//  Created by Adam Reis on 8/5/13.
//  Copyright (c) 2013 Adam Reis. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TouchWrapperDataViewController;

@interface TouchWrapperModelController : NSObject <UIPageViewControllerDataSource>

- (TouchWrapperDataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(TouchWrapperDataViewController *)viewController;

@end
