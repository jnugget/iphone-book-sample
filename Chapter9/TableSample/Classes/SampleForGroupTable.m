//
//  SampleForGroupTable.m
//
//  Created by ToKoRo on 2009-09-22.
//

#import "SampleForGroupTable.h"

@implementation SampleForGroupTable

- (id)init {
  if ( (self = [super initWithStyle:UITableViewStyleGrouped]) ) {
    self.title = @"GroupTable";
  }
  return self;
}

@end
