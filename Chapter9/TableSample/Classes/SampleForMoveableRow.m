//
//  SampleForMoveableRow.m
//
//  Created by ToKoRo on 2009-09-23.
//

#import "SampleForMoveableRow.h"

@implementation SampleForMoveableRow

- (BOOL)tableView:(UITableView*)tableView canMoveRowAtIndexPath:(NSIndexPath*)indexPath {
  // 最後のセル以外ならYES
  return ( dataSource_.count > indexPath.row + 1 );
}

- (void)tableView:(UITableView*)tableView
  moveRowAtIndexPath:(NSIndexPath*)fromIndexPath toIndexPath:(NSIndexPath*)toIndexPath
{
  NSUInteger fromRow = fromIndexPath.row;
  NSUInteger toRow = toIndexPath.row;
  while ( fromRow < toRow ) {
    [dataSource_ exchangeObjectAtIndex:fromRow withObjectAtIndex:fromRow+1];
    fromRow++;
  }
  while ( fromRow > toRow ) {
    [dataSource_ exchangeObjectAtIndex:fromRow withObjectAtIndex:fromRow-1];
    fromRow--;
  }
}

@end
