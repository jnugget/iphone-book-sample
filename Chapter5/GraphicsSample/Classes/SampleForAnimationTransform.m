//
//  SampleForAnimationTransform.m
//
//  Created by ToKoRo on 2009-09-13.
//

#import "SampleForAnimationTransform.h"

@implementation SampleForAnimationTransform

- (void)dealloc {
  [star_ release];
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
}


#pragma mark ----- Responder -----

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  star_.center = CGPointMake( self.view.center.x, -100 ); //< 絵がはじめにある位置
  star_.alpha = 1.0; //< スタート時のアルファ値
  star_.transform = CGAffineTransformIdentity; //< transformを初期化

  [UIView beginAnimations:nil context:NULL];
  [UIView setAnimationRepeatAutoreverses:YES]; //< リバース設定
  [UIView setAnimationDuration:2.0]; //< １回のアニメーションを2.0秒に設定する
  [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
  star_.center = CGPointMake( self.view.center.x, 300 ); //< 絵が移動し終わる位置
  star_.alpha = 0.0; //< 終了時のアルファ値

  // 以下、拡大と回転の混合
  CGAffineTransform transformScale = CGAffineTransformScale( CGAffineTransformIdentity, 5, 5 );
  CGAffineTransform transformRotate = CGAffineTransformRotate( CGAffineTransformIdentity, M_PI );
  star_.transform = CGAffineTransformConcat( transformScale, transformRotate );
  [UIView commitAnimations];
}

@end
