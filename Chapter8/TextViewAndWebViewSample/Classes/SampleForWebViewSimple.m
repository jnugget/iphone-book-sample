//
//  SampleForWebViewSimple.m
//
//  Created by ToKoRo on 2009-09-21.
//

#import "SampleForWebViewSimple.h"

@implementation SampleForWebViewSimple

- (void)dealloc {
  [activityIndicator_ release]; 
  if ( webView_.loading ) [webView_ stopLoading];
  webView_.delegate = nil; //< Appleのドキュメントにrelease前にこれが必要と記載されている
  [webView_ release]; 
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"通信中状態を明示する";
  // UIWebViewの設定
  webView_ = [[UIWebView alloc] init];
  webView_.delegate = self;
  webView_.frame = self.view.bounds;
  webView_.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  webView_.scalesPageToFit = YES;
  [self.view addSubview:webView_];
  // ツールバーにアクティビティインジケータを追加
  activityIndicator_ = [[UIActivityIndicatorView alloc] init];
  activityIndicator_.frame = CGRectMake( 0, 0, 20, 20 );
  UIBarButtonItem* indicator =
    [[[UIBarButtonItem alloc] initWithCustomView:activityIndicator_] autorelease];
  UIBarButtonItem* adjustment =
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                    target:nil
                                                    action:nil] autorelease];
  NSArray* buttons = [NSArray arrayWithObjects:adjustment, indicator, adjustment, nil];
  [self setToolbarItems:buttons animated:YES];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  NSURLRequest* request =
    [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.apple.com/"]];
  [webView_ loadRequest:request];
}

- (void)webViewDidStartLoad:(UIWebView*)webView {
  [activityIndicator_ startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView*)webView {
  [activityIndicator_ stopAnimating];
}

- (void)webView:(UIWebView*)webView didFailLoadWithError:(NSError*)error {
  [activityIndicator_ stopAnimating];
}

@end
