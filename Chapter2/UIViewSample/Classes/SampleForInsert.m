//
//  SampleForInsert.m
//
//  Created by ToKoRo on 2009-08-09.
//

#import "SampleForInsert.h"

#pragma mark ----- Private Methods Definition -----

@interface SampleForInsert ()
- (void)subviewsDidPush;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation SampleForInsert

// finalize
- (void)dealloc {
  [parent_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  // 背景を黒に設定
  self.view.backgroundColor = [UIColor blackColor];

  // 親となるラベルを追加
  parent_ = [[UILabel alloc] initWithFrame:CGRectMake( 0, 0, 320, 320 )];
  parent_.textAlignment = UITextAlignmentCenter;
  parent_.text = @"PARENT";
  [self.view addSubview:parent_];

  // 子要素となるラベルをひとつ追加
  UILabel* child3 = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
  child3.text = @"CHILD 3";
  [child3 sizeToFit];
  [parent_ insertSubview:child3 atIndex:0];

  // 先ほど追加した CHILD 3 の下に CHILD 1 を挿入
  UILabel* child1 = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
  child1.text = @"CHILD 1";
  [child1 sizeToFit];
  [parent_ insertSubview:child1 belowSubview:child3];

  // 先ほど追加した CHILD 1 の上に CHILD 2 を追加
  UILabel* child2 = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
  child2.text = @"CHILD 2";
  [child2 sizeToFit];
  [parent_ insertSubview:child2 aboveSubview:child1];

  // CHILD 1 と CHILD 3 を交換
  [parent_ exchangeSubviewAtIndex:0 withSubviewAtIndex:2];

  // CHILD 3 が PARENT の子要素であれば
  if ( [child3 isDescendantOfView:parent_] ) {
    // CHILD 3 を削除
    [child3 removeFromSuperview];
  } 


  // subviews参照ボタンを追加
  UIButton* subviewsButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  subviewsButton.frame = CGRectMake( 0, 0, 150, 40 );
  CGPoint newPoint = self.view.center;
  newPoint.y = self.view.frame.size.height - 40;
  subviewsButton.center = newPoint;
  [subviewsButton setTitle:@"subviews表示" forState:UIControlStateNormal];
  [subviewsButton addTarget:self
                     action:@selector(subviewsDidPush)
           forControlEvents:UIControlEventTouchUpInside];

  [self.view addSubview:subviewsButton];
}

#pragma mark ----- Private Methods -----

- (void)subviewsDidPush {

  NSMutableString* subviews = [[[NSMutableString alloc] initWithCapacity:64] autorelease];
  [subviews setString:@""];

  // subviewsのtextを連結していく
  for ( id view in parent_.subviews ) {
    NSString* addString;
    if ( [view isKindOfClass:[UILabel class]] ) {
      addString = ((UILabel*)view).text;
    } else {
      addString = [view description];
    }
    if ( [subviews length] > 0 ) {
      [subviews appendString:@", "];
    }
    [subviews appendString:addString];
  }

  UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:@"subviews"
                                                   message:subviews
                                                  delegate:nil
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"OK", nil ] autorelease];

  [alert show];
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  [self.navigationController setNavigationBarHidden:NO animated:YES];
}

@end
