//
//  FMCViewController.m
//  Linus
//
//  Created by Lee Yu Zhou on 20/1/14.
//  Copyright (c) 2014 Lee Yu Zhou. All rights reserved.
//

#import "FMCViewController.h"
#import "FMCCell.h"
#import "FMCDetailViewController.h"
@interface FMCViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *sortedArray;
@property (strong, nonatomic) NSArray *arrayOfLines;
@end

@implementation FMCViewController

#define NEW_LINE @"\n"
- (void)viewDidLoad
{
    [super viewDidLoad];

   if (![self.fileName isEqualToString:@""]) {
        NSString *path = [[NSBundle mainBundle] pathForResource:self.fileName ofType:@"txt"];
       if (path) {
        NSString *content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
       
           dispatch_queue_t q = dispatch_queue_create("load queue", NULL);
           dispatch_async(q, ^{
               self.arrayOfLines = [content componentsSeparatedByString:NEW_LINE];
               self.sortedArray = [self mergeSort:self.arrayOfLines];
               dispatch_async(dispatch_get_main_queue(), ^{
                   [self.tableView reloadData];
               });
               
           });
           
       } else {
           UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Unable to generate results" message:@"I'm sorry, but linus could not read the file." delegate:Nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
           [alertView show];
       }
    }
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
}

- (IBAction)finished:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma mark - sort
-(NSArray *)mergeSort:(NSArray *)unsortedArray {
    if ([unsortedArray count] < 2) {
        return unsortedArray;
    }
    NSUInteger mid = [unsortedArray count]/2;
    NSRange upHalf = NSMakeRange(mid, [unsortedArray count] - mid);
    NSRange lowHalf = NSMakeRange(0, mid);
    
    NSArray *lowerArray = [unsortedArray subarrayWithRange:lowHalf];
    NSArray *upperArray = [unsortedArray subarrayWithRange:upHalf];
   
    NSArray *left = [self mergeSort:lowerArray];
    NSArray *right = [self mergeSort:upperArray];
    return [self mergeBottom:left andTop:right];
}

-(NSArray *)mergeBottom:(NSArray *)lower andTop:(NSArray *)upper {

    NSUInteger capacity = [lower count] + [upper count];
    NSMutableArray *combinedArray = [[NSMutableArray alloc]initWithCapacity:capacity];
    int lowerCounter = 0;
    int upperCounter = 0;
    
    for (int i = 0; i < capacity; i++) {
        if (lowerCounter < [lower count] && upperCounter < [upper count]) {
            NSString *low = lower[lowerCounter];
            NSString *up = upper[upperCounter];
            if ([low length] > [up length]) {
                combinedArray[i] = low;
                lowerCounter++;
            } else {
                combinedArray[i] = up;
                upperCounter++;
            }
        }
        else if (lowerCounter < [lower count] && upperCounter >= [upper count]) {
            combinedArray[i] = lower[lowerCounter];
            lowerCounter++;
        }
        else if (lowerCounter >= [lower count] && upperCounter < [upper count]) {
            combinedArray[i] = upper[upperCounter];
            upperCounter++;
        }
    }
    return combinedArray;
}

#pragma mark - table view
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *fontNameBold = @"GillSans-Bold";
    NSString *fontName = @"GillSans";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Line Cell"];
    NSString *line = self.sortedArray[indexPath.row];
    NSUInteger length = [line length];
    FMCCell *lCell = (FMCCell *)cell;
    lCell.position.font = [UIFont fontWithName:fontNameBold size:15.0f];
    lCell.position.text = [NSString stringWithFormat:@"%d. Length: %d",(int)[indexPath row] + 1, (int)length];
    lCell.textView.font = [UIFont fontWithName:fontName size:15.0f];
    lCell.textView.text = self.sortedArray[indexPath.row];
    lCell.labelView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1; //one male and other female
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ((int)self.numberOfLines > [self.arrayOfLines count]) {
        return [self.arrayOfLines count];
    } else {
        return (int)self.numberOfLines;
    }
}

#pragma mark - segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"detail"]) {
        if ([[segue destinationViewController] isKindOfClass:[FMCDetailViewController class]]) {
            FMCDetailViewController *detailVC = (FMCDetailViewController *)segue.destinationViewController;
            FMCCell *cell = (FMCCell *)sender;
            detailVC.line = cell.textView.text;
            detailVC.labelString = cell.position.text;
        }
    }
}

@end
