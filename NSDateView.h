//
//  NSDateView.h
//  test8
//
//  Created by 黄文海 on 16/3/12.
//  Copyright © 2016年 huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSDateView : UIView
@property(nonatomic,strong)NSArray*buttonArrays;
-(void)setup:(NSDate*)date;
@end
