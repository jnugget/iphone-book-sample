//
//  SampleForDrawingStrings.m
//
//  Created by ToKoRo on 2009-09-08.
//

#import "SampleForDrawingStrings.h"

@implementation DrawStrings

- (void)drawRect:(CGRect)rect {
  NSString* message =
    @"UIKit用に追加されたNSStringのインスタンスメソッドを使って文字列描画してみよう。";
  UIFont* systemFont = [UIFont systemFontOfSize:[UIFont systemFontSize]];
  [message drawAtPoint:CGPointMake( 0, 0 ) withFont:systemFont];
}

@end

@implementation SampleForDrawingStrings

- (void)viewDidLoad {
  [super viewDidLoad];

  // 新しく作ったViewを画面と同じ大きさで貼り付け
  DrawStrings* strings = [[[DrawStrings alloc] init] autorelease];
  strings.frame = self.view.bounds;
  strings.backgroundColor = [UIColor whiteColor];
  strings.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  [self.view addSubview:strings];
}

@end
