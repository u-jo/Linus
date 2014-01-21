//
//  FMCViewController.h
//  Linus
//
//  Created by Lee Yu Zhou on 20/1/14.
//  Copyright (c) 2014 Lee Yu Zhou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FMCViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) NSString *fileName;
@property (nonatomic) NSInteger numberOfLines;

-(NSArray *)mergeSort:(NSArray *)unsortedArray;
-(NSArray *)mergeBottom:(NSArray *)lower andTop:(NSArray *)top;
@end
