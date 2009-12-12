//
//  SampleForSwitch.m
//
//  Created by ToKoRo on 2009-09-29.
//

#import "SampleForSwitch.h"

@implementation SampleForSwitch

- (void)dealloc {
  [switch1_ release];
  [switch2_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];

  switch1_ = [[UISwitch alloc] init];
  switch1_.center = CGPointMake( 100, 50 );
  switch1_.on = YES;
  [switch1_ addTarget:self
               action:@selector(switchDidChange)
     forControlEvents:UIControlEventValueChanged];
  [self.view addSubview:switch1_];

  switch2_ = [[UISwitch alloc] init];
  switch2_.center = CGPointMake( 100, 100 );
  switch2_.on = NO;
  [self.view addSubview:switch2_];
}

- (void)switchDidChange {
  [switch2_ setOn:!switch2_.on animated:YES];
}

@end
