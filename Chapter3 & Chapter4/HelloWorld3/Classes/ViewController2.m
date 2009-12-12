//
//  ViewController2.m
//
//  Created by ToKoRo on 2009-08-15.
//

#import "ViewController2.h"

@implementation ViewController2

- (void)viewDidLoad {
  [super viewDidLoad];

  // こんにちは、世界の裏側へ！ ラベルを追加
  // 背景は黒、文字は白で
  UILabel* label = [[[UILabel alloc] initWithFrame:self.view.bounds] autorelease];
  label.text = @"こんばんわ、世界！";
  label.textAlignment = UITextAlignmentCenter;
  label.backgroundColor = [UIColor blackColor];
  label.textColor = [UIColor whiteColor];
  label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  [self.view addSubview:label];

  // ボタンを追加
  // これをタップしたら画面遷移する
  UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [button setTitle:@"画面遷移" forState:UIControlStateNormal];
  [button sizeToFit];
  CGPoint newPoint = self.view.center;
  newPoint.y += 50;
  button.center = newPoint;
  button.autoresizingMask =
    UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
  [button addTarget:self
             action:@selector(buttonDidPush)
   forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:button];
}

- (void)buttonDidPush {
  // 自分自身を背面に移動
  // 結果として裏にあるViewController1が前面に出る
  [self.view.window sendSubviewToBack:self.view];
}

@end
