//
//  SampleForAnimationObserving.m
//
//  Created by ToKoRo on 2009-09-13.
//

#import "SampleForAnimationObserving.h"

#pragma mark ----- Private Methods Definition -----

@interface SampleForAnimationObserving ()
- (void)startAnimation;
- (void)animationDidStop:(NSString*)animationID finished:(NSNumber*)finished context:(void*)context;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation SampleForAnimationObserving

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

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self startAnimation]; //< 画面表示と同時にアニメーションを開始する
}

#pragma mark ----- Private Methods -----

- (void)startAnimation {

  star_.center = CGPointMake( self.view.center.x, -100 ); //< 絵がはじめにある位置
  star_.transform = CGAffineTransformIdentity; //< transformを初期化

  [UIView beginAnimations:nil context:NULL];
  [UIView setAnimationDelegate:self]; //< デリゲートを自分自身に設定
  [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
  [UIView setAnimationDuration:2.0]; //< １回のアニメーションを2.0秒に設定する
  [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
  star_.center = CGPointMake( self.view.center.x, 300 ); //< 絵が移動し終わる位置
  CGAffineTransform transformScale = CGAffineTransformScale( CGAffineTransformIdentity, 5, 5 );
  CGAffineTransform transformRotate = CGAffineTransformRotate( CGAffineTransformIdentity, M_PI );
  star_.transform = CGAffineTransformConcat( transformScale, transformRotate );
  [UIView commitAnimations];
}

- (void)animationDidStop:(NSString*)animationID finished:(NSNumber*)finished context:(void*)context {
  // アニメーションがキャンセルされずに完了したなら、もう一度アニメーションを開始する
  if ( [finished boolValue] ) {
    [self startAnimation];
  } 
}

@end
