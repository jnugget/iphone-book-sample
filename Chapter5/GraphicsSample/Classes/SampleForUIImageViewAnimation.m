//
//  SampleForUIImageViewAnimation.m
//
//  Created by ToKoRo on 2009-09-13.
//

#import "SampleForUIImageViewAnimation.h"

@implementation SampleForUIImageViewAnimation

- (void)dealloc {
  [imageView_ release];  
  [super dealloc];
}

- (void)viewWillAppear:(BOOL)animated {
 [super viewWillAppear:animated];
 // アニメーションを開始
 [imageView_ startAnimating];
}

- (void)viewWillDisappear:(BOOL)animated {
 [super viewWillDisappear:animated];
 // アニメーションを停止
 [imageView_ stopAnimating];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];

  UIImage* chara1 = [UIImage imageNamed:@"chara1.png"];
  UIImage* chara2 = [UIImage imageNamed:@"chara2.png"];

  imageView_ = [[UIImageView alloc] init];
  imageView_.frame = CGRectMake( 0, 0, 64, 64 );
  // アニメーションのコマになる画像をNSArray形式で設定
  imageView_.animationImages = [NSArray arrayWithObjects:chara1, chara2, nil];
  // 0.5秒おきにコマが変わるように設定
  imageView_.animationDuration = 0.5;

  imageView_.center = self.view.center;
  imageView_.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin |
                                UIViewAutoresizingFlexibleRightMargin |
                                UIViewAutoresizingFlexibleTopMargin |
                                UIViewAutoresizingFlexibleBottomMargin;
  [self.view addSubview:imageView_];
}

@end
