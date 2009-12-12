//
//  SampleForFrame.m
//
//  Created by ToKoRo on 2009-08-05.
//

#import "SampleForFrame.h"

@implementation SampleForFrame

#pragma mark ----- Override Methods -----

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor blackColor];

  UILabel* label1 = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
  label1.text = @"ほぼ右上";

  // label1のframeを任意のものに変更
  CGRect newFrame = CGRectMake( 220, 20, 100, 50 );
  label1.frame = newFrame;

  UILabel* label2 = [[[UILabel alloc] initWithFrame:[label1 frame]] autorelease];
  label2.textAlignment = UITextAlignmentCenter;
  label2.text = @"世界の中心";

  // label2のcenterをど真ん中になるよう調整
  CGPoint newPoint = self.view.center;
  // ステータスバーのぶんだけ上にずらす
  newPoint.y -= 20;
  label2.center = newPoint;

  // label1 と label2 を画面に追加する
  [self.view addSubview:label1];
  [self.view addSubview:label2];

  /* sample
  UILabel* label = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
  // frameの設定
  label.frame = CGRectMake( 0, 0, 200, 50 );
  // centerの設定
  label.center = CGPointMake( 160, 240 );
  // frameの参照
  NSLog( @"x = %f", label.frame.origin.x );
  NSLog( @"y = %f", label.frame.origin.y );
  NSLog( @"width = %f", label.frame.size.width );
  NSLog( @"height = %f", label.frame.size.height );
  // centerの参照
  NSLog( @"x = %f", label.center.x );
  NSLog( @"y = %f", label.center.y );
  */
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  [self.navigationController setNavigationBarHidden:NO animated:YES];
}

@end
