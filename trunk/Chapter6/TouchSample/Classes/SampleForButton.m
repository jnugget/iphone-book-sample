//
//  SampleForButton.m
//
//  Created by ToKoRo on 2009-08-30.
//

#import "SampleForButton.h"

@implementation SampleForButton

- (void)viewDidLoad {
  [super viewDidLoad];

  self.title = @"UIButton";
  self.view.backgroundColor = [UIColor whiteColor];

  // ボタンを作成
  UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  // ボタンのキャプションを設定
  [button setTitle:@"Touch me!" forState:UIControlStateNormal];
  // キャプションに合わせてサイズを自動決定
  [button sizeToFit];
  // 画面のど真ん中に移動
  button.center = self.view.center;
  // 画面が変わってもボタンの位置を自動調整
  button.autoresizingMask = UIViewAutoresizingFlexibleWidth |
                            UIViewAutoresizingFlexibleHeight |
                            UIViewAutoresizingFlexibleLeftMargin |
                            UIViewAutoresizingFlexibleRightMargin |
                            UIViewAutoresizingFlexibleTopMargin |
                            UIViewAutoresizingFlexibleBottomMargin;

  // ボタンをタップしたときに指定のメソッドを呼ばせる
  [button addTarget:self
             action:@selector(buttonDidPush:)
   forControlEvents:UIControlEventTouchUpInside];

  // ボタンを画面に追加
  [self.view addSubview:button];
}

// ボタンタップ時にこれが呼ばれる
- (void)buttonDidPush:(id)sender {
  if ( [sender isKindOfClass:[UIButton class]] ) {
    UIButton* button = sender;
    UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:nil
                                                     message:button.currentTitle
                                                    delegate:nil
                                           cancelButtonTitle:nil
                                           otherButtonTitles:@"OK", nil] autorelease];
    [alert show];
  } 
}

@end
