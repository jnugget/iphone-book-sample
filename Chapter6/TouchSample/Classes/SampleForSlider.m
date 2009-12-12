//
//  SampleForSlider.m
//
//  Created by ToKoRo on 2009-08-31.
//

#import "SampleForSlider.h"

@implementation SampleForSlider

// finalize
- (void)dealloc {
  [sliderCopy_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  self.title = @"UISlider";
  self.view.backgroundColor = [UIColor whiteColor];

  // スライダを作成
  UISlider* slider = [[[UISlider alloc] init] autorelease];
  slider.frame = CGRectMake( 0, 0, 200, 50 );
  slider.minimumValue = 0.0; //< スライダの最小値を設定
  slider.maximumValue = 1.0; //< スライダの最大値を設定
  slider.center = self.view.center;

  // スライダが変更されたときに呼ばれるメソッドを指定する
  [slider addTarget:self
             action:@selector(sliderDidChange:)
   forControlEvents:UIControlEventValueChanged];

  // スライダをコピーする
  sliderCopy_ = [[UISlider alloc] init];
  sliderCopy_.frame = slider.frame;
  sliderCopy_.minimumValue = slider.minimumValue;
  sliderCopy_.maximumValue = slider.maximumValue;
  CGPoint point = slider.center;
  point.y += 50;
  sliderCopy_.center = point;

  // スライダを２つ画面に追加
  [self.view addSubview:slider];
  [self.view addSubview:sliderCopy_];
}

// スライダが変更されたときにこれが呼ばれる
- (void)sliderDidChange:(id)sender {
  if ( [sender isKindOfClass:[UISlider class]] ) {
    UISlider* slider = sender;
    // sliderCopy_の値をsliderと同じにする
    sliderCopy_.value = slider.value;
  } 
}

@end
