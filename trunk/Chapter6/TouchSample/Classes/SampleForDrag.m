//
//  SampleForDrag.m
//
//  Created by ToKoRo on 2009-09-01.
//

#import "SampleForDrag.h"

#pragma mark ----- Private Methods Definition -----

@interface SampleForDrag ()
- (void)theCharacterWillWalk;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation SampleForDrag

- (void)dealloc {
  shouldWalk_ = NO;
  [character_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];

  // アニメーションのために画像を２枚読み込む
  // imageWithFilename:は今回用のprivateメソッドだ
  UIImage* image1 = [UIImage imageNamed:@"chara1.png"];
  UIImage* image2 = [UIImage imageNamed:@"chara2.png"];
  NSArray* images = [[NSArray alloc] initWithObjects:image1, image2, nil];
  // UIImageViewを作成＆初期化
  character_ = [[UIImageView alloc] initWithImage:image1];
  // アニメーション用の画像をNSArrayで設定
  character_.animationImages = images;
  character_.animationDuration = 0.3;
  [images release];
  [self.view addSubview:character_];
}

- (void)viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];
  shouldWalk_ = NO;
}

#pragma mark ----- Responder -----

// 画面に指が触れた瞬間からアニメーションを開始し、キャラ移動用のメソッドを呼び出す
// キャラ移動用のメソッドはshouldWalk_がYESである限り呼ばれ続ける
- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
  shouldWalk_ = YES;
  [character_ startAnimating];
  targetPoint_ = [[touches anyObject] locationInView:self.view];
  [self theCharacterWillWalk];
}

// 画面をドラッグした場合、その位置を保存
- (void)touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event {
  targetPoint_ = [[touches anyObject] locationInView:self.view];
}

// 画面から指が離れたらアニメーションを停止し、shouldWalk_もNOにする
- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  shouldWalk_ = NO;
  [character_ stopAnimating];
}

// タッチ状態がキャンセルされたらアニメーションを停止し、shouldWalk_もNOにする
- (void)touchesCancelled:(NSSet*)touches withEvent:(UIEvent*)event {
  shouldWalk_ = NO;
  [character_ stopAnimating];
}

#pragma mark ----- Private Methods -----

// 指が触れている位置に、キャラクターの位置をちょっとずつ移動するメソッド
// shouldWalk_がYESなら、0.3秒のアイドルを設けて再帰的に呼び出す
- (void)theCharacterWillWalk {
  if ( !shouldWalk_ ) {
    return;
  } 

  static const NSInteger kMaximumSteps = 8;
  CGPoint newPoint = character_.center;
  if ( kMaximumSteps < abs( targetPoint_.x - newPoint.x  ) ) {
    if ( targetPoint_.x > newPoint.x ) {
      newPoint.x += kMaximumSteps;
    } else {
      newPoint.x -= kMaximumSteps;
    }
  } else {
    newPoint.x = targetPoint_.x;
  }
  if ( kMaximumSteps < abs( targetPoint_.y - newPoint.y  ) ) {
    if ( targetPoint_.y > newPoint.y ) {
      newPoint.y += kMaximumSteps;
    } else {
      newPoint.y -= kMaximumSteps;
    }
  } else {
    newPoint.y = targetPoint_.y;
  }

  character_.center = newPoint;

  [self performSelector:@selector(theCharacterWillWalk)
             withObject:nil
             afterDelay:0.3];
}

@end
