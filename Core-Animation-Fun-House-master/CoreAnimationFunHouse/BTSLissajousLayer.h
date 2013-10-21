//
//  BTSLissajousLayer.h
//  CoreAnimationFunHouse
//
//  Created by Brian Coyner on 10/28/11.
//  Copyright (c) 2011 Brian Coyner. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface BTSLissajousLayer : CALayer

@property (nonatomic, assign, readwrite) CGFloat amplitude;
@property (nonatomic, assign, readwrite) CGFloat a;
@property (nonatomic, assign, readwrite) CGFloat b;
@property (nonatomic, assign, readwrite) CGFloat delta;

@end
