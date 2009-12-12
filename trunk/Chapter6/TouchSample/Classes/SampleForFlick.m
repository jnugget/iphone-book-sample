//
//  SampleForFlick.m
//
//  Created by ToKoRo on 2009-09-02.
//

#import "SampleForFlick.h"

@implementation SampleForFlick

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark ----- Responder -----

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
  // タッチした時間と位置を保存
  UITouch* touch = [touches anyObject];
  timestampBegan_ = event.timestamp;
  pointBegan_ = [touch locationInView:self.view];
}


- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  static const NSTimeInterval kFlickJudgeTimeInterval = 0.3;
  static const NSInteger kFlickMinimumDistance = 10;
  UITouch* touchEnded = [touches anyObject];
  CGPoint pointEnded = [touchEnded locationInView:self.view];
  NSInteger distanceHorizontal = ABS( pointEnded.x - pointBegan_.x );
  NSInteger distanceVertical = ABS( pointEnded.y - pointBegan_.y );
  if ( kFlickMinimumDistance > distanceHorizontal && kFlickMinimumDistance > distanceVertical ) {
    // 縦にも横にもあまり移動していなければreturn
    return;
  } 
  NSTimeInterval timeBeganToEnded = event.timestamp - timestampBegan_;
  if ( kFlickJudgeTimeInterval > timeBeganToEnded ) {
    // フリック扱い
    NSString* message;
    // どちらの方向にフリックしたかを判定
    if ( distanceHorizontal > distanceVertical ) {
      if ( pointEnded.x > pointBegan_.x ) {
        message = @"右フリック検知！";
      } else {
        message = @"左フリック検知！";
      }
    } else {
      if ( pointEnded.y > pointBegan_.y ) {
        message = @"下フリック検知！";
      } else {
        message = @"上フリック検知！";
      }
    }
    UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:nil
                                                     message:message
                                                    delegate:nil
                                           cancelButtonTitle:nil
                                           otherButtonTitles:@"OK", nil] autorelease];
    [alert show];
  } 
}

@end
