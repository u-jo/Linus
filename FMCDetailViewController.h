//
//  FMCDetailViewController.h
//  Linus
//
//  Created by Lee Yu Zhou on 21/1/14.
//  Copyright (c) 2014 Lee Yu Zhou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FMCDetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet UILabel *labelInfo;
@property (strong, nonatomic) NSString *labelString;
@property (strong, nonatomic) NSString *line;
@property (strong, nonatomic) IBOutlet UIView *infoView;
@property (strong, nonatomic) IBOutlet UIView *detailView;
@end
