//
//  SampleForCountDownTimer.m
//
//  Created by ToKoRo on 2009-10-03.
//

#import "SampleForCountDownTimer.h"

@implementation SampleForCountDownTimer

- (void)dealloc {
  [timer_ release];
  [datePicker_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // カウントダウンタイマーの作成と初期化
  datePicker_ = [[UIDatePicker alloc] init];
  datePicker_.datePickerMode = UIDatePickerModeCountDownTimer;
  // 初期表示を 5 min とする
  datePicker_.countDownDuration = 60*5;
  [self.view addSubview:datePicker_];
  // 1秒ごとに繰り返し呼ばれるタイマーを作成
  timer_ = [[NSTimer timerWithTimeInterval:60.0
                                   target:self
                                 selector:@selector(timerFireMethod:)
                                 userInfo:nil
                                  repeats:YES] retain];
  // タイマーを開始する
  NSRunLoop* runLoop = [NSRunLoop currentRunLoop];
  [runLoop addTimer:timer_ forMode:NSDefaultRunLoopMode];
}

- (void)viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];
  // 画面が非表示になるときに必ずタイマーを停止する
  if ( [timer_ isValid] ) {
    [timer_ invalidate];
  } 
}

- (void)timerFireMethod:(NSTimer*)theTimer {
  // タイマーが１秒経過するごとに呼ばれる
  // カウントが0.0になるまで１分ごとに減算していく
  NSTimeInterval now = datePicker_.countDownDuration;
  if ( 0.0 < now ) {
    datePicker_.countDownDuration = now - 60.0;
  } 
}

@end
