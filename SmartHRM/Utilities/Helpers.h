//
//  Helpers.h
//  SmartHRM
//
//  Created by Nabi on 6/29/11.
//  Copyright 2011 Rus Wizards LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Helpers : NSManagedObject {
    
}

+ (UIColor *) colorFrame;
+ (UIColor *) colorBlueFill;
+ (UIColor *) colorGradientTop;
+ (UIColor *) colorGradientBottom;
+ (UIColor *) colorBlueFont;

+ (void) colorBlueAllLabelsInView: (UIView *)view;

@end
