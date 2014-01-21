//
//  FMCDetailViewController.m
//  Linus
//
//  Created by Lee Yu Zhou on 21/1/14.
//  Copyright (c) 2014 Lee Yu Zhou. All rights reserved.
//

#import "FMCDetailViewController.h"

@interface FMCDetailViewController ()

@end

@implementation FMCDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    NSString *fontNameBold = @"GillSans-Bold";
    NSString *fontName = @"GillSans";
    self.labelInfo.font = [UIFont fontWithName:fontNameBold size:15.0f];
    self.labelInfo.text = self.labelString;
    self.infoView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
    self.textView.font = [UIFont fontWithName:fontName size:15.0f];
    self.textView.text = self.line;
    self.detailView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
