//
//  SampleForUIImage.m
//
//  Created by ToKoRo on 2009-09-13.
//

#import "SampleForUIImage.h"

@implementation DrawImageTest

- (void)dealloc {
  [image_ release];
  [super dealloc];
}

- (id)initWithImage:(UIImage*)image {
  if ( (self = [super init]) ) {
    image_ = image;    
  }
  return self;
}

- (void)drawRect:(CGRect)rect {
//  [image_ drawAtPoint:rect.origin];
  [image_ drawInRect:rect];
}

@end

@implementation SampleForUIImage

- (void)viewDidLoad {
  [super viewDidLoad];

  // 画像ファイルの読み込み
  UIImage* image = [UIImage imageNamed:@"dog.jpg"];
  // オリジナルViewの作成
  DrawImageTest* test = [[[DrawImageTest alloc] initWithImage:image] autorelease];
  test.frame = self.view.bounds;
  test.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  [self.view addSubview:test];
}

@end
