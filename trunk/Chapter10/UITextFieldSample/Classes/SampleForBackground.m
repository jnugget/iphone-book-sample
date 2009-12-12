//
//  SampleForBackground.m
//
//  Created by ToKoRo on 2009-09-29.
//

#import "SampleForBackground.h"

@implementation SampleForBackground

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];

  UIImage* imageWhitePaper = [UIImage imageNamed:@"paper.png"];
  UIImage* stretchableWhitePaper = [imageWhitePaper stretchableImageWithLeftCapWidth:20 topCapHeight:20];
  UIImage* imageGrayPaper = [UIImage imageNamed:@"paperGray.png"];
  UIImage* stretchableGrayPaper = [imageGrayPaper stretchableImageWithLeftCapWidth:20 topCapHeight:20];

  UITextField* textField = [[[UITextField alloc] init] autorelease];
  textField.delegate = self;
  textField.frame = CGRectMake( 20, 100, 280, 50 );
  textField.background = stretchableWhitePaper;
  textField.disabledBackground = stretchableGrayPaper;
  textField.text = @"MEMO";
  textField.textAlignment = UITextAlignmentCenter;
  textField.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
  [self.view addSubview:textField];
}

- (BOOL)textFieldShouldReturn:(UITextField*)textField {
  textField.enabled = NO;
  return YES;
}

@end
