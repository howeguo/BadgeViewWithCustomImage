//
//  BdageView.h
//  tataufoNewDesign
//
//  Created by shihaoguo on 4/12/14.
//  Copyright (c) 2014 shihaoguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BadgeView : UIView
@property(nonatomic,copy) NSString *badgeValue;
@property(nonatomic,strong) UIImage *badgeBgImage;
@property(nonatomic,strong) UIColor *badgeTextColor;
@end
