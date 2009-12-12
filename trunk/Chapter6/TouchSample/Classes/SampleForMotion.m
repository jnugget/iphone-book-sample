//
//  SampleForMotion.m
//
//  Created by ToKoRo on 2009-09-06.
//

#import "SampleForMotion.h"

@implementation LabelForMotion

- (BOOL)canBecomeFirstResponder {
  return YES;
}

@end

@implementation SampleForMotion

- (void)viewDidLoad {
  [super viewDidLoad];

  LabelForMotion* label = [[[LabelForMotion alloc] init] autorelease];
  label.frame = self.view.bounds;
  label.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  label.textAlignment = UITextAlignmentCenter;
  label.text = @"Shake me!";
  [self.view addSubview:label];
  [label becomeFirstResponder];
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent*)event {
  NSLog( @"motionBegan" );
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent*)event {
  NSLog( @"motionEnded" );
  UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:nil
                                                   message:@"地震だぁーーっ！！"
                                                  delegate:nil
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"OK", nil] autorelease];
  [alert show];
}

- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent*)event {
  NSLog( @"motionCancelled" );
}

@end
