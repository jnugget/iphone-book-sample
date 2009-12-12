//
//  SampleForSegmentedControl.m
//
//  Created by ToKoRo on 2009-10-01.
//

#import "SampleForSegmentedControl.h"

@implementation SampleForSegmentedControl

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor blackColor];

  NSArray* items = [NSArray arrayWithObjects:@"Black", @"White", nil];
  UISegmentedControl* segment =
    [[[UISegmentedControl alloc] initWithItems:items] autorelease];
  segment.selectedSegmentIndex = 0;
  segment.frame = CGRectMake( 0, 0, 130, 30 );
  [segment addTarget:self
              action:@selector(segmentDidChange:)
       forControlEvents:UIControlEventValueChanged];
  UIBarButtonItem* barButton =
    [[[UIBarButtonItem alloc] initWithCustomView:segment] autorelease];
  self.navigationItem.rightBarButtonItem = barButton;
}

- (void)segmentDidChange:(id)sender {
  if ( [sender isKindOfClass:[UISegmentedControl class]] ) {
    UISegmentedControl* segment = sender;
    if ( 0 == segment.selectedSegmentIndex ) {
      self.view.backgroundColor = [UIColor blackColor];
    } else {
      self.view.backgroundColor = [UIColor whiteColor];
    }
  } 
}

@end
