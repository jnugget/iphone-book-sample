//
//  SampleForSlide.m
//
//  Created by ToKoRo on 2009-09-02.
//

#import "SampleForSlide.h"

@implementation SampleForSlide

- (void)dealloc {
  [label_ release];  
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  self.view.backgroundColor = [UIColor blackColor];

  label_ = [[UILabel alloc] init];
  label_.frame = self.view.bounds;
  label_.backgroundColor = [UIColor whiteColor];
  label_.textAlignment = UITextAlignmentCenter;
  label_.text = @"上下左右にスライドできます";
  label_.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  [self.view addSubview:label_];

  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(suspend)
                                               name:UIApplicationWillResignActiveNotification
                                             object:nil];
}

#pragma mark ----- Responder -----

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
  // タッチした位置を保存
  touchBegan_ = [[touches anyObject] locationInView:self.view];
  // ラベルの元の位置を保存
  labelOrigin_ = label_.center;
  // 動く方向を初期化
  direction_ = kSlideNone;
}

- (void)touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event {
  static const NSInteger kNeedMove = 10;
  CGPoint point = [[touches anyObject] locationInView:self.view];
  // はじめにタッチした位置と、現在の位置の差を取得
  NSInteger distanceHorizontal = point.x - touchBegan_.x;
  NSInteger distanceVertical = point.y - touchBegan_.y;

  if ( kSlideNone == direction_ ) {
    // 動く方向の決定
    if ( ABS( distanceHorizontal ) > ABS( distanceVertical )  ) {
      // 横方向に動く
      if ( kNeedMove <= ABS( distanceHorizontal ) ) {
        direction_ = kSlideHorizontal;
      } 
    } else {
      // 縦方向に動く
      if ( kNeedMove <= ABS( distanceVertical ) ) {
        direction_ = kSlideVertical;
      } 
    }
  }
  if ( kSlideNone != direction_ ) {
    // 動く距離の決定
    CGPoint newPoint = labelOrigin_;
    if ( kSlideHorizontal == direction_ ) {
      newPoint.x += distanceHorizontal;
    } else {
      newPoint.y += distanceVertical;
    }
    // 移動の適用
    label_.center = newPoint;
  }
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  // 指を話したらラベルが元の位置に戻る
  [UIView beginAnimations:nil context:nil];
  label_.center = self.view.center;
  [UIView commitAnimations];
}

- (void)touchesCancelled:(NSSet*)touches withEvent:(UIEvent*)event {
  [self touchesEnded:touches withEvent:event];
}

- (void)suspend {
  [self touchesCancelled:nil withEvent:nil];
}

@end
