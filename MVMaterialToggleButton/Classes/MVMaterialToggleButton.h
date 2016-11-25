//
//  MVMaterialToggleButton.h
//  Pods
//
//  Created by pc5 on 25/11/16.
//
//

#import <UIKit/UIKit.h>

@interface MVMaterialToggleButton : UIButton
@property(nonatomic,assign) CGRect lowerRect,raisedRect;
@property(nonatomic,assign) IBInspectable CGFloat cornerRadius;
@property(nonatomic,assign) IBInspectable CGFloat shadowOpacity;
@property(nonatomic,assign) IBInspectable CGFloat duration;
@property(nonatomic,assign) IBInspectable CGFloat raiseFactor;
@property(nonatomic,assign) IBInspectable CGFloat shadowRadius;

@end
