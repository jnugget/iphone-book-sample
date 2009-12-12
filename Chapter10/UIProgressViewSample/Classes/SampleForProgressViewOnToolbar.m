//
//  SampleForProgressViewOnToolbar.m
//
//  Created by ToKoRo on 2009-10-04.
//

#import "SampleForProgressViewOnToolbar.h"

#pragma mark ----- ProgressViewWithLabel -----

@implementation ProgressViewWithLabel

@synthesize progressView = progressView_;
@synthesize textLabel = textLabel_;

- (void)dealloc {
  [progressView_ release];
  [textLabel_ release];
  [super dealloc];
}

- (id)init {
  if ( (self = [super init]) ) {
    self.opaque = NO;
    progressView_ =
      [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleBar];
    textLabel_ = [[UILabel alloc] init];
    textLabel_.textAlignment = UITextAlignmentCenter;
    textLabel_.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
    textLabel_.textColor = [UIColor whiteColor];
    textLabel_.font = [UIFont boldSystemFontOfSize:14];
    textLabel_.shadowColor = [UIColor blackColor];
    [self addSubview:progressView_];
    [self addSubview:textLabel_];
    self.frame = CGRectMake( 0, 0, progressView_.bounds.size.width, progressView_.bounds.size.height * 3 );
  }
  return self;
}

- (void)layoutSubviews {
  CGRect newFrame = self.bounds;
  newFrame.size.height -= progressView_.frame.size.height;
  textLabel_.frame = newFrame;
  newFrame = progressView_.frame;
  newFrame.origin.y = self.bounds.size.height - newFrame.size.height;
  progressView_.frame = newFrame;
}

@end 

#pragma mark ----- Private Methods Definition -----

@interface SampleForProgressViewOnToolbar ()
- (void)updateProgress:(ProgressViewWithLabel*)component;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation SampleForProgressViewOnToolbar

- (void)dealloc {
  [component_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];

  component_ = [[ProgressViewWithLabel alloc] init];

  UIBarButtonItem* barButton =
    [[[UIBarButtonItem alloc] initWithCustomView:component_] autorelease];;
  UIBarButtonItem* flexibleSpace =
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                   target:nil
                                                   action:nil] autorelease];
  NSArray* items = [NSArray arrayWithObjects:flexibleSpace, barButton, flexibleSpace, nil];
  [self setToolbarItems:items animated:NO];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [self updateProgress:component_];
}

- (void)viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];
  component_.hidden = YES;
}

- (void)updateProgress:(ProgressViewWithLabel*)component {
  if ( [component isHidden] || 1.0 <= component.progressView.progress ) {
    return;
  } 
  component.progressView.progress += 0.1;
  component.textLabel.text =
    [NSString stringWithFormat:@"Downloading %.0f of 10", component.progressView.progress * 10];
  [self performSelector:@selector(updateProgress:)
             withObject:component
             afterDelay:1.0];
}

@end
