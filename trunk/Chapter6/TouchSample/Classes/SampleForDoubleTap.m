//
//  SampleForDoubleTap.m
//
//  Created by ToKoRo on 2009-09-01.
//

#import "SampleForDoubleTap.h"

@implementation SampleForDoubleTap

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];
}

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
  // 画面がタッチされたらシングルタップフラグを解除
  singleTapReady_ = NO;
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  NSInteger tapCount = [[touches anyObject] tapCount];
  if ( 2 > tapCount ) {
    // tapCountが2より小さければシングルタップフラグをYESに
    singleTapReady_ = YES;
    // さらにsingleTap確定メソッドを0.3秒後に遅延実行
    [self performSelector:@selector(singleTap)
               withObject:nil
               afterDelay:0.3f];
  } else {
    // dabouleTap確定メソッドを実行
    [self performSelector:@selector(doubleTap)];
  }

}

- (void)singleTap {
  // これが呼ばれるまでに他のtouchesBeganが呼ばれていたらキャンセル
  if ( !singleTapReady_ ) return;

  UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:nil
                                                   message:@"Single Tap!"
                                                  delegate:nil
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"OK", nil] autorelease];
  [alert show];
}

- (void)doubleTap {
  UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:nil
                                                   message:@"Double Tap!!"
                                                  delegate:nil
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"OK", nil] autorelease];
  [alert show];
}

@end
