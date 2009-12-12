//
//  SampleForPinch.m
//
//  Created by ToKoRo on 2009-09-06.
//

#import "SampleForPinch.h"
#import <math.h>

#pragma mark ----- Private Methods Definition -----

@interface SampleForPinch ()
- (CGFloat)distanceWithPointA:(CGPoint)pointA pointB:(CGPoint)pointB;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation SampleForPinch

- (void)dealloc {
  [imageView_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor blackColor];
  self.view.multipleTouchEnabled = YES;

  UIImage* image = [UIImage imageNamed:@"dog.jpg"];
  imageView_ = [[UIImageView alloc] initWithImage:image];
  imageView_.center = self.view.center;
  imageView_.contentMode = UIViewContentModeScaleAspectFill;
  imageView_.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin |
                                UIViewAutoresizingFlexibleRightMargin |
                                UIViewAutoresizingFlexibleTopMargin |
                                UIViewAutoresizingFlexibleBottomMargin;
  [self.view addSubview:imageView_];
}

#pragma mark ----- Responder -----

- (void)touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event {
  if ( 2 == [touches count] ) {
    // ２本指でタッチしている場合は、２点間の距離を計算
    // 現状の距離と、前回の距離を比較して距離が縮まったか離れたかを判別
    NSArray* twoFingers = [touches allObjects];
    UITouch* touch1 = [twoFingers objectAtIndex:0];
    UITouch* touch2 = [twoFingers objectAtIndex:1];
    CGPoint previous1 = [touch1 previousLocationInView:self.view];
    CGPoint previous2 = [touch2 previousLocationInView:self.view];
    CGPoint now1 = [touch1 locationInView:self.view];
    CGPoint now2 = [touch2 locationInView:self.view];
    CGFloat previousDistance = [self distanceWithPointA:previous1 pointB:previous2];
    CGFloat distance = [self distanceWithPointA:now1 pointB:now2];

    CGFloat scale = 1.0;
    if ( previousDistance > distance ) {
      // 距離が縮まったらならピンチイン
      scale -= ( previousDistance - distance ) / 300.0;
    } else if ( distance > previousDistance ) {
      // 距離が広がったならピンチアウト
      scale += ( distance - previousDistance ) / 300.0;
    } 
    CGAffineTransform newTransform =
      CGAffineTransformScale( imageView_.transform, scale, scale ); 
    imageView_.transform = newTransform;
    imageView_.center = self.view.center;
  } 
}

#pragma mark ----- Private Methods -----

- (CGFloat)distanceWithPointA:(CGPoint)pointA pointB:(CGPoint)pointB {
  CGFloat dx = fabs( pointB.x - pointA.x );
  CGFloat dy = fabs( pointB.y - pointA.y );
  return sqrt( dx * dx + dy * dy );
}

@end
