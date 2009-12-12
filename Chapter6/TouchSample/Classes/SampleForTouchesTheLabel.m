//
//  SampleForTouchesTheLabel.m
//
//  Created by ToKoRo on 2009-08-31.
//

#import "SampleForTouchesTheLabel.h"

#pragma mark ----- TouchableLabel -----

// UILabelのサブクラスを定義
@interface TouchableLabel : UILabel
@end 

// touchesBegan:withEvent:だけ実装する
@implementation TouchableLabel

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
  UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:nil
                                                   message:@"I'm a label!"
                                                  delegate:nil
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"OK", nil] autorelease];
  [alert show];
}

@end 

#pragma mark ----- SampleForTouchesTheLabel -----

@implementation SampleForTouchesTheLabel

- (void)viewDidLoad {
  [super viewDidLoad];

  self.view.backgroundColor = [UIColor whiteColor];

  // 新しく作った新ラベルを適当な位置に貼付ける
  TouchableLabel* label = [[[TouchableLabel alloc] init] autorelease];
  label.frame = CGRectMake( 60, 100, 200, 50 );
  label.text = @"Touch me!";
  label.textAlignment = UITextAlignmentCenter;
  label.backgroundColor = [UIColor grayColor];
  // userInteractionEnabledプロパティは必ずYESにすること
  // UILabelはこれがデフォルトでNOになっている
  label.userInteractionEnabled = YES;
  [self.view addSubview:label];
}

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
  UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:nil
                                                   message:@"I'm a viewController!"
                                                  delegate:nil
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"OK", nil] autorelease];
  [alert show];
}

@end
