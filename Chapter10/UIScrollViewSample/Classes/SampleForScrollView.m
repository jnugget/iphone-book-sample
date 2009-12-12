//
//  SampleForScrollView.m
//
//  Created by ToKoRo on 2009-10-20.
//

#import "SampleForScrollView.h"

@implementation SampleForScrollView

- (void)viewDidLoad {
  [super viewDidLoad];

  // スクロールビューの初期化
  UIScrollView* scrollView = [[[UIScrollView alloc] init] autorelease];
  scrollView.frame = self.view.bounds;
  scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  // スクロールビューに画像を設定 
  UIImage* image = [UIImage imageNamed:@"town.jpg"];
  UIImageView* imageView = [[[UIImageView alloc] initWithImage:image] autorelease];
  [scrollView addSubview:imageView];
  scrollView.contentSize = imageView.bounds.size;
  // スクロールビューを画面に貼り付け
  [self.view addSubview:scrollView];

  // 拡大/縮小対応
  scrollView.delegate = self;
  scrollView.minimumZoomScale = 0.1;
  scrollView.maximumZoomScale = 3.0;
}

// 拡大/縮小対応
- (UIView*)viewForZoomingInScrollView:(UIScrollView*)scrollView {
  for ( id subview in scrollView.subviews ) {
    if ( [subview isKindOfClass:[UIImageView class]] ) {
      return subview;
    }
  }
  return nil;
}

@end
