//
//  SampleForBackground.m
//
//  Created by ToKoRo on 2009-08-07.
//

#import "SampleForBackground.h"

#pragma mark ----- Private Methods Definition -----

@interface SampleForBackground ()
- (void)redDidPush;
- (void)greenDidPush;
- (void)blueDidPush;
- (void)changeLabelColor:(CGFloat*)pColor;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation SampleForBackground

// finalize
- (void)dealloc {
  [label_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor blackColor];

  // 画面上部にラベルを追加
  label_ = [[UILabel alloc] initWithFrame:CGRectMake( 0, 0, 320, 200 )];
  label_.textAlignment = UITextAlignmentCenter;
  redColor_ = 0.0;
  greenColor_ = 0.0;
  blueColor_ = 0.0;
  label_.backgroundColor = [[[UIColor alloc] initWithRed:redColor_
                                                   green:greenColor_
                                                    blue:blueColor_
                                                   alpha:1.0] autorelease];
  label_.textColor = [UIColor whiteColor];
  label_.text = @"あなた色に染めてください・・・";

  [self.view addSubview:label_];

  // 赤ボタンを追加
  UIButton* redButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  redButton.frame = CGRectMake( 0, 0, 50, 40 );
  CGPoint newPoint = self.view.center;
  newPoint.x -= 50;
  newPoint.y = self.view.frame.size.height - 70;
  redButton.center = newPoint;
  [redButton setTitle:@"赤" forState:UIControlStateNormal];
  [redButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
  [redButton addTarget:self
                action:@selector(redDidPush)
      forControlEvents:UIControlEventTouchUpInside];

  // 緑ボタンを追加
  UIButton* greenButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  greenButton.frame = redButton.frame;
  newPoint.x += 50;
  greenButton.center = newPoint;
  [greenButton setTitle:@"緑" forState:UIControlStateNormal];
  [greenButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
  [greenButton addTarget:self
                action:@selector(greenDidPush)
      forControlEvents:UIControlEventTouchUpInside];

  // 青ボタンを追加
  UIButton* blueButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  blueButton.frame = redButton.frame;
  newPoint.x += 50;
  blueButton.center = newPoint;
  [blueButton setTitle:@"青" forState:UIControlStateNormal];
  [blueButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
  [blueButton addTarget:self
                action:@selector(blueDidPush)
      forControlEvents:UIControlEventTouchUpInside];

  [self.view addSubview:redButton];
  [self.view addSubview:greenButton];
  [self.view addSubview:blueButton];
}

#pragma mark ----- Private Methods -----

- (void)redDidPush {
  [self changeLabelColor:&redColor_];
}

- (void)greenDidPush {
  [self changeLabelColor:&greenColor_];
}

- (void)blueDidPush {
  [self changeLabelColor:&blueColor_];
}

- (void)changeLabelColor:(CGFloat*)pColor {
  if ( !pColor ) return;

  // 指定色を0.1ずつ増やす
  // すでに1.0なら0.0に戻す
  if ( *pColor > 0.99 ) {
    *pColor = 0.0;
  } else {
    *pColor += 0.1;
  }
  // ラベルの色の更新
  label_.backgroundColor = [[[UIColor alloc] initWithRed:redColor_
                                                   green:greenColor_
                                                    blue:blueColor_
                                                   alpha:1.0] autorelease];
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  [self.navigationController setNavigationBarHidden:NO animated:YES];
}

@end
