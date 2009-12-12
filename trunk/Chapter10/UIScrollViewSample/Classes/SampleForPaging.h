//
//  SampleForPaging.h
//
//  Created by ToKoRo on 2009-10-20.
//  Last Change: 2009-10-21.
//

#import <UIKit/UIKit.h>

#pragma mark ----- MyViewController -----

@interface MyViewController : UIViewController
{
 @private
  NSInteger number_;
}

@property (nonatomic, assign) NSInteger number;
+ (MyViewController*)myViewControllerWithNumber:(NSInteger)number;

@end

#pragma mark ----- SampleForPaging -----

@interface SampleForPaging : UIViewController
@end
