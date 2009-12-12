//
//  SampleForResponderChain.m
//
//  Created by ToKoRo on 2009-08-31.
//

#import "SampleForResponderChain.h"

#pragma mark ----- TouchableLabelForResponder -----

@interface TouchableLabelForResponder : UILabel
@end 

@implementation TouchableLabelForResponder

// 今回は、initメソッドをオーバーライドしておこう
- (id)init {
  if ( (self = [super init]) ) {
    // userInteractionEnabledを確実にYESにしておく
    self.userInteractionEnabled = YES; 
    // オートリサイズ設定を繰り返さなくて良いようにここでしておく
    self.autoresizingMask =  UIViewAutoresizingFlexibleWidth |
                             UIViewAutoresizingFlexibleHeight |
                             UIViewAutoresizingFlexibleLeftMargin |
                             UIViewAutoresizingFlexibleRightMargin |
                             UIViewAutoresizingFlexibleTopMargin |
                             UIViewAutoresizingFlexibleBottomMargin;
  }
  return self;
}

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
  // タッチを検知したら、まずラベルの文字列をログ出力する
  NSLog( @"%@", self.text );
  // ただし、イベントはそのまま次のレスポンダに受け流す
  [self.nextResponder touchesBegan:touches withEvent:event];
}

@end 

#pragma mark ----- SampleForResponderChain -----

@implementation SampleForResponderChain

- (void)viewDidLoad {
  [super viewDidLoad];

  // ３つのラベルのうち一番親となるものを作り、画面に貼り付ける
  TouchableLabelForResponder* grandFather = [[[TouchableLabelForResponder alloc] init] autorelease];
  grandFather.frame = CGRectInset( self.view.bounds, 40, 20 );
  grandFather.text = @"A";
  grandFather.backgroundColor = [UIColor darkGrayColor];
  [self.view addSubview:grandFather];

  // ２つめのラベルは、上で作ったラベルに貼り付ける
  TouchableLabelForResponder* father = [[[TouchableLabelForResponder alloc] init] autorelease];
  father.frame = CGRectInset( grandFather.bounds, 40, 20 );
  father.text = @"B";
  father.backgroundColor = [UIColor grayColor];
  [grandFather addSubview:father];

  // ３つめのラベルは、２つめのラベルに貼り付ける
  // これでラベルが３段階になる
  TouchableLabelForResponder* me = [[[TouchableLabelForResponder alloc] init] autorelease];
  me.frame = CGRectInset( father.bounds, 40, 20 );
  me.text = @"C";
  me.backgroundColor = [UIColor whiteColor];
  [father addSubview:me];
}

// どのラベルもイベントを処理しなければ、ここで受ける
- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
  UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:nil
                                                   message:@"I'm a viewController!"
                                                  delegate:nil
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"OK", nil] autorelease];
  [alert show];
}

@end
