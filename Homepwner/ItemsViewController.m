//
//  ItemsViewController.m
//  Homepwner
//
//  Created by peter mac on 14-6-5.
//  Copyright (c) 2014年 peter mac. All rights reserved.
//

#import "ItemsViewController.h"
#import "PossessionStore.h"
#import "Possession.h"

#import "ItemDetailViewController.h"

#import "TableViewCell.h"


@interface ItemsViewController ()

@end

@implementation ItemsViewController

/*
-(void)toggleEditingMode:(id)sender
{
    if ([self isEditing]) {
        [sender setTitle:@"编辑" forState:UIControlStateNormal];
        [self setEditing:NO animated:YES];
    }else{
        [sender setTitle:@"完成" forState:UIControlStateNormal];
        [self setEditing:YES animated:YES];
    }
}
 */

-(void)addNewPossession:(id)sender
{
    [[PossessionStore defaultStore] createPossession];
    [[self tableView] reloadData];
    
}

/*

-(UIView *)headerView
{
    //如果没有再如headerView
    if (!headerView) {
        //载入HeaderView.xib
        [[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self options:nil];
    }
    
    return headerView;
}
*/




- (id) init
{
    //调用父类的指定初始化方法
    //self = [super initWithStyle:UITableViewStyleGrouped];
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        
        
        UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewPossession:)];
        
        [[self navigationItem] setRightBarButtonItem:bbi];
        [[self navigationItem] setTitle:@"Homepwner"];
        [[self navigationItem] setLeftBarButtonItem:[self editButtonItem]];
        
        
       
        
        for (int i = 0; i < 10; i++) {
            [[PossessionStore defaultStore] createPossession];
        }
        
    }
    
   // NSLog(@"sum count %d",[[[PossessionStore defaultStore] allPossessions] count]);
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}


- (void)viewDidLoad
{
    
    
    [super viewDidLoad];
    
    
    //must register a nib or a class for the identifier or connect a prototype cell in a storyboard'的解决办法
    //[self.tableView registerClass :[UITableViewCell class] forCellReuseIdentifier:@"HomepwnerCell"];
    
    self.navigationController.navigationBar.translucent = NO;
    //self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    
    
    /*
    self.tableView.sectionHeaderHeight = 0;
    
    UIEdgeInsets insets = UIEdgeInsetsMake(-35, 0, 0, 0);
    self.tableView.contentInset = insets;
    self.tableView.scrollIndicatorInsets = insets;
     */
    
    //self.view.backgroundColor=[UIColor whiteColor];
    //self.tableView.backgroundColor=[UIColor yellowColor];
    
    /*self.automaticallyAdjustsScrollViewInsets = NO;
    //self.navigationController.navigationBar.translucent = NO;
    //self.edgesForExtendedLayout = UIRectEdgeNone;
    UIEdgeInsets insets = UIEdgeInsetsMake(28, 0, 0, 0);
    self.tableView.contentInset = insets;
    self.tableView.scrollIndicatorInsets = insets;*/
    

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.0f;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(void)viewDidAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    [[self tableView] reloadData];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[[PossessionStore defaultStore] allPossessions] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"TableViewCell";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TableViewCell" owner:self options:nil] lastObject];
    }
    
    Possession *p = [[[PossessionStore defaultStore] allPossessions] objectAtIndex:[indexPath row]];
    
    cell.leftLabel.text = [p possessionName];
    cell.rightLabel.text = [NSString stringWithFormat:@"$%d",[p valueInDollars]];
    
    //[[cell textLabel] setText:[p description]];
    
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        //[tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        PossessionStore *ps = [PossessionStore defaultStore];
        NSArray *possessions = [ps allPossessions];
        Possession *p = [possessions objectAtIndex:[indexPath row]];
        [ps removePossession:p];
        
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    [[PossessionStore defaultStore] movePossessionAtIndex:[fromIndexPath row] toIndex:[toIndexPath row]];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ItemDetailViewController *detailViewController = [[ItemDetailViewController alloc] init];
    NSArray *possessions = [[PossessionStore defaultStore] allPossessions];
    
    [detailViewController setPossession:[possessions objectAtIndex:[indexPath row]]];
    
    //将detailView压入栈顶
    [[self navigationController] pushViewController:detailViewController animated:YES];
}


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
