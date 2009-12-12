//
//  SampleForCellWithImage.h
//
//  Created by ToKoRo on 2009-09-23.
//

#import <UIKit/UIKit.h>

@interface SampleForCellWithImage : UITableViewController
{
 @protected
  NSArray* dataSource_;
  NSMutableArray* images_; //< 画像保持用の配列
}
@end
