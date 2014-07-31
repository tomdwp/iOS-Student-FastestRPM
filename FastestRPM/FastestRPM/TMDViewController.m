//
//  TMDViewController.m
//  FastestRPM
//
//  Created by Tom Daggett on 2014-07-31.
//  Copyright (c) 2014 Tom Daggett. All rights reserved.
//

#import "TMDViewController.h"

@interface TMDViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *speedometerImageView;

@end

@implementation TMDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.speedometerImageView.image = [UIImage imageNamed:@"speedometer_without_needle.jpg"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
