//
//  SampleForChangeTextByState.m
//
//  Created by ToKoRo on 2009-09-26.
//

#import "SampleForChangeTextByState.h"

@implementation SampleForChangeTextByState

- (void)dealloc {
  [button_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  button_ = [[UIButton buttonWithType:UIButtonTypeRoundedRect] retain];
  button_.frame = CGRectMake( 0, 0, 200, 60 );
  button_.center = self.view.center;
  button_.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin |
                            UIViewAutoresizingFlexibleRightMargin |
                            UIViewAutoresizingFlexibleTopMargin |
                            UIViewAutoresizingFlexibleBottomMargin;
  [self.view addSubview:button_];

  button_.titleLabel.font = [UIFont boldSystemFontOfSize:24];
  button_.titleLabel.shadowOffset = CGSizeMake( 1.0, 1.0 );

  [button_ setTitle:@"StateNormal" forState:UIControlStateNormal];
  [button_ setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  [button_ setTitleShadowColor:[UIColor grayColor] forState:UIControlStateNormal];

  [button_ setTitle:@"StateHighlighted" forState:UIControlStateHighlighted];
  [button_ setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
  [button_ setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateHighlighted];

  [button_ setTitle:@"StateDisable" forState:UIControlStateDisabled];
  [button_ setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
  [button_ setTitleShadowColor:[UIColor blackColor] forState:UIControlStateDisabled];

  UIBarButtonItem* disableButton =
    [[[UIBarButtonItem alloc] initWithTitle:@"DISABLE"
                                      style:UIBarButtonItemStyleBordered
                                     target:self
                                     action:@selector(disableDidPush)] autorelease];
  NSArray* barButtons = [NSArray arrayWithObjects:disableButton, nil];
  [self setToolbarItems:barButtons animated:YES];
}

- (void)disableDidPush {
  button_.enabled = !button_.enabled;
}

@end
