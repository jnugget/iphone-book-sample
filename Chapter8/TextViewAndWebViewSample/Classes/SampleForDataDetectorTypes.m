//
//  SampleForDataDetectorTypes.m
//
//  Created by ToKoRo on 2009-09-20.
//

#import "SampleForDataDetectorTypes.h"

@implementation SampleForDataDetectorTypes

- (void)viewDidLoad {
  [super viewDidLoad];

  // UITextViewの貼り付け
  UITextView* textView = [[[UITextView alloc] init] autorelease];
  textView.frame = self.view.bounds;
  textView.editable = NO; //< これも必要
  textView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  textView.font = [UIFont systemFontOfSize:24];
  textView.text = @"詳細はこちらへ↓\n"
                   "http://www.apple.com/\n"
                   "連絡先: 090-0000-0000\n";
  textView.dataDetectorTypes = UIDataDetectorTypeAll;
  [self.view addSubview:textView];
}

@end
