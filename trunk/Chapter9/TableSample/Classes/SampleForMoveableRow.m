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

// 新規追加のところに移動できないようにするためこれが必要
- (NSIndexPath*)tableView:(UITableView*)tableView
  targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath*)sourceIndexPath toProposedIndexPath:(NSIndexPath*)proposedDestinationIndexPath
{
  if ( dataSource_.count > proposedDestinationIndexPath.row + 1 ) {
    return proposedDestinationIndexPath;
  } else {
    return sourceIndexPath;
  }
}

@end
