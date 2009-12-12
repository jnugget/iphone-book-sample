//
//  SampleForAlertWithMultiButtons.m
//
//  Created by ToKoRo on 2009-09-15.
//

#import "SampleForAlertWithMultiButtons.h"

@implementation SampleForAlertWithMultiButtons

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];

  UIAlertView* alert = [[[UIAlertView alloc] init] autorelease];
  alert.delegate = self;
  alert.title = @"冒険の書のリカバリ";
  alert.message = @"あなたの冒険の書は消えてしまいました。直前の冒険の書に戻しますか?";
  [alert addButtonWithTitle:@"いいえ"];
  [alert addButtonWithTitle:@"はい"];
  alert.cancelButtonIndex = 0;
  [alert show];
}

- (void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
  // 押されたボタンがキャンセルボタンかどうかを判定する
  if ( buttonIndex != alertView.cancelButtonIndex ) {
    UIAlertView* alert = [[[UIAlertView alloc] init] autorelease];
    alert.title = @"リカバリの失敗";
    alert.message = @"残念ながらリカバリに失敗しました";
    [alert addButtonWithTitle:@"OK"];
    [alert show];
  } 
}

@end
