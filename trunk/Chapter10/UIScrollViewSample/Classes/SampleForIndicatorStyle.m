//
//  SampleForIndicatorStyle.m
//
//  Created by ToKoRo on 2009-10-21.
//
		
#import "SampleForIndicatorStyle.h"

@implementation SampleForIndicatorStyle

- (void)dealloc {
  [scrollView_ release]; 
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  // スクロールビューの初期化
  scrollView_ = [[UIScrollView alloc] init];
  scrollView_.frame = self.view.bounds;
  scrollView_.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  // スクロールできるエリアを設定
  UIView* view = [[[UIView alloc] init] autorelease];
  view.frame = CGRectMake( 0, 0, 800, 600 );
  view.backgroundColor = [UIColor grayColor];
  scrollView_.contentSize = view.bounds.size;
  [scrollView_ addSubview:view];
  // スクロールビューを画面に貼り付け
  [self.view addSubview:scrollView_];

  UIBarButtonItem* barButton =
    [[[UIBarButtonItem alloc] initWithTitle:@"Style切替"
                                      style:UIBarButtonItemStyleBordered
                                     target:self
                                     action:@selector(changeButtonDidPush)] autorelease];
  [self setToolbarItems:[NSArray arrayWithObject:barButton]];
}

- (void)changeButtonDidPush {
  if ( UIScrollViewIndicatorStyleWhite < ++scrollView_.indicatorStyle ) {
    scrollView_.indicatorStyle = UIScrollViewIndicatorStyleDefault;
  } 
}

@end
