//
//  SampleForBaselineAdjustment.m
//
//  Created by ToKoRo on 2009-09-09.
//

#import "SampleForBaselineAdjustment.h"

@implementation BaselineAdjustmentTest

- (id)initWithBaselineAdjustment:(UIBaselineAdjustment)baselineAdjustment {
  if ( (self = [super init]) ) {
    baselineAdjustment_ = baselineAdjustment;
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
    @"baselineAdjustmentで縮小した文字を描画する縦位置を指定できる。";
  UIFont* systemFont = [UIFont systemFontOfSize:36]; //< 元となるフォントサイズ
  if ( -1 == baselineAdjustment_ ) {
    [message drawAtPoint:rect.origin
                forWidth:rect.size.width
                withFont:systemFont
                fontSize:36
           lineBreakMode:UILineBreakModeWordWrap
      baselineAdjustment:baselineAdjustment_];
  } else {
    [message drawAtPoint:rect.origin
                forWidth:rect.size.width
                withFont:systemFont
                fontSize:10 //< 実際に描画するフォントサイズ
           lineBreakMode:UILineBreakModeWordWrap
      baselineAdjustment:baselineAdjustment_];
  }
}

@end

@implementation SampleForBaselineAdjustment

- (void)viewDidLoad {
  [super viewDidLoad];

  BaselineAdjustmentTest* test0 =
    [[[BaselineAdjustmentTest alloc] initWithBaselineAdjustment:-1] autorelease];
  test0.frame = CGRectMake( 0, 10, 320, 40 );
  [self.view addSubview:test0];

  BaselineAdjustmentTest* test1 =
    [[[BaselineAdjustmentTest alloc] initWithBaselineAdjustment:UIBaselineAdjustmentAlignBaselines] autorelease];
  test1.frame = CGRectMake( 0, 70, 320, 40 );
  [self.view addSubview:test1];

  BaselineAdjustmentTest* test2 =
    [[[BaselineAdjustmentTest alloc] initWithBaselineAdjustment:UIBaselineAdjustmentAlignCenters] autorelease];
  test2.frame = CGRectMake( 0, 130, 320, 40 );
  [self.view addSubview:test2];

  BaselineAdjustmentTest* test3 =
    [[[BaselineAdjustmentTest alloc] initWithBaselineAdjustment:UIBaselineAdjustmentNone] autorelease];
  test3.frame = CGRectMake( 0, 190, 320, 40 );
  [self.view addSubview:test3];
}

@end
