//
//  SampleForPaging.m
//
//  Created by ToKoRo on 2009-10-20.
//  Last Change: 2009-10-21.
//

#import "SampleForPaging.h"

#pragma mark ----- MyViewController -----

@implementation MyViewController

@synthesize number = number_;

+ (MyViewController*)myViewControllerWithNumber:(NSInteger)number {
  MyViewController* myViewController = [[[MyViewController alloc] init] autorelease];
  myViewController.number = number;
  return myViewController;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  UILabel* label = [[[UILabel alloc] init] autorelease];
  label.frame = self.view.bounds;
  label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  label.backgroundColor = ( self.number % 2 ) ? [UIColor blackColor] : [UIColor whiteColor];
  label.textColor = !( self.number % 2 ) ? [UIColor blackColor] : [UIColor whiteColor];
  label.textAlignment = UITextAlignmentCenter;
  label.font = [UIFont boldSystemFontOfSize:128];
  label.text = [NSString stringWithFormat:@"%d", self.number];
  [self.view addSubview:label];
}

@end

#pragma mark ----- SampleForPaging -----

@implementation SampleForPaging

static const NSInteger kNumberOfPages = 3;
static const NSInteger kViewHeight = 360;

- (void)viewDidLoad {
  [super viewDidLoad];

  // スクロールビューの初期化
  UIScrollView* scrollView = [[[UIScrollView alloc] init] autorelease];
  scrollView.frame = self.view.bounds;
  scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  // 横にページスクロールできるようにコンテンツの大きさを横長に設定
  scrollView.contentSize = CGSizeMake( 320 * kNumberOfPages, kViewHeight );
  // ページごとのスクロールにする
  scrollView.pagingEnabled = YES;
  // スクロールバーを非表示にする
  scrollView.showsHorizontalScrollIndicator = NO;
  scrollView.showsVerticalScrollIndicator = NO;
  // ステータスバータップでトップにスクロールする機能をOFFにする
  scrollView.scrollsToTop = NO;
  // スクロールビューに各画面を貼り付け
  for ( int i = 0; i < kNumberOfPages; ++i ){
    MyViewController* myViewController = [MyViewController myViewControllerWithNumber:i];
    myViewController.view.frame = CGRectMake( 320 * i, 0, 320, kViewHeight );
    [scrollView addSubview:myViewController.view];
  }
  // スクロールビューに各画面に貼り付け
  [self.view addSubview:scrollView];
}

@end
