//
//  SampleForWebView.m
//
//  Created by ToKoRo on 2009-09-21.
//

#import "SampleForWebView.h"

@implementation SampleForWebView

- (void)dealloc {
  if ( webView_.loading ) [webView_ stopLoading];
  webView_.delegate = nil;
  [webView_ release]; 
  [reloadButton_ release]; 
  [stopButton_ release]; 
  [backButton_ release]; 
  [forwardButton_ release]; 
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"UIWebViewテスト";
  // UIWebViewの設定
  webView_ = [[UIWebView alloc] init];
  webView_.delegate = self;
  webView_.frame = self.view.bounds;
  webView_.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  webView_.scalesPageToFit = YES;
  [self.view addSubview:webView_];
  // ツールバーにボタンを追加
  reloadButton_ =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                                  target:self
                                                  action:@selector(reloadDidPush)];
  stopButton_ =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop
                                                  target:self
                                                  action:@selector(stopDidPush)];
  backButton_ =
    [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                     style:UIBarButtonItemStyleBordered
                                    target:self
                                    action:@selector(backDidPush)];
  forwardButton_ =
    [[UIBarButtonItem alloc] initWithTitle:@"Forward"
                                     style:UIBarButtonItemStyleBordered
                                    target:self
                                    action:@selector(forwardDidPush)];
  NSArray* buttons =
    [NSArray arrayWithObjects:backButton_, forwardButton_, reloadButton_, stopButton_, nil];
  [self setToolbarItems:buttons animated:YES];

}

- (void)reloadDidPush {
  [webView_ reload]; //< ページの再読み込み
}

- (void)stopDidPush {
  if ( webView_.loading ) {
    [webView_ stopLoading]; //< 読み込み中止
  } 
}

- (void)backDidPush {
  if ( webView_.canGoBack ) {
    [webView_ goBack]; //< 前のページに戻る
  } 
}

- (void)forwardDidPush {
  if ( webView_.canGoForward ) {
    [webView_ goForward]; //< 次のページに進む
  } 
}

- (void)updateControlEnabled {
  // インジケータやボタンの状態を一括で更新する
  [UIApplication sharedApplication].networkActivityIndicatorVisible = webView_.loading;
  stopButton_.enabled = webView_.loading;
  backButton_.enabled = webView_.canGoBack;
  forwardButton_.enabled = webView_.canGoForward;
}

- (void)viewDidAppear:(BOOL)animated {
  // 画面が表示され終わったらWebページの読み込み
  [super viewDidAppear:animated];
  NSURLRequest* request =
    [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.apple.com/"]];
  [webView_ loadRequest:request];
  [self updateControlEnabled];
}

- (void)viewWillDisappear:(BOOL)animated {
  // 画面を閉じるときにステータスバーのインジケータを確実にOFFにしておく
  [super viewWillDisappear:animated];
  [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void)webViewDidStartLoad:(UIWebView*)webView {
  [self updateControlEnabled];
}

- (void)webViewDidFinishLoad:(UIWebView*)webView {
  [self updateControlEnabled];
}

- (void)webView:(UIWebView*)webView didFailLoadWithError:(NSError*)error {
  [self updateControlEnabled];
}

@end
