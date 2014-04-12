//
//  BdageView.m
//  tataufoNewDesign
//
//  Created by shihaoguo on 4/12/14.
//  Copyright (c) 2014 shihaoguo. All rights reserved.
//

#import "BadgeView.h"
@interface BadgeView()
{
    UILabel *_badgeLabel;
    UIImageView *_badgeImageView;
}
@end
#define BdageLabelMaxHeight 10.0f
#define BdageLabelFont  12.0f
//default size  30*25
@implementation BadgeView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor clearColor];
        //self.exclusiveTouch=NO;
        self.userInteractionEnabled=NO;
        [self initSubviews];
    }
    return self;
}
- (void) initSubviews
{

    _badgeImageView=[[UIImageView alloc] initWithFrame:CGRectZero];
    _badgeImageView.backgroundColor=[UIColor clearColor];
    [self addSubview:_badgeImageView];
    _badgeLabel=[[UILabel alloc] initWithFrame:CGRectZero];
    _badgeLabel.backgroundColor=[UIColor clearColor];
    _badgeLabel.textColor=[UIColor colorWithRed:0.0 green:191.0/255.0 blue:243.0/255.0 alpha:1.0f];
    _badgeLabel.font=[UIFont systemFontOfSize:BdageLabelFont];
    _badgeLabel.textAlignment=NSTextAlignmentCenter;
    [_badgeImageView addSubview:_badgeLabel];
}
- (void) setBadgeValue:(NSString *)badgeValue
{
    _badgeValue=badgeValue;
    [self setNeedsLayout];
}
- (void) layoutSubviews
{
    [super layoutSubviews];
    if (_badgeValue==NULL) {
        _badgeLabel.text=NULL;
        self.hidden=YES;
        return;
    }
    //default image
    UIImage *bdageImage=[UIImage imageNamed:@"badge"];
    if (_badgeBgImage) {
        bdageImage=_badgeBgImage;
    }
    if (_badgeTextColor) {
        _badgeLabel.textColor=_badgeTextColor;
    }

    _badgeLabel.text=_badgeValue;
    if (_badgeValue.length==1) {
        _badgeImageView.frame=CGRectMake((self.frame.size.width-17.0f)/2.0, (self.frame.size.height-17.0f)/2.0, bdageImage.size.width, bdageImage.size.height);
        _badgeImageView.image=bdageImage;
    }else{
        _badgeImageView.image=[bdageImage resizableImageWithCapInsets:UIEdgeInsetsMake(0, 10.0f, 0, 10.0f)];
        _badgeImageView.frame=CGRectMake((self.frame.size.width-22.0f)/2.0, (self.frame.size.height-17.0f)/2.0, 22.0f, bdageImage.size.height);

        if (_badgeValue.length>2) {
            _badgeLabel.text=@"99+";
            _badgeImageView.frame=CGRectMake((self.frame.size.width-27.0f)/2.0, (self.frame.size.height-17.0f)/2.0, 27.0f,bdageImage.size.height);
        }
    
    }
    _badgeLabel.frame=CGRectMake(0, 0,_badgeImageView.frame.size.width, _badgeImageView.frame.size.height);
    
}
@end
