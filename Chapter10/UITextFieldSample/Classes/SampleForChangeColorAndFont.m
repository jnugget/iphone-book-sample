//
//  SampleForChangeColorAndFont.m
//
//  Created by ToKoRo on 2009-09-29.
//

#import "SampleForChangeColorAndFont.h"

@implementation SampleForChangeColorAndFont

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];

  UITextField* textField = [[[UITextField alloc] init] autorelease];
  textField.frame = CGRectMake( 20, 100, 280, 50 );
  textField.borderStyle = UITextBorderStyleBezel;
  textField.backgroundColor = [UIColor blackColor];
  textField.textColor = [UIColor redColor];
  textField.textAlignment = UITextAlignmentCenter;
  textField.font = [UIFont systemFontOfSize:36];
  textField.text = @"UITextFields";
  [self.view addSubview:textField];
}

@end
