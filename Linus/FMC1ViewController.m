//
//  FMC1ViewController.m
//  Linus
//
//  Created by Lee Yu Zhou on 20/1/14.
//  Copyright (c) 2014 Lee Yu Zhou. All rights reserved.
//
#import "FMCViewController.h"
#import "FMC1ViewController.h"

@interface FMC1ViewController ()
@property (strong, nonatomic) IBOutlet UIView *infoView;

@property (strong, nonatomic) IBOutlet UILabel *infoLabel;
@property (strong, nonatomic) IBOutlet UIButton *getLine;
@property (strong, nonatomic) IBOutlet UITextField *numLinesTextField;
@property (strong, nonatomic) IBOutlet UITextField *fileNameTextField;

@end

@implementation FMC1ViewController

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
    
    
    NSString *fontName = @"GillSans";
    self.infoLabel.font =  [UIFont fontWithName:fontName size:20.0f];
    self.infoView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
    
    self.getLine.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
    self.getLine.titleLabel.font = [UIFont fontWithName:fontName size:20.0f];

    [self.getLine setTitleColor:[UIColor colorWithWhite:1.0f alpha:0.5f] forState:UIControlStateHighlighted];
    
    self.numLinesTextField.backgroundColor = [UIColor whiteColor];
    self.numLinesTextField.placeholder = @"  Number of Lines";
    self.numLinesTextField.font = [UIFont fontWithName:fontName size:15.0f];
    
    self.numLinesTextField.layer.borderColor = [UIColor colorWithWhite:0.9 alpha:0.7].CGColor;
    self.numLinesTextField.layer.borderWidth = 1.0f;
    
    self.fileNameTextField.backgroundColor = [UIColor whiteColor];
    self.fileNameTextField.placeholder = @"  Text File Name (without extension)";
    self.fileNameTextField.font = [UIFont fontWithName:fontName size:15.0f];
    self.fileNameTextField.layer.borderColor = [UIColor colorWithWhite:0.9 alpha:0.7].CGColor;
    self.fileNameTextField.layer.borderWidth = 1.0f;
    DoneCancelNumberPadToolbar *toolbar = [[DoneCancelNumberPadToolbar alloc] initWithTextField:self.numLinesTextField];
    toolbar.delegate = self;
    self.numLinesTextField.inputAccessoryView = toolbar;
    [self.fileNameTextField addTarget:self
                       action:@selector(textFieldFinished:)
             forControlEvents:UIControlEventEditingDidEndOnExit];
}

-(IBAction)textFieldFinished:(id)sender{
    [sender resignFirstResponder];
}
-(void) viewWillAppear:(BOOL)animated
{
    self.numLinesTextField.text = @"";
    self.fileNameTextField.text = @"";
    
}
- (IBAction)dismissAll:(id)sender {
    [self.fileNameTextField resignFirstResponder];
    [self.numLinesTextField resignFirstResponder];
}

-(void)doneCancelNumberPadToolbarDelegate:(DoneCancelNumberPadToolbar *)controller didClickDone:(UITextField *)textField
{
}

-(void)doneCancelNumberPadToolbarDelegate:(DoneCancelNumberPadToolbar *)controller didClickCancel:(UITextField *)textField
{
    textField.text = @"";
}



- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    NSString *fileName = self.fileNameTextField.text;
    NSString *trimmedString = [fileName stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *numLines = self.numLinesTextField.text;
    NSString *path = [[NSBundle mainBundle] pathForResource:trimmedString ofType:@"txt"];
    NSString *content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    if (!content || [fileName isEqualToString:@""] || [numLines isEqualToString:@""]) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Invalid File Name/Number of Lines" message:@"Please enter a valid input" delegate:Nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alertView show];
        return NO;
    } else {
        return YES;
    }
}
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

        if ([[segue destinationViewController] isKindOfClass:[UINavigationController class]]) {
            
            UINavigationController *navigationController = (UINavigationController *)segue.destinationViewController;
            UIViewController *topViewController = [navigationController topViewController];
            FMCViewController *tableView = (FMCViewController *)topViewController;
            NSString *fileName = self.fileNameTextField.text;
            NSString *trimmedString = [fileName stringByReplacingOccurrencesOfString:@" " withString:@""];
            NSInteger numLines = [self.numLinesTextField.text integerValue];
            tableView.fileName = trimmedString;
            tableView.numberOfLines = numLines;
        }
    
}


@end
