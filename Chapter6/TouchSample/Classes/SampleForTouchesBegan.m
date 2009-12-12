//
//  SampleForTouchesBegan.m
//
//  Created by ToKoRo on 2009-08-31.
//

#import "SampleForTouchesBegan.h"

@implementation SampleForTouchesBegan

- (void)viewDidLoad {
  [super viewDidLoad];

  // 背景色に色を付けるのが必須！
  // デフォルトだと、じつは透明なのでタップできない
  self.view.backgroundColor = [UIColor whiteColor];
}

// これがタッチイベントを受け取るためのメソッド
- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
  UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:nil
                                                   message:@"I'm a viewController!"
                                                  delegate:nil
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"OK", nil] autorelease];
  [alert show];
}

@end
