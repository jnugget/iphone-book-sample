//
//  SampleForEditingButton.m
//
//  Created by ToKoRo on 2009-09-23.
//

#import "SampleForEditingButton.h"

@implementation SampleForEditingButton

- (void)viewDidLoad {
  [super viewDidLoad];
  dataSource_ = [[NSMutableArray alloc] initWithObjects:
                              @"ITEM 1", @"ITEM 2", @"ITEM 3",
                              nil ];
  self.navigationItem.rightBarButtonItem = [self editButtonItem];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  self.tableView.editing = NO;
}

- (void)tableView:(UITableView*)tableView willBeginEditingRowAtIndexPath:(NSIndexPath*)indexPath {
}

- (void)tableView:(UITableView*)tableView didEndEditingRowAtIndexPath:(NSIndexPath*)indexPath {
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
  if ( editing ) {
    // 編集モードに入るので「新規追加」を追加
    NSIndexPath* indexPath = [NSIndexPath indexPathForRow:dataSource_.count inSection:0];
    [dataSource_ addObject:@"新規追加"];
    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                          withRowAnimation:UITableViewRowAnimationTop];
  } else {
    // 編集モードが終わるので「新規追加」を削除
    NSIndexPath* indexPath = [NSIndexPath indexPathForRow:dataSource_.count-1 inSection:0];
    [dataSource_ removeLastObject];
    [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                          withRowAnimation:UITableViewRowAnimationTop];
  }
  [super setEditing:editing animated:YES];
}

@end
