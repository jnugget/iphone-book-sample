//
//  SampleForChangeWidthAndHeight.m
//
//  Created by ToKoRo on 2009-10-03.
//

#import "SampleForChangeWidthAndHeight.h"

@implementation SampleForChangeWidthAndHeight

- (void)viewDidLoad {
  [super viewDidLoad];
  
  UIPickerView* picker = [[[UIPickerView alloc] init] autorelease];
  picker.delegate = self;
  [self.view addSubview:picker];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView {
  return 2;
}

- (NSInteger)pickerView:(UIPickerView*)pickerView numberOfRowsInComponent:(NSInteger)component {
  return 10;
}

- (NSString*)pickerView:(UIPickerView*)pickerView
  titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
  if ( 0 == component ) {
    // 1列目
    return [NSString stringWithFormat:@"%2d", row+1];
  } else {
    // 2列目
    return [NSString stringWithFormat:@"長めの文字列 その%d", row+1];
  }
}

/*
- (CGFloat)pickerView:(UIPickerView*)pickerView widthForComponent:(NSInteger)component {
  if ( 0 == component ) {
    // 1列目を狭く
    return 50;
  } else {
    // 2列目を広く
    return 250;
  }
}

- (CGFloat)pickerView:(UIPickerView*)pickerView rowHeightForComponent:(NSInteger)component {
  if ( 0 == component ) {
    // 1列目を狭く
    return 30;
  } else {
    // 2列目を広く
    return 60;
  }
}
*/

@end
