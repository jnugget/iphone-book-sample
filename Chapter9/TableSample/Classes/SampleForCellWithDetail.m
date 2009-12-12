//
//  SampleForCellWithDetail.m
//
//  Created by ToKoRo on 2009-09-23.
//

#import "SampleForCellWithDetail.h"

@implementation SampleForCellWithDetail

static NSString* kCellStyleDefault = @"style-default";
static NSString* kCellStyleValue1 = @"style-value1";
static NSString* kCellStyleValue2 = @"style-value2";
static NSString* kCellStyleSubtitle = @"style-subtitle";

- (void)dealloc {
  [details_ release];  
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // 詳細情報用テキストの設定
  details_ = [[NSArray alloc] initWithObjects:@"猿（サル）",
                                              @"犬（イヌ）",
                                              @"獅子（ライオン）",
                                              @"象（ゾウ）",
                                              nil];
  // セルスタイルのデフォルト設定
  cellStyle_ = UITableViewCellStyleSubtitle;
  // ナビゲーションバーにボタンを追加
  UIBarButtonItem* button =
    [[[UIBarButtonItem alloc] initWithTitle:@"CellStyle"
                                      style:UIBarButtonItemStyleBordered
                                     target:self
                                     action:@selector(buttonDidPush)] autorelease];
  self.navigationItem.rightBarButtonItem = button;
}

- (UITableViewCell*)tableView:(UITableView*)tableView
  cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
  NSString* identifier;
  switch ( cellStyle_ ) {
    case UITableViewCellStyleValue1: identifier = kCellStyleValue1; break;
    case UITableViewCellStyleValue2: identifier = kCellStyleValue2; break;
    case UITableViewCellStyleSubtitle: identifier = kCellStyleSubtitle; break;
    default: identifier = kCellStyleDefault; break;
  }
  UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
  if ( nil == cell ) {
    cell = [[UITableViewCell alloc] initWithStyle:cellStyle_
                                  reuseIdentifier:identifier];
    [cell autorelease];
  }
  cell.textLabel.text = [dataSource_ objectAtIndex:indexPath.row];
  cell.imageView.image = [images_ objectAtIndex:indexPath.row];
  cell.detailTextLabel.text = [details_ objectAtIndex:indexPath.row];
  return cell;
}

- (void)buttonDidPush {
  if ( UITableViewCellStyleSubtitle < ++cellStyle_ ) {
    cellStyle_ = UITableViewCellStyleDefault;
  } 
  [self.tableView reloadData];
}

@end
