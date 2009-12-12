//
//  SampleForAddView.m
//
//  Created by ToKoRo on 2009-09-29.
//

#import "SampleForAddView.h"

@implementation SampleForAddView

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];

  UIImage* imageForLeft = [UIImage imageNamed:@"leftDog.png"];
  UIImageView* imageViewForLeft = [[[UIImageView alloc] initWithImage:imageForLeft] autorelease];
  UIImage* imageForRight = [UIImage imageNamed:@"rightDog.png"];
  UIImageView* imageViewForRight = [[[UIImageView alloc] initWithImage:imageForRight] autorelease];

  UITextField* textField1 = [[[UITextField alloc] init] autorelease];;
  textField1.borderStyle = UITextBorderStyleRoundedRect;
  textField1.frame = CGRectMake( 20, 30, 280, 50 );
  textField1.text = @"常に左右に画像表示";
  textField1.textAlignment = UITextAlignmentCenter;
  textField1.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
  textField1.leftView = imageViewForLeft;
  textField1.rightView = imageViewForRight;
  textField1.leftViewMode = UITextFieldViewModeAlways;
  textField1.rightViewMode = UITextFieldViewModeAlways;
  [self.view addSubview:textField1];

  UITextField* textField2 = [[[UITextField alloc] init] autorelease];;
  textField2.borderStyle = UITextBorderStyleRoundedRect;
  textField2.frame = CGRectMake( 20, 100, 280, 50 );
  textField2.text = @"非編集時に右に詳細ボタン表示";
  textField2.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
  UIButton* button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
  textField2.rightView = button;
  textField2.rightViewMode = UITextFieldViewModeUnlessEditing;
  [self.view addSubview:textField2];
}

@end
