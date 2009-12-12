//
//  SampleForDrawing.m
//
//  Created by ToKoRo on 2009-10-15.
//

#import "SampleForDrawing.h"

@implementation MyView

- (void)drawRect:(CGRect)rect {

  UIImage* image = [UIImage imageNamed:@"dog.png"];
  UIColor* patternColor = [UIColor colorWithPatternImage:image];

  // 四角形を描画
  CGContextRef context = UIGraphicsGetCurrentContext();
  CGContextBeginPath( context );
  CGContextAddRect( context, rect );
  CGContextClosePath( context );
  [[UIColor grayColor] setStroke]; //< 枠線の色として灰色を設定
  [patternColor setFill]; //< 背景にパターン画像を設定
  CGContextDrawPath( context, kCGPathEOFillStroke );

  // 文字を描画
  [[UIColor blueColor] set]; //< 文字の色として青を設定
  [@"PRETTY DOGS" drawInRect:rect
                    withFont:[UIFont boldSystemFontOfSize:24]
               lineBreakMode:UILineBreakModeClip
                   alignment:UITextAlignmentCenter];
}

@end

@implementation SampleForDrawing

- (void)viewDidLoad {
  [super viewDidLoad];
  MyView* myView = [[[MyView alloc] init] autorelease];
  myView.frame = CGRectMake( 40, 40, 240, 240 );
  [self.view addSubview:myView];
}

@end
