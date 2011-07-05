//
//  Helpers.m
//  SmartHRM
//
//  Created by Nabi on 6/29/11.
//  Copyright 2011 Rus Wizards LLC. All rights reserved.
//

#import "Helpers.h"


@implementation Helpers

#pragma mark - Colors

+ (UIColor *) colorFrame {
    return [UIColor colorWithRed:24.0/255 green:(float)101.0/255 blue:165.0/255 alpha:1.0];
}

+ (UIColor *) colorBlueFill {
    return [UIColor colorWithRed:222.0/255 green:(float)239.0/255 blue:255.0/255 alpha:1.0];
}

+ (UIColor *) colorGradientTop {
    return [UIColor colorWithRed:66.0/255 green:(float)158.0/255 blue:231.0/255 alpha:1.0];
}

+ (UIColor *) colorGradientBottom {
    return [UIColor colorWithRed:24.0/255 green:(float)125.0/255 blue:165.0/206 alpha:1.0];
}

+ (UIColor *) colorBlueFont {
    return [UIColor colorWithRed:24.0/255 green:(float)101.0/255 blue:165.0/255 alpha:1.0];
}

+ (void) colorBlueAllLabelsInView: (UIView *)view {
    for (UIView *v in view.subviews) {
        if ([v isKindOfClass:[UILabel class]]) {
            ((UILabel *)v).textColor = [Helpers colorBlueFont];
        }
    }
}

@end
