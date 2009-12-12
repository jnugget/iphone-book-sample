//
//  SampleForTextViewObserving.m
//
//  Created by ToKoRo on 2009-09-20.
//

#import "SampleForTextViewObserving.h"

@implementation SampleForTextViewObserving

- (void)dealloc {
  [textView_ release];  
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // UITextViewの貼り付け
  textView_ = [[UITextView alloc] init];
  textView_.frame = self.view.bounds;
  textView_.delegate = self;
  textView_.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  textView_.text = @"このテキストは編集可能です。";
  [self.view addSubview:textView_];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [self textViewDidEndEditing:textView_]; //< 画面表示時には非編集モードにする
}

- (void)viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];
  [textView_ resignFirstResponder]; //< 画面遷移時に非編集モードにする
}

- (BOOL)textView:(UITextView*)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString*)text {
  NSLog( @"shouldChangeTextInRange %@", text );
  if ( [text isEqualToString:@"a"] ) {
    return NO; //< a だけ入力できなくなる
  } 
  return YES;
}

- (BOOL)textViewShouldBeginEditing:(UITextView*)textView {
  NSLog( @"textViewShouldBeginEditing" );
  return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView*)textView {
  NSLog( @"textViewShouldEndEditing" );
  return YES;
}

- (void)textViewDidChangeSelection:(UITextView*)textView {
  NSLog( @"textViewDidChangeSelection" );
}

- (void)textViewDidChange:(UITextView*)textView {
  NSLog( @"textViewDidChange" );
}

- (void)textViewDidBeginEditing:(UITextView*)textView {
  NSLog( @"textViewDidBeginEditing" );
  static const CGFloat kKeyboardHeight = 216.0;

  // ボタンを[編集]に
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
  NSLog( @"textViewDidEndEditing" );

  // ボタンを[完了]に
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
