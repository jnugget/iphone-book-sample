//
//  SampleForAdjust.m
//
//  Created by ToKoRo on 2009-08-25.
//

#import "SampleForAdjust.h"

@implementation SampleForAdjust

- (void)viewDidLoad {
  [super viewDidLoad];

  self.title = @"Adjust";
  self.view.backgroundColor = [UIColor blackColor];

  UILabel* label0 = [[[UILabel alloc] initWithFrame:CGRectMake( 0, 10, 320, 40 )] autorelease];
  UILabel* label1 = [[[UILabel alloc] initWithFrame:CGRectMake( 0, 60, 320, 40 )] autorelease];
  UILabel* label2 = [[[UILabel alloc] initWithFrame:CGRectMake( 0, 110, 320, 40 )] autorelease];
  UILabel* label3 = [[[UILabel alloc] initWithFrame:CGRectMake( 0, 160, 320, 40 )] autorelease];
  UILabel* label4 = [[[UILabel alloc] initWithFrame:CGRectMake( 0, 210, 320, 40 )] autorelease];
  UILabel* label5 = [[[UILabel alloc] initWithFrame:CGRectMake( 0, 260, 320, 40 )] autorelease];

  label0.text = @"長文になりまして申し訳ありません。今後は気をつけます。";
  label1.text = @"長文になりまして申し訳ありません。今後は気をつけます。";
  label2.text = @"長文になりまして申し訳ありません。今後は気をつけます。";
  label3.text = @"UIBaselineAdjustmentAlignBaselines 長文になりまして申し訳ありません。";
  label4.text = @"UIBaselineAdjustmentAlignCenters 長文になりまして申し訳ありません。";
  label5.text = @"UIBaselineAdjustmentNone 長文になりまして申し訳ありません。";

  label1.adjustsFontSizeToFitWidth = YES;

  label2.adjustsFontSizeToFitWidth = YES;
  label2.minimumFontSize = 14;

  label3.adjustsFontSizeToFitWidth = YES;
  label3.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;

  label4.adjustsFontSizeToFitWidth = YES;
  label4.baselineAdjustment = UIBaselineAdjustmentAlignCenters;

  label5.adjustsFontSizeToFitWidth = YES;
  label5.baselineAdjustment = UIBaselineAdjustmentNone;

  [self.view addSubview:label0];
  [self.view addSubview:label1];
  [self.view addSubview:label2];
  [self.view addSubview:label3];
  [self.view addSubview:label4];
  [self.view addSubview:label5];
}

@end
