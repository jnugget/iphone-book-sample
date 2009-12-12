//
//  SampleForPickerView.m
//
//  Created by ToKoRo on 2009-10-03.
//

#import "SampleForPickerView.h"

@implementation SampleForPickerView

- (void)viewDidLoad {
  [super viewDidLoad];
  
  UIPickerView* picker = [[[UIPickerView alloc] init] autorelease];
  picker.delegate = self;
  picker.dataSource = self;
  [self.view addSubview:picker];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView {
  return 3;
}

- (NSInteger)pickerView:(UIPickerView*)pickerView numberOfRowsInComponent:(NSInteger)component {
  return 10;
}

- (NSString*)pickerView:(UIPickerView*)pickerView
  titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
  return [NSString stringWithFormat:@"%d-%d", row, component];
}

@end
