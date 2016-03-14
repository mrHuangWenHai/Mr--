//
//  myButton.m
//  test8
//
//  Created by 黄文海 on 16/3/12.
//  Copyright © 2016年 huang. All rights reserved.
//

#import "myButton.h"

@implementation myButton
-(instancetype)initWithFrame:(CGRect)frame{
    if([super initWithFrame:frame])
    {
        self.date=[[UILabel alloc] init];
        self.countLabel=[[UILabel alloc] init];
        _date.textAlignment=NSTextAlignmentCenter;
        _countLabel.textAlignment=NSTextAlignmentCenter;
      
        [self addSubview:_date];
        [self addSubview:_countLabel];
        self.count=0;
        
        

    }
    
    return self;
}

-(void)layoutSubviews{
    CGFloat high=CGRectGetHeight(self.frame);
    CGFloat width=CGRectGetWidth(self.frame);
    _date.frame=CGRectMake(7,10, width-20, high-15);
    _countLabel.frame=CGRectMake(width-25,-7,30, 30);
    

    
}
@end
