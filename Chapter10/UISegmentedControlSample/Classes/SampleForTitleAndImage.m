//
//  SampleForTitleAndImage.m
//
//  Created by ToKoRo on 2009-10-01.
//

#import "SampleForTitleAndImage.h"

@implementation SampleForTitleAndImage

- (void)dealloc {
  [titles_ release];
  [images_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];

  UIImage* image1 = [UIImage imageNamed:@"Elephant.png"];
  UIImage* image2 = [UIImage imageNamed:@"Lion.png"];
  UIImage* image3 = [UIImage imageNamed:@"Dog.png"];
  images_ = [[NSArray alloc] initWithObjects:image1, image2, image3, nil];
  titles_ = [[NSArray alloc] initWithObjects:@"Elephant", @"Lion", @"Dog", nil];
  UISegmentedControl* segment =
    [[[UISegmentedControl alloc] initWithItems:titles_] autorelease];
  segment.segmentedControlStyle = UISegmentedControlStyleBordered;
  segment.frame = CGRectMake( 10, 50, 300, 30 );
  [segment addTarget:self
              action:@selector(segmentDidChange:)
       forControlEvents:UIControlEventValueChanged];

  [self.view addSubview:segment];
}

- (void)segmentDidChange:(id)sender {
  if ( [sender isKindOfClass:[UISegmentedControl class]] ) {
    UISegmentedControl* segment = sender;
    for ( int i = 0; i < segment.numberOfSegments; ++i ){
      if ( i == segment.selectedSegmentIndex ) {
        [segment setImage:[images_ objectAtIndex:i] forSegmentAtIndex:i];
      } else {
        [segment setTitle:[titles_ objectAtIndex:i] forSegmentAtIndex:i];
      }
    }
  } 
}

@end
