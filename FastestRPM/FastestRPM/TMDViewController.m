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

@property (weak, nonatomic) IBOutlet UIPanGestureRecognizer *panGestureRecognizer;

@end

@implementation TMDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.speedometerImageView.image = [UIImage imageNamed:@"speedometer_without_needle.jpg"];
    
    self.needleImageView.image = [UIImage imageNamed:@"anotherNeedle.png"];
    
    self.speedometerImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    self.needleImageView.contentMode = UIViewContentModeCenter;
        
    self.needleImageView.transform = CGAffineTransformMakeRotation( - 0.5 * 3.14 );
    
    [self.panGestureRecognizer addObserver:self forKeyPath:@"state" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
    
    
    NSLog(@"self.needleImageView.frame {%f, %f, %f, %f}", self.needleImageView.frame.origin.x, self.needleImageView.frame.origin.y, self.needleImageView.frame.size.width, self.needleImageView.frame.size.height);
    
    float y = self.needleImageView.frame.size.height;
    NSLog(@"height of needle image: %f", y);
    
    float x = self.needleImageView.frame.size.width;
    NSLog(@"width of needle image: %f", x);
    
    //self.needleImageView.center = CGPointMake( 0, 0);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)handleGesture:(UIPanGestureRecognizer *)gestureRecognizer
{
    NSLog(@"handling PanGesture...");
    
    CGPoint velocityAsCGPoint = [gestureRecognizer velocityInView:self.view];
    
    NSLog(@"velocity as CGPoint - x: %f   y: %f", velocityAsCGPoint.x, velocityAsCGPoint.y);
    
    double velocityOfGesture = sqrt((velocityAsCGPoint.x * velocityAsCGPoint.x) + (velocityAsCGPoint.y * velocityAsCGPoint.y) );
    
    NSLog(@"velocity of gesture:  %.2f", velocityOfGesture);
    
    
    if (velocityOfGesture > 70.0) {
        
        double velocityFudgeFactor = (velocityOfGesture/1000.00) - 0.5;
        
        self.needleImageView.transform = CGAffineTransformMakeRotation( velocityFudgeFactor* 3.14 );
        
    }
}

- (void)didChangeValueForKey:(NSString *)key
{
    NSLog(@"didChangeValueForKey called for key: %@", key);
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSLog(@"observeValueForKeyPath....");
    
    if ([keyPath isEqualToString:@"state"]) {
        // do nothing for now
        NSLog(@"keyPath observed: %@", keyPath);
        
        if (self.panGestureRecognizer.state == UIGestureRecognizerStateEnded || self.panGestureRecognizer.state == UIGestureRecognizerStateCancelled) {
            
            NSLog(@"panGestureRecognizer state changed to ended???");
            self.needleImageView.transform = CGAffineTransformMakeRotation( - 0.5 * 3.14 );
        }
        
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}


- (void)dealloc
{
    [self.panGestureRecognizer removeObserver:self forKeyPath:@"state"];
    
}

@end
