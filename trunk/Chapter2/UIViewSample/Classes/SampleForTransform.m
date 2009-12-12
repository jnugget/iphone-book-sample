//
//  SampleForTransform.m
//
//  Created by ToKoRo on 2009-08-09.
//

#import "SampleForTransform.h"

#pragma mark ----- Private Methods Definition -----

@interface SampleForTransform ()
- (void)rotateDidPush;
- (void)bigDidPush;
- (void)smallDidPush;
- (void)invertDidPush;
- (void)transformWithAnimation;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation SampleForTransform

// finalize
- (void)dealloc {
  [imageView_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  rotate_ = 0.0;
  scale_ = 1.0;
  needFlip_ = NO;

  // 背景を黒に
  self.view.backgroundColor = [UIColor blackColor];

  // 画像Viewを追加
  NSString* path = [NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath], @"dog.jpg"];
  UIImage* image = [[[UIImage alloc] initWithContentsOfFile:path] autorelease];

  imageView_ = [[UIImageView alloc] initWithImage:image];
  CGPoint newPoint = self.view.center;
  newPoint.y = self.view.center.y - 60;
  imageView_.center = newPoint;

  [self.view addSubview:imageView_];

  // 回転ボタンを追加
  UIButton* rotateButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  rotateButton.frame = CGRectMake( 0, 0, 50, 40 );
  newPoint = self.view.center;
  newPoint.x -= 75;
  newPoint.y = self.view.frame.size.height - 70;
  rotateButton.center = newPoint;
  [rotateButton setTitle:@"回転" forState:UIControlStateNormal];
  [rotateButton addTarget:self
                action:@selector(rotateDidPush)
      forControlEvents:UIControlEventTouchUpInside];

  // 拡大ボタンを追加
  UIButton* bigButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  bigButton.frame = rotateButton.frame;
  newPoint.x += 50;
  bigButton.center = newPoint;
  [bigButton setTitle:@"拡大" forState:UIControlStateNormal];
  [bigButton addTarget:self
                action:@selector(bigDidPush)
      forControlEvents:UIControlEventTouchUpInside];

  // 縮小ボタンを追加
  UIButton* smallButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  smallButton.frame = rotateButton.frame;
  newPoint.x += 50;
  smallButton.center = newPoint;
  [smallButton setTitle:@"縮小" forState:UIControlStateNormal];
  [smallButton addTarget:self
                action:@selector(smallDidPush)
      forControlEvents:UIControlEventTouchUpInside];

  // 反転ボタンを追加
  UIButton* invertButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  invertButton.frame = rotateButton.frame;
  newPoint.x += 50;
  invertButton.center = newPoint;
  [invertButton setTitle:@"反転" forState:UIControlStateNormal];
  [invertButton addTarget:self
                action:@selector(invertDidPush)
      forControlEvents:UIControlEventTouchUpInside];

  [self.view addSubview:rotateButton];
  [self.view addSubview:bigButton];
  [self.view addSubview:smallButton];
  [self.view addSubview:invertButton];
}

#pragma mark ----- Private Methods -----

- (void)rotateDidPush {
  // 90度ずつ回転させる
  rotate_ += 90.0;
  if ( 359.0 < rotate_ ) {
    rotate_ = 0.0;
  } 
  [self transformWithAnimation];
}

- (void)bigDidPush {
  // 0.1ずつ拡大する
  scale_ += 0.1;
  [self transformWithAnimation];
}

- (void)smallDidPush {
  // 0.1ずつ縮小する
  scale_ -= 0.1;
  [self transformWithAnimation];
}

- (void)invertDidPush {
  // 左右反転する
  needFlip_ = !needFlip_;
  [self transformWithAnimation];
}

- (void)transformWithAnimation {
  [UIView beginAnimations:nil context:NULL];

  CGAffineTransform transformRotate =
    CGAffineTransformMakeRotation( rotate_ * ( M_PI / 180.0 ) );
  CGAffineTransform transformScale =
    CGAffineTransformMakeScale( scale_, scale_ );
  CGAffineTransform transformAll =
    CGAffineTransformConcat( transformRotate, transformScale );
  if ( needFlip_ ) {
    transformAll = CGAffineTransformScale( transformAll, -1.0, 1.0 );
  } 
  imageView_.transform = transformAll;

  [UIView commitAnimations];
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  [self.navigationController setNavigationBarHidden:NO animated:YES];
}

@end
