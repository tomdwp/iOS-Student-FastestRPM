//
//  TMDViewController.h
//  FastestRPM
//
//  Created by Tom Daggett on 2014-07-31.
//  Copyright (c) 2014 Tom Daggett. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMDViewController : UIViewController <UIGestureRecognizerDelegate>

- (IBAction)handleGesture:(UIPanGestureRecognizer *)gestureRecognizer;

@end
