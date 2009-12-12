//
//  SampleForAnimationCurve.m
//
//  Created by ToKoRo on 2009-09-13.
//

#import "SampleForAnimationCurve.h"

@implementation SampleForAnimationCurve

- (void)dealloc {
  [star_ release];
  [label_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor blackColor];
  // UIImageViewの作成/初期化
  UIImage* image = [UIImage imageNamed:@"star.png"];
  star_ = [[UIImageView alloc] initWithImage:image];
  star_.center = CGPointMake( self.view.center.x, -100 );
  [self.view addSubview:star_];
  // ラベルの作成/初期化
  label_ = [[UILabel alloc] init];
  label_.frame = CGRectMake( 0, self.view.bounds.size.height - 20, 320, 20 );
  label_.autoresizingMask = UIViewAutoresizingFlexibleTopMargin |
                            UIViewAutoresizingFlexibleBottomMargin;
  label_.textAlignment = UITextAlignmentCenter;
  label_.text = @"UIViewAnimationCurveEaseInOut";
  [self.view addSubview:label_];
}

#pragma mark ----- Responder -----

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  static UIViewAnimationCurve animationCurve = UIViewAnimationCurveEaseInOut;

  star_.center = CGPointMake( self.view.center.x, -100 ); //< 絵がはじめにある位置
  star_.alpha = 1.0; //< スタート時のアルファ値

  [UIView beginAnimations:nil context:NULL];
  [UIView setAnimationCurve:animationCurve]; //< アニメーションカーブの設定
  [UIView setAnimationDuration:2.0]; //< １回のアニメーションを2.0秒に設定する
  star_.center = CGPointMake( self.view.center.x, 300 ); //< 絵が移動し終わる位置
  star_.alpha = 0.0; //< 終了時のアルファ値
  [UIView commitAnimations];

  // ラベルに現在のアニメーションカーブを表示
  switch ( animationCurve ) {
    case UIViewAnimationCurveEaseInOut:
      label_.text = @"UIViewAnimationCurveEaseInOut";
      break;
    case UIViewAnimationCurveEaseIn:
      label_.text = @"UIViewAnimationCurveEaseIn";
      break;
    case UIViewAnimationCurveEaseOut:
      label_.text = @"UIViewAnimationCurveEaseOut";
      break;
    case UIViewAnimationCurveLinear:
      label_.text = @"UIViewAnimationCurveLinear";
      break;
    default:
      label_.text = @"-";
      break;
  }

  // アニメーションカーブの変更
  if ( UIViewAnimationCurveLinear < ++animationCurve ) {
    animationCurve = UIViewAnimationCurveEaseInOut;
  } 
}

@end
