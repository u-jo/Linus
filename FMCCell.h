//
//  FMCCell.h
//  Linus
//
//  Created by Lee Yu Zhou on 21/1/14.
//  Copyright (c) 2014 Lee Yu Zhou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FMCCell : UITableViewCell


@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet UILabel *position;
@property (strong, nonatomic) IBOutlet UIView *labelView;

@end
