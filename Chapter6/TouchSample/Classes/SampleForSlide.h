//
//  SampleForSlide.h
//
//  Created by ToKoRo on 2009-09-02.
//

#import <UIKit/UIKit.h>

typedef enum
{
  kSlideNone,
  kSlideHorizontal,
  kSlideVertical,
} DirectionForSlide;

@interface SampleForSlide : UIViewController
{
 @private
  UILabel* label_;
  CGPoint touchBegan_;
  CGPoint labelOrigin_;
  DirectionForSlide direction_;
}

@end
