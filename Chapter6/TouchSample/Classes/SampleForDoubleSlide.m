//
//  SampleForDoubleSlide.m
//
//  Created by ToKoRo on 2009-09-06.
//

#import "SampleForDoubleSlide.h"

@implementation SampleForDoubleSlide

- (void)dealloc {
  [label_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor blackColor];
  self.view.multipleTouchEnabled = YES;

  label_ = [[UILabel alloc] init];
  label_.frame = self.view.bounds;
  label_.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  label_.textAlignment = UITextAlignmentCenter;
  label_.text = @"２本指スライドで上下に動きます";
  [self.view addSubview:label_];
}

#pragma mark ----- Responder -----

- (void)touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event {
  if ( 2 == [touches count] ) {
    // ２本指でタッチしている場合はそれぞれの縦方向の移動距離を抽出
    NSInteger distance[2];
    int i = 0;
    for ( UITouch* touch in touches ) {
      CGPoint before = [touch previousLocationInView:self.view];
      CGPoint now = [touch locationInView:self.view];
      distance[i] = now.y - before.y;
      ++i;
    }
    CGPoint newPoint = label_.center;
    if ( 0 < distance[0] && 0 < distance[1] ) {
      // 両方とも下に動いているならラベルも下に動かす
      newPoint.y += MAX( distance[0], distance[1] );
    } else if ( 0 > distance[0] && 0 > distance[1] ) {
      // 両方とも上に動いているならラベルも上に動かす
      newPoint.y += MAX( distance[0], distance[1] );
    } 
    label_.center = newPoint;
  } 
}

@end
