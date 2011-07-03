//
//  MainScreen.m
//  SmartHRM
//
//  Created by Nabi on 6/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MainScreen.h"
#import <QuartzCore/CAGradientLayer.h>
#import "Helpers.h"
#import "WizardScreenWelcome.h"
#import "Constants.h"

@implementation MainScreen

#pragma mark - Propeties

@synthesize viewMain;
@synthesize labelTime;
@synthesize labelDistance;
@synthesize buttonStart;
@synthesize buttonPrev;
@synthesize buttonNext;
@synthesize labelMonth;
@synthesize labelTimeSmall;
@synthesize textFieldComment;
@synthesize viewContent;
@synthesize scrollViewContent;
@synthesize pageControlContent;
@synthesize viewPage01;
@synthesize viewGradient01;
@synthesize labelPageCaption01;
@synthesize mapView;
@synthesize viewPage02;
@synthesize viewGradient02;
@synthesize labelPageCaption02;
@synthesize viewPage03;
@synthesize viewGradient03;
@synthesize labelPageCaption03;

#pragma mark - Management

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [scrollViewContent release];
    [pageControlContent release];
    [viewContent release];
    [viewMain release];
    [labelTime release];
    [labelDistance release];
    [buttonStart release];
    [buttonPrev release];
    [buttonNext release];
    [labelMonth release];
    [labelTimeSmall release];
    [viewPage01 release];
    [viewGradient01 release];
    [labelPageCaption01 release];
    [mapView release];
    [viewPage02 release];
    [viewGradient02 release];
    [labelPageCaption02 release];
    [viewPage03 release];
    [viewGradient03 release];
    [labelPageCaption03 release];
    [textFieldComment release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self fillFrame];
    [self colorAllFonts];
    [self drawFrames];
    [self drawGradient];
    [self placeViewsInScrollView];
}

- (void)viewDidUnload
{
    [self setScrollViewContent:nil];
    [self setPageControlContent:nil];
    [self setViewContent:nil];
    [self setViewMain:nil];
    [self setLabelTime:nil];
    [self setLabelDistance:nil];
    [self setButtonStart:nil];
    [self setButtonPrev:nil];
    [self setButtonNext:nil];
    [self setLabelMonth:nil];
    [self setLabelTimeSmall:nil];
    [self setViewPage01:nil];
    [self setViewGradient01:nil];
    [self setLabelPageCaption01:nil];
    [self setMapView:nil];
    [self setViewPage02:nil];
    [self setViewGradient02:nil];
    [self setLabelPageCaption02:nil];
    [self setViewPage03:nil];
    [self setViewGradient03:nil];
    [self setLabelPageCaption03:nil];
    [self setTextFieldComment:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - UI Improvements

-(void) fillFrame {
    self.viewMain.backgroundColor = [Helpers colorBlueFill];
}

-(void) colorAllFonts {
    self.labelTime.textColor = [Helpers colorBlueFont];
    self.labelDistance.textColor = [Helpers colorBlueFont];
    self.labelMonth.textColor = [Helpers colorBlueFont];
    self.labelTimeSmall.textColor = [Helpers colorBlueFont];
    [Helpers colorBlueAllLabelsInView:self.viewPage02];
    [Helpers colorBlueAllLabelsInView:self.viewPage03];
}

-(void) drawFrames {
    self.viewMain.layer.borderColor = [[Helpers colorFrame] CGColor];
    self.viewMain.layer.borderWidth = 1.0;
    self.viewContent.layer.borderColor = [[Helpers colorFrame] CGColor];
    self.viewContent.layer.borderWidth = 1.0;
}

-(void) drawGradient {
    CAGradientLayer *gradient;
    
    gradient = [CAGradientLayer layer];
    gradient.frame = self.viewGradient01.bounds;
    gradient.colors = [NSArray arrayWithObjects:(id)[[Helpers colorGradientTop] CGColor], (id)[[Helpers colorGradientBottom] CGColor], nil];
    [self.viewGradient01.layer insertSublayer:gradient atIndex:0];

    gradient = [CAGradientLayer layer];
    gradient.frame = self.viewGradient02.bounds;
    gradient.colors = [NSArray arrayWithObjects:(id)[[Helpers colorGradientTop] CGColor], (id)[[Helpers colorGradientBottom] CGColor], nil];
    [self.viewGradient02.layer insertSublayer:gradient atIndex:0];

    gradient = [CAGradientLayer layer];
    gradient.frame = self.viewGradient03.bounds;
    gradient.colors = [NSArray arrayWithObjects:(id)[[Helpers colorGradientTop] CGColor], (id)[[Helpers colorGradientBottom] CGColor], nil];
    [self.viewGradient03.layer insertSublayer:gradient atIndex:0];
}

-(void) placeViewsInScrollView {
    scrollViewContent.pagingEnabled = YES;
    scrollViewContent.contentSize = CGSizeMake(scrollViewContent.frame.size.width * 3, scrollViewContent.frame.size.height);
    scrollViewContent.showsHorizontalScrollIndicator = NO;
    scrollViewContent.showsVerticalScrollIndicator = NO;
    scrollViewContent.scrollsToTop = NO;
    scrollViewContent.delegate = self;
    
    CGRect frame;
    
    frame = scrollViewContent.frame;
    frame.origin.x = frame.size.width * 0;
    frame.origin.y = 0;
    self.viewPage01.frame = frame;
    [scrollViewContent addSubview:viewPage01];
    
    frame = scrollViewContent.frame;
    frame.origin.x = frame.size.width * 1;
    frame.origin.y = 0;
    self.viewPage02.frame = frame;
    [scrollViewContent addSubview:viewPage02];
    
    frame = scrollViewContent.frame;
    frame.origin.x = frame.size.width * 2;
    frame.origin.y = 0;
    self.viewPage03.frame = frame;
    [scrollViewContent addSubview:viewPage03];
    
    frame = scrollViewContent.frame;
    frame.size.width = frame.size.width * 3;
    frame.size.height = frame.size.height-49;
    [scrollViewContent setContentSize:frame.size];
}

#pragma mark - Scrollview methods

- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    if (!pageControlUsed)
    {
        // Switch the indicator when more than 50% of the previous/next page is visible
        CGFloat pageWidth = scrollViewContent.frame.size.width;
        int page = floor((scrollViewContent.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
        pageControlContent.currentPage = page;
    }
}

// At the begin of scroll dragging, reset the boolean used when scrolls originate from the UIPageControl
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    pageControlUsed = NO;
}

// At the end of scroll animation, reset the boolean used when scrolls originate from the UIPageControl
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    pageControlUsed = NO;
}

- (IBAction)pageControlValueChanged:(id)sender {
    int page = pageControlContent.currentPage;
    
	// update the scroll view to the appropriate page
    CGRect frame = scrollViewContent.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [scrollViewContent scrollRectToVisible:frame animated:YES];
    
	// Set the boolean used when scrolls originate from the UIPageControl. See scrollViewDidScroll: above.
    pageControlUsed = YES;
}

#pragma mark - Main methods

- (void) showWizard {
    BOOL show;
    if ([[NSUserDefaults standardUserDefaults] valueForKey:SETTINGS_SHOW_WIZARD]) {
        show = [[NSUserDefaults standardUserDefaults] boolForKey:SETTINGS_SHOW_WIZARD];
    }
    else {
        show = YES;
    }

    if (show) {
        UINavigationController *nav = [[UINavigationController alloc] init];
        WizardScreenWelcome *wizardWelcome = [[WizardScreenWelcome alloc] init];
        nav.viewControllers = [NSArray arrayWithObjects:wizardWelcome, nil];
        [self presentModalViewController:nav animated:YES];
    }
}

@end
