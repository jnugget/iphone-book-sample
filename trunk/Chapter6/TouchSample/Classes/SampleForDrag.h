//
//  SampleForDrag.h
//
//  Created by ToKoRo on 2009-09-01.
//

#import <UIKit/UIKit.h>

@interface SampleForDrag : UIViewController
{
 @private
  UIImageView* character_;
  BOOL shouldWalk_;
  CGPoint targetPoint_;
}

@end
