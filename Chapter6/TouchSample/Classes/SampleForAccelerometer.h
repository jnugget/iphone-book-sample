//
//  SampleForAccelerometer.h
//
//  Created by ToKoRo on 2009-09-07.
//

#import <UIKit/UIKit.h>

// UIAccelerometerからの通知を受けるためにUIAccelerometerDelegateプロトコルを実装
@interface SampleForAccelerometer : UIViewController <UIAccelerometerDelegate>  
{
 @private
  UIImageView* imageView_;
  UIAccelerationValue speedX_;
  UIAccelerationValue speedY_;
}

@end
