//
//  SampleForLinks.m
//
//  Created by ToKoRo on 2009-09-24.
//

#import "SampleForLinks.h"

@implementation SampleForLinks

- (void)dealloc {
  [dataSource_ release];
  [urls_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  dataSource_ = [[NSArray alloc] initWithObjects:
                              @"Web Links",
                              @"Mail Links",
                              @"Phone Links",
                              @"Text Links",
                              @"Map Links",
                              @"YouTube Links",
                              @"iTunes Links",
                              @"Customize Links",
                              nil ];
  urls_ = [[NSArray alloc] initWithObjects:
                              @"http://www.apple.com/",
                              @"mailto:monster@n-i-l-x.example.com?subject=hello&body=hello%20mail!",
                              @"tel:090-0000-0000",
                              @"sms:090-0000-0000",
                              @"http://maps.google.com/maps?ll=35.681111%2C139.766702&z=15",
                              @"http://www.youtube.com/v/jX--wQ_qdDU",
                              @"http://phobos.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=311155655&mt=8",
                              @"sampleapp://sampleapp.yourcompany.com/?Hello",
                              nil ];
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
  return cell;
}

- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath {
  NSString* urlString = [urls_ objectAtIndex:indexPath.row];
  NSURL* url = [NSURL URLWithString:urlString];
  UIApplication* application = [UIApplication sharedApplication];
  if ( [application canOpenURL:url] ) {
    [application openURL:url];
  } 
}

@end
