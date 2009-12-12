//
//  SampleForModal.m
//
//  Created by ToKoRo on 2009-08-16.
//

#import "SampleForModal.h"

@implementation SampleForModal

- (void)viewDidLoad {
  [super viewDidLoad];

  self.view.backgroundColor = [UIColor whiteColor];

  // モーダルな画面を呼び出すためのボタンを追加
  UIButton* modalButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [modalButton setTitle:@"モーダルダイアログを呼び出す" forState:UIControlStateNormal];
  [modalButton sizeToFit];
  modalButton.center = self.view.center;
  [modalButton addTarget:self
                  action:@selector(modalDidPush)
        forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:modalButton];
}

- (void)modalDidPush {
  // モーダルダイアログの表示
  ModalDialog* dialog = [[[ModalDialog alloc] init] autorelease];
  dialog.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
  [self presentModalViewController:dialog animated:YES];
}

@end

@implementation ModalDialog

- (void)viewDidLoad {
  [super viewDidLoad];

  // ラベルを１つ追加
  UILabel* label = [[[UILabel alloc] initWithFrame:self.view.bounds] autorelease];
  label.backgroundColor = [UIColor blackColor];
  label.textColor = [UIColor whiteColor];
  label.textAlignment = UITextAlignmentCenter;
  label.text = @"こんばんわ。私がモーダルです。";
  [self.view addSubview:label];

  // 閉じるボタンを追加
  UIButton* goodbyeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [goodbyeButton setTitle:@"Good-bye" forState:UIControlStateNormal];
  [goodbyeButton sizeToFit];
  CGPoint newPoint = self.view.center;
  newPoint.y += 80;
  goodbyeButton.center = newPoint;
  [goodbyeButton addTarget:self
                    action:@selector(goodbyeDidPush)
          forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:goodbyeButton];
}

- (void)goodbyeDidPush {
  // モーダルダイアログを閉じる
  [self dismissModalViewControllerAnimated:YES];
}

@end
