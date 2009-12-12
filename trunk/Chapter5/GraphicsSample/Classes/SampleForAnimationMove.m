//
//  SampleForAnimationMove.m
//
//  Created by ToKoRo on 2009-09-13.
//

#import "SampleForAnimationMove.h"

@implementation SampleForAnimationMove

- (void)dealloc {
  [star_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor blackColor];

  UIImage* image = [UIImage imageNamed:@"star.png"];
  star_ = [[UIImageView alloc] initWithImage:image];
  star_.center = CGPointMake( -100, -100 );
  [self.view addSubview:star_];
}

#pragma mark ----- Responder -----

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  star_.center = CGPointMake( -100, -100 ); //< 絵がはじめにある位置

  [UIView beginAnimations:nil context:NULL]; //< アニメーションブロックの開始
  [UIView setAnimationDuration:1.0]; //< １回のアニメーションを1.0秒に設定する
  star_.center = CGPointMake( 420, 400 ); //< 絵が移動し終わる位置の設定
  [UIView commitAnimations]; //< アニメーションブロックの完了
}

@end
