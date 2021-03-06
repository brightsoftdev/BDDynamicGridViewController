//
//  BDDynamicGridCell.m
//  BDDynamicGridViewDemo
//
//  Created by Nor Oh on 6/23/12.
//  Created by Nor Oh on 6/21/12.
//
//  Copyright (c) 2012, Norsez Orankijanan (Bluedot) All Rights Reserved.
//
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions are met:
//
//  1. Redistributions of source code must retain the above copyright notice, 
//  this list of conditions and the following disclaimer.
//
//  2. Redistributions in binary form must reproduce the above copyright notice, 
//  this list of conditions and the following disclaimer in the documentation 
//  and/or other materials provided with the distribution.
//
//  3. Neither the name of Bluedot nor the names of its contributors may be used 
//  to endorse or promote products derived from this software without specific
//  prior written permission.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" 
//  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE 
//  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE 
//  ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE 
//  LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR 
//  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
//  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
//  INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
//  CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
//  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
//  POSSIBILITY OF SUCH DAMAGE.



#import "BDDynamicGridCell.h"



@implementation BDDynamicGridCell

- (id)init
{
    self = [self initWithStyle:0 reuseIdentifier:@"GridCell"];
    if (self) {
        
    }
    return self;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight; 
    }
    return self;
}

- (id)initWithLayoutStyle:(BDDynamicGridCellLayoutStyle)layoutStyle reuseIdentifier:(NSString *)cellId
{
    self = [self initWithStyle:0 reuseIdentifier:cellId];
    if (self) {
        _layoutStyle=layoutStyle;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    //layout what's in the cell
    CGFloat aRowHeight = self.frame.size.height;
    CGFloat totalWidth = 0;
    for (int i=0; i<self.contentView.subviews.count; i++){
        UIView* subview = [self.contentView.subviews objectAtIndex:i];
        //assume that for UIImageView, the size we want is the image size
        if ([subview isKindOfClass:[UIImageView class]]){
            UIImageView *iv = (UIImageView*)subview;
            if (iv.image != nil && iv.image.size.width > 0) {
                iv.frame = CGRectMake(0, 0, iv.image.size.width, iv.image.size.height);
            }

        }
        totalWidth = totalWidth + subview.frame.size.width;
    }
    
    CGFloat widthScaling =  (self.contentView.frame.size.width/totalWidth);
    CGFloat accumWidth = self.viewBorderWidth;
    UIView* lastView;
    for (int i=0; i<self.contentView.subviews.count; i++){
        UIView* subview = [self.contentView.subviews objectAtIndex:i];
        subview.frame = CGRectMake(0, 0, subview.frame.size.width * widthScaling, aRowHeight - self.viewBorderWidth);
        CGFloat leftMargin = i==0?0:(self.viewBorderWidth);
        subview.frame = CGRectOffset(subview.frame, accumWidth + leftMargin, 0);
        accumWidth = accumWidth + subview.frame.size.width + leftMargin;
        lastView = subview;
    }
    
//NSLog(@"lastView %@", NSStringFromCGRect(lastView.frame));

}

-(void)setViews:(NSArray *)views
{   
    //remove all subviews.
    if (views == nil || views.count == 0) {
        for (UIView* sb in self.contentView.subviews) {
            [sb removeFromSuperview];
        }
        return;
    }
    
    for(UIView * sv in views){
        sv.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:sv];
    }

    [self setNeedsLayout];
}


@synthesize layoutStyle=_layoutStyle;
@synthesize viewBorderWidth;
@synthesize rowInfo;
@end
