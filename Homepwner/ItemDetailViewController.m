//
//  ItemDetailViewController.m
//  Homepwner
//
//  Created by peter on 14-6-26.
//  Copyright (c) 2014年 peter mac. All rights reserved.
//

#import "ItemDetailViewController.h"

@interface ItemDetailViewController ()

@end

@implementation ItemDetailViewController

@synthesize possession;

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
    
    [[self view] setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    
    
    // Do any additional setup after loading the view from its nib.
}

-(void)viewDidUnload
{
    nameField = nil;
    serialField = nil;
    valueField = nil;
    dateLabel = nil;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //NSLog(@"%@",[possession possessionName]);
    //NSLog(@"%@",[nameField text]);
    [nameField setText:[possession possessionName]];
    [serialField setText:[possession serialNumber]];
    [valueField setText:[NSString stringWithFormat:@"%d",[possession valueInDollars]]];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    
    [dateLabel setText:[dateFormatter stringFromDate:[possession dateCreated]]];
    
    [[self navigationItem] setTitle:[possession possessionName]];
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [[super view] endEditing:YES];
    
    [possession setPossessionName:[nameField text]];
    [possession setSerialNumber:[serialField text]];
    [possession setValueInDollars:[[valueField text] integerValue]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
