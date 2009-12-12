//
//  SampleForLabel.m
//
//  Created by ToKoRo on 2009-09-08.
//

#import "SampleForLabel.h"

@implementation SampleForLabel

- (void)viewDidLoad {
  [super viewDidLoad];

  UILabel* label = [[[UILabel alloc] init] autorelease];
  // ラベルの大きさを画面と同じに
  label.frame = self.view.bounds;
  // ナビゲーションバーが加わっても画面とラベルの大きさのバランスを保つ
  label.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  label.textAlignment = UITextAlignmentCenter;
  label.text = @"またまたラベルの登場です。";
  [self.view addSubview:label];
}

@end
