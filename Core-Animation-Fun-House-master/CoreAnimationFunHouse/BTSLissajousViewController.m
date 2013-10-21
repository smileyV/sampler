//
//  BTSLissajousViewController.m
//  CoreAnimationFunHouse
//
//  Created by Brian Coyner on 10/28/11.
//  Copyright (c) 2011 Brian Coyner. All rights reserved.
//

#import "BTSLissajousViewController.h"

#import "BTSLissajousLayer.h"

@interface BTSLissajousViewController() 

@property (nonatomic, weak, readwrite) IBOutlet UISlider *amplitudeSlider;
@property (nonatomic, weak, readwrite) IBOutlet UIStepper *aStepper;
@property (nonatomic, weak, readwrite) IBOutlet UIStepper *bStepper;
@property (nonatomic, weak, readwrite) IBOutlet UISlider *deltaSlider;
@property (nonatomic, weak, readwrite) IBOutlet UILabel *deltaLabel;
@property (nonatomic, weak, readwrite) IBOutlet UILabel *aValueLabel;
@property (nonatomic, weak, readwrite) IBOutlet UILabel *bValueLabel;

@end

@implementation BTSLissajousViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    BTSLissajousLayer *layer = (BTSLissajousLayer *)[[[self view] viewWithTag:100] layer];
    
    [_amplitudeSlider setMinimumValue:1.0];
    [_amplitudeSlider setMaximumValue:[layer bounds].size.height / 2.0];
    [_amplitudeSlider setValue:[_amplitudeSlider maximumValue] / 2.0];
    
    [_aStepper setMinimumValue:1.0];
    [_aStepper setMaximumValue:10.0];
    [_aStepper setValue:1.0];
    
    [_bStepper setMinimumValue:0.0];
    [_bStepper setMaximumValue:10.0];
    [_bStepper setValue:2.0];
    
    [_deltaSlider setMinimumValue:0.0];
    [_deltaSlider setMaximumValue:(float) (2.0 * M_PI)];
    [_deltaSlider setValue:(float) M_PI];
    
    
    [self updateAmplitude:_amplitudeSlider];
    [self updateA:_aStepper];
    [self updateB:_bStepper];
    [self updateDelta:_deltaSlider];
    
    [layer setNeedsDisplay];
}

- (IBAction)updateAmplitude:(id)sender {
    BTSLissajousLayer *layer = (BTSLissajousLayer *)[[[self view] viewWithTag:100] layer]; 
    float value = [(UISlider *)sender value];
    [layer setAmplitude:(CGFloat)value];
}

- (IBAction)updateA:(id)sender {
    BTSLissajousLayer *layer = (BTSLissajousLayer *)[[[self view] viewWithTag:100] layer]; 
    float value = (float) [(UIStepper *)sender value];
    [_aValueLabel setText:[NSString stringWithFormat:@"%0.0f", [_aStepper value]]];
    
    [layer setA:(CGFloat)value];
}

- (IBAction)updateB:(id)sender {
    BTSLissajousLayer *layer = (BTSLissajousLayer *)[[[self view] viewWithTag:100] layer]; 
    float value = (float) [(UIStepper *)sender value];
    [_bValueLabel setText:[NSString stringWithFormat:@"%0.0f", [_bStepper value]]];    
    [layer setB:(CGFloat)value];
}

- (IBAction)updateDelta:(id)sender {
    BTSLissajousLayer *layer = (BTSLissajousLayer *)[[[self view] viewWithTag:100] layer]; 
    float value = [(UISlider *)sender value];
    [_deltaLabel setText:[NSString stringWithFormat:@"%1.3f (%1.1F°)", value, value * (180.0/ M_PI)]];
    [layer setDelta:(CGFloat)value];
}

@end

