//
//  SampleForAlertDismiss.m
//
//  Created by ToKoRo on 2009-09-19.
//

#import "SampleForAlertDismiss.h"

#pragma mark ----- Private Methods Definition -----

@interface SampleForAlertDismiss ()
- (void)dismissAlert:(UIAlertView*)alert;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation SampleForAlertDismiss

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];

  UIAlertView* alert = [[[UIAlertView alloc] init] autorelease];
  alert.message = @"このメッセージは３秒後に消えます。";
  [alert addButtonWithTitle:@"キャンセル"];
  alert.cancelButtonIndex = 0;
  [alert show];

  [self performSelector:@selector(dismissAlert:) withObject:alert afterDelay:3.0];
}

- (void)dismissAlert:(UIAlertView*)alert {
  if ( alert.visible ) {
    [alert dismissWithClickedButtonIndex:alert.cancelButtonIndex animated:YES];
  } 
}

@end
