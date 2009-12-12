//
//  SampleForTextView.m
//
//  Created by ToKoRo on 2009-09-19.
//

#import "SampleForTextView.h"

@implementation SampleForTextView

- (void)viewDidLoad {
  [super viewDidLoad];

  UITextView* textView = [[[UITextView alloc] init] autorelease];
  textView.frame = self.view.bounds;
  textView.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  textView.editable = NO; //< 編集不可にする

  textView.backgroundColor = [UIColor blackColor]; //< 背景を黒に
  textView.textColor = [UIColor whiteColor]; //< 文字の色を白に
  textView.font = [UIFont systemFontOfSize:32]; //< フォントの設定
  textView.text = @"Hello, UITextView!\n"
                   "2行目\n"
                   "3行目\n"
                   "4行目\n"
                   "5行目\n"
                   "6行目\n"
                   "7行目\n"
                   "8行目\n"
                   "9行目\n"
                   "10行目\n"
                   "11行目\n"
                   "12行目\n";

  [self.view addSubview:textView];
}

@end
