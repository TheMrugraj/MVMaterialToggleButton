//
//  MVMaterialToggleButton.m
//  Pods
//
//  Created by pc5 on 25/11/16.
//
//

#import "MVMaterialToggleButton.h"

@implementation MVMaterialToggleButton
#pragma mark - Inits
-(instancetype)init{
    self = [super init];
    if(self){
        //Setup
        [self setupButton];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        //Setup
        [self setupButton];
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        //Setup
        [self setupButton];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame withDepth:(CGFloat)depth{
    self = [super initWithFrame:frame];
    if(self){
        //Setup
        [self setupButton];
    }
    return self;
}

-(void)sizeToFit{
    [super sizeToFit];
    [self updateRects];
    [self setNeedsDisplay];
    [self.layer setNeedsDisplay];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    if([[self.layer animationKeys] count]>0){
        
    }else{
        [self updateRects];
    }
    [self setNeedsDisplay];
    [self.layer setNeedsDisplay];
    self.layer.shadowOpacity = _shadowOpacity;
    self.layer.cornerRadius = _cornerRadius;
}
-(void)setupButton{
    self.layer.cornerRadius = _cornerRadius;
    self.layer.masksToBounds = NO;
    self.clipsToBounds = NO;
    [self.layer setNeedsDisplayOnBoundsChange:YES];
    [self setContentMode:UIViewContentModeRedraw];
    
    [self updateRects];
    
    self.layer.shadowOpacity = _shadowOpacity;
    self.layer.shadowColor = [UIColor colorWithWhite:0.0 alpha:1.0].CGColor;
    self.layer.shadowOffset = CGSizeMake(1.0, 1.5);
}

-(void)updateRects{
    
    self.raisedRect = CGRectMake(self.bounds.origin.x - 5.0,
                                 self.bounds.origin.y + 5.0,
                                 self.bounds.size.width + (2 * 5.0),
                                 self.bounds.size.height + 5.0);
    
    self.lowerRect = CGRectMake(self.bounds.origin.x - 0.1,
                                self.bounds.origin.y + 0.1,
                                self.bounds.size.width + (2 * 0.1),
                                self.bounds.size.height + 0.1);
    
    if(self.selected){
        self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.raisedRect cornerRadius:_cornerRadius].CGPath;
        self.layer.shadowRadius = _raiseFactor;
    }else{
        self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.lowerRect cornerRadius:_cornerRadius].CGPath;
        self.layer.shadowRadius = 1.0;
    }
    
}

-(void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event{
    self.selected = !self.selected;
    
    if(self.selected){
        [self raiseUp];
    }else{
        [self lowerBack];
    }
    
}

-(void)raiseUp{
    //Lift the button
    //Ripple and hold in BG
    
    
    CGFloat startRadius = 1.0;
    CGFloat startOpacity = _shadowOpacity;
    CGPathRef startPath = [UIBezierPath bezierPathWithRoundedRect:self.lowerRect cornerRadius:_cornerRadius].CGPath;
    
    // Grab the current values if we are currently animating:
    if ([[self.layer animationKeys] count] > 0) {
        startRadius = [[self.layer presentationLayer] shadowRadius];
        startOpacity = [[self.layer presentationLayer] shadowOpacity];
        startPath = [[self.layer presentationLayer] shadowPath];
    }
    
    // Increase shadow radius:
    CABasicAnimation *increaseRadius = [CABasicAnimation animationWithKeyPath:@"shadowRadius"];
    increaseRadius.fromValue = [NSNumber numberWithFloat:startRadius];
    increaseRadius.toValue = [NSNumber numberWithFloat:_raiseFactor];
    increaseRadius.duration = self.duration;
    increaseRadius.fillMode = kCAFillModeForwards;
    increaseRadius.removedOnCompletion = YES;
    self.layer.shadowRadius = _raiseFactor;
    
    // Lighten the shadow opacity:
    CABasicAnimation *shadowOpacityAnimation = [CABasicAnimation animationWithKeyPath:@"shadowOpacity"];
    shadowOpacityAnimation.duration = self.duration;
    shadowOpacityAnimation.fromValue = [NSNumber numberWithFloat:startOpacity];
    shadowOpacityAnimation.toValue = [NSNumber numberWithFloat:_shadowOpacity];
    shadowOpacityAnimation.fillMode = kCAFillModeForwards;
    shadowOpacityAnimation.removedOnCompletion = YES;
    self.layer.shadowOpacity = _shadowOpacity;
    
    // Change its frame a bit larger and shift it down a bit:
    CABasicAnimation *shadowPathAnimation = [CABasicAnimation animationWithKeyPath:@"shadowPath"];
    shadowPathAnimation.duration = self.duration;
    shadowPathAnimation.fromValue = (__bridge id)(startPath);
    shadowPathAnimation.toValue = (id)[UIBezierPath bezierPathWithRoundedRect:self.raisedRect cornerRadius:_cornerRadius].CGPath;
    shadowPathAnimation.fillMode = kCAFillModeForwards;
    shadowPathAnimation.removedOnCompletion = YES;
    self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.raisedRect cornerRadius:_cornerRadius].CGPath;
    
    // Add the animations:
    [self.layer addAnimation:increaseRadius forKey:@"shadowRadius"];
    [self.layer addAnimation:shadowOpacityAnimation forKey:@"shadowOpacity"];
    [self.layer addAnimation:shadowPathAnimation forKey:@"shadow"];
    
}

-(void)lowerBack{
    //Lower the button
    //Ripple Out BG
    
    
    CGFloat startRadius = _raiseFactor;
    CGFloat startOpacity = _shadowOpacity;
    CGPathRef startPath = [UIBezierPath bezierPathWithRoundedRect:self.raisedRect cornerRadius:_cornerRadius].CGPath;
    
    // Grab the current values if we are currently animating:
    if ([[self.layer animationKeys] count] > 0) {
        startRadius = [[self.layer presentationLayer] shadowRadius];
        startOpacity = [[self.layer presentationLayer] shadowOpacity];
        startPath = [[self.layer presentationLayer] shadowPath];
    }
    
    // Decrease shadow radius:
    CABasicAnimation *decreaseRadius = [CABasicAnimation animationWithKeyPath:@"shadowRadius"];
    decreaseRadius.fromValue = [NSNumber numberWithFloat:startRadius];
    decreaseRadius.toValue = [NSNumber numberWithFloat:1.0];
    decreaseRadius.duration = self.duration;
    decreaseRadius.fillMode = kCAFillModeForwards;
    decreaseRadius.removedOnCompletion = YES;
    self.layer.shadowRadius = 1.0;
    
    // Lighten shadow opacity:
    CABasicAnimation *shadowOpacityAnimation = [CABasicAnimation animationWithKeyPath:@"shadowOpacity"];
    shadowOpacityAnimation.duration = self.duration;
    shadowOpacityAnimation.fromValue = [NSNumber numberWithFloat:startOpacity];
    shadowOpacityAnimation.toValue = [NSNumber numberWithFloat:_shadowOpacity];
    shadowOpacityAnimation.fillMode = kCAFillModeForwards;
    shadowOpacityAnimation.removedOnCompletion = YES;
    self.layer.shadowOpacity = _shadowOpacity;
    
    // Move shadow back up a bit and shrink it a bit:
    CABasicAnimation *shadowAnimation = [CABasicAnimation animationWithKeyPath:@"shadowPath"];
    shadowAnimation.duration = self.duration;
    shadowAnimation.fromValue = (__bridge id)(startPath);
    shadowAnimation.toValue = (id)[UIBezierPath bezierPathWithRoundedRect:self.lowerRect cornerRadius:_cornerRadius].CGPath;
    shadowAnimation.fillMode = kCAFillModeForwards;
    shadowAnimation.removedOnCompletion = YES;
    self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.lowerRect cornerRadius:_cornerRadius].CGPath;
    
    // Add the animations:
    [self.layer addAnimation:shadowAnimation forKey:@"shadow"];
    [self.layer addAnimation:shadowOpacityAnimation forKey:@"shadowOpacity"];
    [self.layer addAnimation:decreaseRadius forKey:@"shadowRadius"];
    
}


@end
