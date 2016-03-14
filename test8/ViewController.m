//
//  ViewController.m
//  test8
//
//  Created by 黄文海 on 16/3/7.
//  Copyright © 2016年 huang. All rights reserved.
//

#import "ViewController.h"
#import "myButton.h"
#import "NSDateView.h"

@interface ViewController (){
    NSDateView*dateView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIDatePicker*picker=[[UIDatePicker alloc] initWithFrame:CGRectMake(20,20, CGRectGetWidth(self.view.bounds), 263)];
    [picker setDate:[NSDate date]];
    [picker setDatePickerMode:UIDatePickerModeDate];
    [picker addTarget:self action:@selector(dateChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:picker];
    
    
    dateView=[[NSDateView alloc] initWithFrame:CGRectMake(0, 300,self.view.bounds.size.width, 200)];
    [dateView setup:[NSDate date]];
    [self.view addSubview:dateView];
    
    
}

-(void)dateChange:(id)sender{
    UIDatePicker*picker=(UIDatePicker*)sender;
    NSDate*select=[picker date];
    NSDateFormatter*formatter=[[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString*string=[formatter stringFromDate:select];
    NSLog(@"%@",string);
    [dateView removeFromSuperview];
    dateView=[[NSDateView alloc] initWithFrame:CGRectMake(0, 300,self.view.bounds.size.width, 200)];
    [dateView setup:select];
    [self.view addSubview:dateView];
    
}

-(void)print:(id)sender{
    static int i=1;
    if(i<10)
    {
        i++;
    NSLog(@"huang");
    }
    else
        NSLog(@"a");
   
}

-(void)viewDidAppear:(BOOL)animated
{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
