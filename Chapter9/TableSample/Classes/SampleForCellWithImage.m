//
//  SampleForCellWithImage.m
//
//  Created by ToKoRo on 2009-09-23.
//

#import "SampleForCellWithImage.h"

@implementation SampleForCellWithImage

- (void)dealloc {
  [images_ release];  
  [dataSource_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  dataSource_ = [[NSArray alloc] initWithObjects:@"Monkey", @"Dog", @"Lion", @"Elephant", nil];
  images_ = [[NSMutableArray alloc] initWithCapacity:8];
  for ( NSString* name in dataSource_ ) {
    NSString* imageName = [NSString stringWithFormat:@"%@.png", name];
    UIImage* image = [UIImage imageNamed:imageName];
    [images_ addObject:image];
  }
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
  return [dataSource_ count];
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
  }
  cell.textLabel.text = [dataSource_ objectAtIndex:indexPath.row];
  cell.imageView.image = [images_ objectAtIndex:indexPath.row];
  return cell;
}

@end
