//
//  SampleForBlackCellTable.m
//
//  Created by ToKoRo on 2009-09-23.
//

#import "SampleForBlackCellTable.h"

@implementation SampleForBlackCellTable

- (void)viewDidLoad {
  [super viewDidLoad];
  self.tableView.backgroundColor = [UIColor blackColor]; //< 背景色の変更
  self.tableView.rowHeight = 128.0; //< セルの大きさの変更
//  self.tableView.separatorColor = [UIColor redColor]; //< 区切り線を赤くする
  self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (UITableViewCell*)tableView:(UITableView*)tableView
  cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
  static NSString* identifier = @"basis-cell";
  UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
  if ( nil == cell ) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                  reuseIdentifier:identifier];
    [cell autorelease];
    cell.textLabel.textColor = [UIColor whiteColor]; //< テキストの色変更
    cell.textLabel.textAlignment = UITextAlignmentCenter; //< アラインメントの変更
    cell.textLabel.font = [UIFont systemFontOfSize:64]; //< フォントの変更
  }
  NSString* text = [dataSource_ objectAtIndex:indexPath.row];
  cell.textLabel.text = text;
  return cell;
}

@end
