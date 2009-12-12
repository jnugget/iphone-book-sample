//
//  SampleForAccelerometer.m
//
//  Created by ToKoRo on 2009-09-07.
//

#import "SampleForAccelerometer.h"

#pragma mark ----- Private Methods Definition -----

@interface SampleForAccelerometer ()
- (CGFloat)lowpassFilter:(CGFloat)accel before:(CGFloat)before;
- (CGFloat)highpassFilter:(CGFloat)accel before:(CGFloat)before;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation SampleForAccelerometer

- (void)dealloc {
  [imageView_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  self.view.backgroundColor = [UIColor whiteColor];

  // UIImageViewを追加
  UIImage* image = [UIImage imageNamed:@"metal.png"];
  imageView_ = [[UIImageView alloc] initWithImage:image];
  imageView_.center = self.view.center;
  imageView_.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin |
                                UIViewAutoresizingFlexibleRightMargin |
                                UIViewAutoresizingFlexibleTopMargin |
                                UIViewAutoresizingFlexibleBottomMargin;
  [self.view addSubview:imageView_];
}

- (void)viewWillAppear:(BOOL)animated {
 [super viewWillAppear:animated];
  // 加速度センサーからの値取得開始
  UIAccelerometer* accelerometer = [UIAccelerometer sharedAccelerometer];
  accelerometer.updateInterval = 1.0 / 60.0; //< 60Hz
  accelerometer.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];
  speedX_ = speedY_ = 0.0;
  // 加速度センサーからの値取得終了
  UIAccelerometer* accelerometer = [UIAccelerometer sharedAccelerometer];
  accelerometer.delegate = nil;
}

// 加速度センサーからの通知
- (void)accelerometer:(UIAccelerometer*)accelerometer
  didAccelerate:(UIAcceleration*)acceleration
{
//  static CGFloat beforeX = 0.0;
//  static CGFloat beforeY = 0.0;
//  beforeX = [self highpassFilter:acceleration.x before:beforeX];
//  beforeY = [self highpassFilter:acceleration.y before:beforeY];
//  speedX_ += beforeX;
//  speedY_ += beforeY;

  speedX_ += acceleration.x;
  speedY_ += acceleration.y;
  CGFloat posX = imageView_.center.x + speedX_;
  CGFloat posY = imageView_.center.y - speedY_;
  // 端にあたったら跳ね返る処理
  if ( posX < 0.0 ) {
    posX = 0.0;
    speedX_ *= -0.4; //< 左の壁にあたったら0.4倍の力で跳ね返る
  } else if ( posX > self.view.bounds.size.width ) {
    posX = self.view.bounds.size.width;
    speedX_ *= -0.4; //< 右の壁にあたったら0.4倍の力で跳ね返る
  }
  if ( posY < 0.0 ) {
    posY = 0.0;
    speedY_ = 0.0; //< 上の壁にあたっても跳ね返らない
  } else if ( posY > self.view.bounds.size.height ) {
    posY = self.view.bounds.size.height;
    speedY_ *= -1.5; //< 下の壁にあたったら1.5倍の力で跳ね返る
  }
  imageView_.center = CGPointMake( posX, posY );
}

// ローパスフィルタ
- (CGFloat)lowpassFilter:(CGFloat)accel before:(CGFloat)before {
  static const CGFloat kFilteringFactor = 0.1; //< 定数
  return ( accel * kFilteringFactor ) + ( before * ( 1.0 - kFilteringFactor ) );
}

// ハイパスフィルタ
- (CGFloat)highpassFilter:(CGFloat)accel before:(CGFloat)before {
  return accel - [self lowpassFilter:accel before:before];
}

@end
