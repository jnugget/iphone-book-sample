//
//  SampleForImageWithCap.m
//
//  Created by ToKoRo on 2009-09-13.
//

#import "SampleForImageWithCap.h"

@implementation SampleForImageWithCap

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];

  // 赤い円形の画像を読み込み
  UIImage* image = [UIImage imageNamed:@"circle.png"];
  // キャップ画像の作成
  UIImage* imageWithCap = [image stretchableImageWithLeftCapWidth:30 topCapHeight:30];
  
  // キャップしていない画像を背景にしたボタンを画面に貼り付ける
  UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
  [button setBackgroundImage:image forState:UIControlStateNormal];
  [button setTitle:@"横長のUIButton キャップ【なし】版" forState:UIControlStateNormal];
  [button sizeToFit];
  button.center = CGPointMake( 160, 50 );
  [self.view addSubview:button];

  // キャップ画像を背景にしたボタンを画面に貼り付ける
  UIButton* buttonWithCap = [UIButton buttonWithType:UIButtonTypeCustom];
  [buttonWithCap setBackgroundImage:imageWithCap forState:UIControlStateNormal];
  [buttonWithCap setTitle:@"横長のUIButton キャップ【あり】版" forState:UIControlStateNormal];
  [buttonWithCap sizeToFit];
  buttonWithCap.center = CGPointMake( 160, 150 );
  [self.view addSubview:buttonWithCap];
}

@end
