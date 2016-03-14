//
//  NSDateView.m
//  test8
//
//  Created by 黄文海 on 16/3/12.
//  Copyright © 2016年 huang. All rights reserved.
//

#import "NSDateView.h"
#import "myButton.h"

@implementation NSDateView

int day;
-(instancetype)initWithFrame:(CGRect)frame{
    if([super initWithFrame:frame])
    {
        CGFloat width=CGRectGetWidth(frame);
        int widthLabel=width/7;
        UILabel*label1=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, widthLabel, 20)];
        label1.text=@"一";
        label1.textAlignment=NSTextAlignmentCenter;
        UILabel*label2=[[UILabel alloc] initWithFrame:CGRectMake(widthLabel,0 , widthLabel, 20)];
        label2.text=@"二";
        label2.textAlignment=NSTextAlignmentCenter;
        UILabel*label3=[[UILabel alloc] initWithFrame:CGRectMake(widthLabel*2, 0, widthLabel, 20)];
        label3.textAlignment=NSTextAlignmentCenter;
        label3.text=@"三";
        UILabel*label4=[[UILabel alloc] initWithFrame:CGRectMake( widthLabel*3,0, widthLabel, 20)];
        label4.text=@"四";
        label4.textAlignment=NSTextAlignmentCenter;
        UILabel*label5=[[UILabel alloc] initWithFrame:CGRectMake(widthLabel*4,0 , widthLabel, 20)];
        label5.textAlignment=NSTextAlignmentCenter;
        label5.text=@"五";
        UILabel*label6=[[UILabel alloc] initWithFrame:CGRectMake( widthLabel*5,0, widthLabel, 20)];
        label6.text=@"六";
        label6.textAlignment=NSTextAlignmentCenter;
        UILabel*label7=[[UILabel alloc] initWithFrame:CGRectMake(widthLabel*6, 0, widthLabel, 20)];
        label7.textAlignment=NSTextAlignmentCenter;
        label7.text=@"日";
        
        self.buttonArrays=[NSMutableArray array];
        
        [self addSubview:label7];
        [self addSubview:label6];
        [self addSubview:label5];
        [self addSubview:label4];
        [self addSubview:label3];
        [self addSubview:label2];
        [self addSubview:label1];
        
        
    }
    return self;
}

-(void)setup:(NSDate*)date{
    NSDateFormatter*formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd-HH-mm-ss"];
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];

    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    [calendar setTimeZone: timeZone];
        NSString*current=[formatter stringFromDate:date];
        NSArray*array1=[current componentsSeparatedByString:@"-"];
         NSLog(@"%@",array1);
         day=[array1[2] intValue];

        NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
        NSTimeInterval time=24*60*60*(day-1);
        NSDate*cu=[date dateByAddingTimeInterval:-time];
       NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:[cu dateByAddingTimeInterval:0]];
       NSString*string=[weekdays objectAtIndex:theComponents.weekday];
       NSLog(@"%@",string);
    NSInteger flag=[weekdays indexOfObject:string]-1;
    NSLog(@"%lu...",flag);
    NSTimeInterval time1=24*60*60*(day+1);
    NSDate*lastDate=[date dateByAddingTimeInterval:-time1];
    NSCalendar *calendar1 = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSRange range = [calendar1 rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:lastDate];
    NSUInteger numberOfDaysInMonth = range.length;
    NSLog(@"%lu",(unsigned long)numberOfDaysInMonth);
    
    NSRange range1 = [calendar1 rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:[NSDate date]];
    NSUInteger monthDays = range1.length;
    
    

    myButton*button;
    CGFloat hight=(CGRectGetHeight(self.bounds)-20)/5;
    CGFloat width=CGRectGetWidth(self.frame);
    int widthButton=width/7;
    CGFloat tx=0;
    CGFloat ty=20;
    int tag=1;
    int days=1;
    numberOfDaysInMonth = numberOfDaysInMonth-(flag-2);
    for(int i=1;i<=5;i++)
    {
        if(i==1)
        {
            for(int j=1;j<=flag-1;j++)
            {

                
                [self setButton:button tag:0 day:(int)numberOfDaysInMonth floatx:tx floaty:ty];
                numberOfDaysInMonth++;
                tx+=widthButton;
                
            }
            for(int j=(int)flag;j<=7;j++)
            {
                [self setButton:button tag:tag day:days floatx:tx floaty:ty];
                tx+=widthButton;
                tag++;
                days++;
                
            }
            continue;
        }
        ty+=hight;
        tx=0;
        BOOL k=false;
        for(int j=1;j<=7;j++)
        {
           
            if(days==monthDays)
            {
                days=1;
                tag=0;
                k=true;
            }
            else if(k){tag=0;} else tag++;
            [self setButton:button tag:tag day:days floatx:tx floaty:ty];
            tx+=widthButton;
            days++;
           
        }
        
    }
    
}

-(void)setButton:(myButton*)button tag:(int)tag day:(int) dayt floatx:(CGFloat)tx floaty:(CGFloat)ty{
    CGFloat hight=(CGRectGetHeight(self.bounds)-20)/5;
    CGFloat width=CGRectGetWidth(self.frame);
    int widthButton=width/7;
    button=[[myButton alloc] initWithFrame:CGRectMake(tx, ty, widthButton, hight)];
    button.date.text=[NSString stringWithFormat:@"%d",dayt];
    button.date.textAlignment=NSTextAlignmentCenter;
    button.tag=tag;
    if(day==dayt&&tag!=0)
    {
        button.backgroundColor=[UIColor orangeColor];
        [button addTarget:self action:@selector(tag:) forControlEvents:UIControlEventTouchUpInside];
    }
    else if(dayt<day||tag==0)
    {
        button.date.textColor=[UIColor grayColor];
    }
    else [button addTarget:self action:@selector(tag:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    
    
    
}

-(void)tag:(id)sender{
    myButton*button=(myButton*)sender;
    if(button.count==0)
    {
        button.countLabel.layer.cornerRadius=CGRectGetWidth(button.countLabel.frame)/2;
        button.countLabel.layer.masksToBounds=YES;
        button.countLabel.backgroundColor=[UIColor redColor];

        
    }
    button.count++;
    button.countLabel.text=[NSString stringWithFormat:@"%d",button.count];
    if(day!=button.tag) button.backgroundColor=[UIColor purpleColor];
    
}

@end
