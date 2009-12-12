//
//  SampleForDrawingStringsInRect.m
//
//  Created by ToKoRo on 2009-09-09.
//

#import "SampleForDrawingStringsInRect.h"
#import "SampleForDrawingStrings.h"

@implementation DrawStringsInRect

- (void)drawRect:(CGRect)rect {
  NSString* message =
    @"UIKit用に追加されたNSStringのインスタンスメソッドを使って文字列描画してみよう。";
  UIFont* systemFont = [UIFont systemFontOfSize:[UIFont systemFontSize]];
  [message drawInRect:rect withFont:systemFont];
}

@end

@implementation SampleForDrawingStringsInRect

- (void)viewDidLoad {
  [super viewDidLoad];

  // 新しく作ったViewを画面と同じ大きさで貼り付け
  DrawStringsInRect* strings = [[[DrawStringsInRect alloc] init] autorelease];
  strings.frame = self.view.bounds;
  strings.backgroundColor = [UIColor whiteColor];
  strings.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  [self.view addSubview:strings];
}

@end
