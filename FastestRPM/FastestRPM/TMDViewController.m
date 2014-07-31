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
@property (weak, nonatomic) IBOutlet UIImageView *needleImageView;

@end

@implementation TMDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.speedometerImageView.image = [UIImage imageNamed:@"speedometer_without_needle.jpg"];
    
    self.needleImageView.image = [UIImage imageNamed:@"anotherNeedle.png"];
    
    self.needleImageView.contentMode = UIViewContentModeScaleAspectFit;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
