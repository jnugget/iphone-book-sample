//
//  SampleForAlert.m
//
//  Created by ToKoRo on 2009-09-15.
//

#import "SampleForAlert.h"

@implementation SampleForAlert

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];

  UIAlertView* alert = [[[UIAlertView alloc] init] autorelease];
  alert.title = @"残念なお知らせ";
  alert.message = @"あなたの冒険の書は消えてしまいました";
  [alert addButtonWithTitle:@"OK"];
  [alert show];

  /* initWithTitleを使ってもOK
  UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:@"残念なお知らせ"
                                                   message:@"あなたの冒険の書は消えてしまいました"
                                                  delegate:nil
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"OK", nil] autorelease];
  [alert show];
  */

}

@end
