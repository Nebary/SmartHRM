//
//  MainScreen.h
//  SmartHRM
//
//  Created by Nabi on 6/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MainScreen : UIViewController <UIScrollViewDelegate> {
    BOOL pageControlUsed;
    UITextField *textFieldComment;
}

@property (nonatomic, retain) IBOutlet UIView *viewMain;
@property (nonatomic, retain) IBOutlet UILabel *labelTime;
@property (nonatomic, retain) IBOutlet UILabel *labelDistance;
@property (nonatomic, retain) IBOutlet UIButton *buttonStart;
@property (nonatomic, retain) IBOutlet UIButton *buttonPrev;
@property (nonatomic, retain) IBOutlet UIButton *buttonNext;
@property (nonatomic, retain) IBOutlet UILabel *labelMonth;
@property (nonatomic, retain) IBOutlet UILabel *labelTimeSmall;
@property (nonatomic, retain) IBOutlet UITextField *textFieldComment;

@property (nonatomic, retain) IBOutlet UIView *viewContent;
@property (nonatomic, retain) IBOutlet UIScrollView *scrollViewContent;
@property (nonatomic, retain) IBOutlet UIPageControl *pageControlContent;

@property (nonatomic, retain) IBOutlet UIView *viewPage01;
@property (nonatomic, retain) IBOutlet UIView *viewGradient01;
@property (nonatomic, retain) IBOutlet UILabel *labelPageCaption01;
@property (nonatomic, retain) IBOutlet MKMapView *mapView;

@property (nonatomic, retain) IBOutlet UIView *viewPage02;
@property (nonatomic, retain) IBOutlet UIView *viewGradient02;
@property (nonatomic, retain) IBOutlet UILabel *labelPageCaption02;

@property (nonatomic, retain) IBOutlet UIView *viewPage03;
@property (nonatomic, retain) IBOutlet UIView *viewGradient03;
@property (nonatomic, retain) IBOutlet UILabel *labelPageCaption03;

- (IBAction)pageControlValueChanged:(id)sender;

- (void) fillFrame;
- (void) drawFrames;
- (void) drawGradient;
- (void) colorAllFonts;

- (void) placeViewsInScrollView;
- (void) showWizard;

@end
