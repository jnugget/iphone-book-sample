//
//  ViewController1.m
//
//  Created by ToKoRo on 2009-08-15.
//

#import "ViewController1.h"

@implementation ViewController1

- (void)viewDidLoad {
  [super viewDidLoad];

  // Hello, world! ラベルを追加
  // 背景は白、文字は黒で
  UILabel* label = [[[UILabel alloc] initWithFrame:self.view.bounds] autorelease];
  label.text = @"Hello, world!";
  label.textAlignment = UITextAlignmentCenter;
  label.backgroundColor = [UIColor whiteColor];
  label.textColor = [UIColor blackColor];
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
  // 結果として裏にあるViewController2が前面に出る
  [self.view.window sendSubviewToBack:self.view];
}

@end
