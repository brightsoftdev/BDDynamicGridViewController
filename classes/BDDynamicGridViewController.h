//
//  BDDynamicGridViewController.h
//  BDDynamicGridViewDemo
//
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


#import <UIKit/UIKit.h>
#import "BDDynamicGridViewDelegate.h"


/**
 This class displays a UIView list in a layout inspired by Flickr's 2012
 Favorite page. (See http://blog.flickr.net/en/2012/03/22/your-favorites-page-now-with-justified-view/)
 
 This class requires a delegate as a both data source. (For method delegators, 
 we favors blocks instead.) The
 delegate class must implement BDDynamicGridViewDelegate protocol and be set as 
 the delegate for this controller.
 
 ##How it works
 
 Basically, you need to decide the number of columns for each row for the UIViews
 to be displayed. Then this class layout each UIView on each row by evenly
 justify them.
 
 */
@interface BDDynamicGridViewController : UIViewController 

/**
 @name Tasks
 */

/**
 Reload the entire view.
 */
- (void)reloadData;

/**
 @name Properties
 */
@property (nonatomic, strong) id<BDDynamicGridViewDelegate> delegate;
@property (nonatomic, assign) CGFloat rowHeight;
@property (nonatomic, assign) CGFloat borderWidth;


/**
 @name Method delegator blocks
 */
@property (nonatomic, copy) void (^onLongPress)(UIView* view, NSUInteger);
@property (nonatomic, copy) void (^onDoubleTap)(UIView* view, NSUInteger);

@end