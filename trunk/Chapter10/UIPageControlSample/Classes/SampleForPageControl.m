//
//  SampleForPageControl.m
//
//  Created by ToKoRo on 2009-10-05.
//

#import "SampleForPageControl.h"

@implementation SampleForPageControl

- (void)dealloc {
  [pageControl_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  pageControl_ = [[UIPageControl alloc] init];
  pageControl_.frame = CGRectMake( 0, self.view.bounds.size.height - 30, 320, 30 );
  pageControl_.backgroundColor = [UIColor blackColor]; //< ココ地味に重要
  [pageControl_ addTarget:self
                   action:@selector(pageControlDidChange:)
         forControlEvents:UIControlEventValueChanged];
  pageControl_.autoresizingMask = UIViewAutoresizingFlexibleTopMargin |
                                  UIViewAutoresizingFlexibleBottomMargin;
  pageControl_.numberOfPages = 5;
  pageControl_.currentPage = 0;
//  pageControl_.defersCurrentPageDisplay = YES;
  [self.view addSubview:pageControl_];

  UIBarButtonItem* addButton =
    [[[UIBarButtonItem alloc] initWithTitle:@"ページ追加"
                                      style:UIBarButtonItemStyleBordered
                                     target:self
                                     action:@selector(addDidPush)] autorelease];
  UIBarButtonItem* delButton =
    [[[UIBarButtonItem alloc] initWithTitle:@"ページ削除"
                                      style:UIBarButtonItemStyleBordered
                                     target:self
                                     action:@selector(delDidPush)] autorelease];
  NSArray* items = [NSArray arrayWithObjects:addButton, delButton, nil];
  [self setToolbarItems:items animated:NO];
}

- (void)pageControlDidChange:(id)sender {
  // ここでページコントロールの表示を更新する
//  UIPageControl* pageControl = (UIPageControl*)sender;
//  [pageControl updateCurrentPageDisplay];
}

- (void)addDidPush {
  if ( 10 > pageControl_.numberOfPages ) {
    ++pageControl_.numberOfPages;
  } 
}

- (void)delDidPush {
  if ( 1 < pageControl_.numberOfPages ) {
    --pageControl_.numberOfPages;
    [self pageControlDidChange:pageControl_];
  } 
}

@end
