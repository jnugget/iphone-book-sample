//
//  SampleForDoubleTouch.m
//
//  Created by ToKoRo on 2009-09-06.
//

#import "SampleForDoubleTouch.h"

@implementation SampleForDoubleTouch

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];

  // マルチタッチを許容する場合にはこれが必須
  self.view.multipleTouchEnabled = YES;
}

#pragma mark ----- Responder -----

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
  NSString* message = [NSString stringWithFormat:@"%d本の指が同時に私に触れました", [touches count]];
  UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:nil
                                                   message:message
                                                  delegate:nil
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"OK", nil] autorelease];
  [alert show];
}

@end
