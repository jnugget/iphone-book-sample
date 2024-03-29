//
//  SampleForMinFontSize.m
//
//  Created by ToKoRo on 2009-09-09.
//

#import "SampleForMinFontSize.h"

@implementation MinFontSizeTest

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
    @"入りきらない場合、minFontSizeをミニマムとしてフォントを自動縮小";
  UIFont* systemFont = [UIFont systemFontOfSize:36];
  CGFloat actualFontSize;
  [message drawAtPoint:rect.origin
              forWidth:rect.size.width
              withFont:systemFont
           minFontSize:6
        actualFontSize:&actualFontSize
         lineBreakMode:UILineBreakModeWordWrap
    baselineAdjustment:UIBaselineAdjustmentAlignCenters];
  NSLog( @"actualFontSize = %f", actualFontSize );
}

@end

@implementation SampleForMinFontSize

- (void)viewDidLoad {
  [super viewDidLoad];

  MinFontSizeTest* test = [[[MinFontSizeTest alloc] init] autorelease];
  test.frame = CGRectMake( 0, 10, 320, 40 );
  [self.view addSubview:test];
}
@end
