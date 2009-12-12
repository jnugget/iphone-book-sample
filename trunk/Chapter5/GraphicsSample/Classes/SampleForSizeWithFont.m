//
//  SampleForSizeWithFont.m
//
//  Created by ToKoRo on 2009-09-09.
//

#import "SampleForSizeWithFont.h"

@implementation SizeWithFontTest

- (id)init {
  if ( (self = [super init]) ) {
    self.backgroundColor = [UIColor whiteColor];    
    self.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin |
                            UIViewAutoresizingFlexibleRightMargin |
                            UIViewAutoresizingFlexibleTopMargin |
                            UIViewAutoresizingFlexibleBottomMargin;
  }
  return self;
}

- (void)drawRect:(CGRect)rect {
  NSString* message =
    @"sizeWithFont:メソッドで、文字列を描画するのに必要なサイズが計算できます。";
  UIFont* systemFont = [UIFont systemFontOfSize:18];
  CGFloat actualFontSize;
  [message drawAtPoint:rect.origin
              forWidth:rect.size.width
              withFont:systemFont
           minFontSize:6
        actualFontSize:&actualFontSize
         lineBreakMode:UILineBreakModeWordWrap
    baselineAdjustment:UIBaselineAdjustmentAlignCenters];

  CGSize size;
  // ベタに書いたときに必要となる横幅を求めたい場合
  size = [message sizeWithFont:systemFont];
  NSLog( @"●sizeWithFont: の実行結果" );
  NSLog( @"size = %f, %f", size.width, size.height );
  // 横幅に制限値を設ける場合（複数行をサポートしない場合）
  size = [message sizeWithFont:systemFont
                      forWidth:rect.size.width
                 lineBreakMode:UILineBreakModeTailTruncation];
  NSLog( @"●sizeWithFont:forWidth:lineBreakMode: の実行結果" );
  NSLog( @"size = %f, %f", size.width, size.height );
  // 横幅と縦幅に制限値を設ける場合（複数行をサポート）
  size = [message sizeWithFont:systemFont constrainedToSize:rect.size];
  NSLog( @"●sizeWithFont:constrainedToSize: の実行結果" );
  NSLog( @"size = %f, %f", size.width, size.height );
  // 横幅と縦幅に制限を設け、かつ改行/トランケーションの方法も指定する場合
  size = [message sizeWithFont:systemFont
             constrainedToSize:rect.size
                 lineBreakMode:UILineBreakModeCharacterWrap];
  NSLog( @"●sizeWithFont:constrainedToSize:lineBreakMode: の実行結果" );
  NSLog( @"size = %f, %f", size.width, size.height );
  // フォントの自動縮小を使う場合
  size = [message sizeWithFont:systemFont
             minFontSize:6
          actualFontSize:&actualFontSize
                forWidth:rect.size.width
                 lineBreakMode:UILineBreakModeWordWrap];
  NSLog( @"●sizeWithFont:minFontSize:actualFontSize:forWidth:lineBreakMode: の実行結果" );
  NSLog( @"size = %f, %f", size.width, size.height );
  NSLog( @"actualFontSize = %f", actualFontSize );
}

@end

@implementation SampleForSizeWithFont

- (void)viewDidLoad {
  [super viewDidLoad];

  SizeWithFontTest* test1 =
    [[[SizeWithFontTest alloc] init] autorelease];
  test1.frame = CGRectMake( 0, 10, 320, 66 );
  [self.view addSubview:test1];

//  SizeWithFontTest* test2 =
//    [[[SizeWithFontTest alloc] init] autorelease];
//  test2.frame = CGRectMake( 0, 70, 320, 40 );
//  [self.view addSubview:test2];

//  SizeWithFontTest* test3 =
//    [[[SizeWithFontTest alloc] init] autorelease];
//  test3.frame = CGRectMake( 0, 130, 320, 40 );
//  [self.view addSubview:test3];
}

@end
