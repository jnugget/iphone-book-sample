//
//  SampleForAlpha.m
//
//  Created by ToKoRo on 2009-08-08.
//

#import "SampleForAlpha.h"

@implementation SampleForAlpha

- (void)dealloc {
  [label_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  // 背景を白に
  self.view.backgroundColor = [UIColor whiteColor];

  // 画面上部にラベルを追加
  label_ = [[UILabel alloc] initWithFrame:CGRectMake( 0, 0, 320, 200 )];
  label_.textAlignment = UITextAlignmentCenter;
  label_.backgroundColor = [UIColor redColor];
  label_.textColor = [UIColor whiteColor];
  label_.adjustsFontSizeToFitWidth = YES;
  label_.text = @"赤背景に白文字";

  [self.view addSubview:label_];

  // 染めるボタンを追加
  UIButton* alphaButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  alphaButton.frame = CGRectMake( 0, 0, 100, 40 );
  CGPoint newPoint = self.view.center;
  newPoint.y = self.view.frame.size.height - 70;
  alphaButton.center = newPoint;
  [alphaButton setTitle:@"透明化" forState:UIControlStateNormal];
  [alphaButton addTarget:self
                action:@selector(alphaDidPush)
      forControlEvents:UIControlEventTouchUpInside];

  [self.view addSubview:alphaButton];
}

- (void)alphaDidPush {
  // ラベルのアルファ値を0.1ずつ減らす
  // すでに0.0なら1.0に戻す
  if ( label_.alpha < 0.09 ) {
    label_.alpha = 1.0;
  } else {
    label_.alpha -= 0.1; 
  }
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  [self.navigationController setNavigationBarHidden:NO animated:YES];
}

@end
