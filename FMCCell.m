//
//  FMCCell.m
//  Linus
//
//  Created by Lee Yu Zhou on 21/1/14.
//  Copyright (c) 2014 Lee Yu Zhou. All rights reserved.
//

#import "FMCCell.h"

@implementation FMCCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
