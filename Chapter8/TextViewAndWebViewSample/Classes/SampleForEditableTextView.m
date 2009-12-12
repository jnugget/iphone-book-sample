//
//  SampleForEditableTextView.m
//
//  Created by ToKoRo on 2009-09-19.
//

#import "SampleForEditableTextView.h"

@implementation SampleForEditableTextView

- (void)dealloc {
  [textView_ release];  
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  textView_ = [[UITextView alloc] init];
  textView_.frame = self.view.bounds;
  textView_.autoresizingMask = UIViewAutoresizingFlexibleWidth |
                               UIViewAutoresizingFlexibleHeight;
  textView_.delegate = self;
  textView_.text = @"このテキストは編集可能です。";

  [self.view addSubview:textView_];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self.navigationController setNavigationBarHidden:NO animated:YES];
  [self.navigationController setToolbarHidden:NO animated:YES];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [self textViewDidEndEditing:textView_]; //< 画面表示時には非編集モードにする
}

- (void)viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];
  [textView_ resignFirstResponder]; //< 画面遷移時に非編集モードにする
}

- (void)textViewDidBeginEditing:(UITextView*)textView {
  static const CGFloat kKeyboardHeight = 216.0;

  // ボタンを[完了]に
  self.navigationItem.rightBarButtonItem =
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                   target:self
                                                   action:@selector(doneDidPush)] autorelease];
  [UIView beginAnimations:nil context:nil];
  [UIView setAnimationDuration:0.3];
  // UITextViewを小さくしてキーボードに隠れないようにする
  CGRect textViewFrame = textView.frame;
  textViewFrame.size.height = self.view.bounds.size.height - kKeyboardHeight;
  textView.frame = textViewFrame;
  // ツールバーの位置も上にあげる
  CGRect toolbarFrame = self.navigationController.toolbar.frame;
  toolbarFrame.origin.y =
    self.view.window.bounds.size.height - toolbarFrame.size.height - kKeyboardHeight;
  self.navigationController.toolbar.frame = toolbarFrame;
  [UIView commitAnimations];
}

- (void)textViewDidEndEditing:(UITextView*)textView {
  // ボタンを[編集]に
  self.navigationItem.rightBarButtonItem =
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
                                                   target:self
                                                   action:@selector(editDidPush)] autorelease];
  [UIView beginAnimations:nil context:nil];
  [UIView setAnimationDuration:0.3];
  // UITextViewの大きさを元に戻す
  textView.frame = self.view.bounds;
  // ツールバーの位置も元に戻す
  CGRect toolbarFrame = self.navigationController.toolbar.frame;
  toolbarFrame.origin.y =
    self.view.window.bounds.size.height - toolbarFrame.size.height;
  self.navigationController.toolbar.frame = toolbarFrame;
  [UIView commitAnimations];
}

- (void)editDidPush {
  [textView_ becomeFirstResponder];
}

- (void)doneDidPush {
  [textView_ resignFirstResponder];
}

@end
