//
//  SampleForUIImageView.m
//
//  Created by ToKoRo on 2009-09-13.
//

#import "SampleForUIImageView.h"

@implementation SampleForUIImageView

- (void)viewDidLoad {
  [super viewDidLoad];

  // 画像ファイルの読み込み
  UIImage* image = [UIImage imageNamed:@"dog.jpg"];
  // UIImageViewの作成
  UIImageView* imageView = [[[UIImageView alloc] initWithImage:image] autorelease];
  // 場所とオートサイジングの設定
  imageView.center = self.view.center;
  imageView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin |
                               UIViewAutoresizingFlexibleBottomMargin;
  // 画面に貼り付け
  [self.view addSubview:imageView];
}

@end
