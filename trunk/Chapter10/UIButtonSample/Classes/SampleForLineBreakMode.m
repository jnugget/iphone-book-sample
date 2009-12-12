//
//  SampleForLineBreakMode.m
//
//  Created by ToKoRo on 2009-09-29.
//

#import "SampleForLineBreakMode.h"

@implementation SampleForLineBreakMode

- (void)viewDidLoad {
  [super viewDidLoad];
  
  UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  button.frame = CGRectMake( 80, 50, 160, 50 );
  [button setTitle:@"長文失礼致します。入りきらないですね。" forState:UIControlStateNormal];
  button.titleLabel.lineBreakMode = UILineBreakModeWordWrap;
  [self.view addSubview:button];
}

@end
