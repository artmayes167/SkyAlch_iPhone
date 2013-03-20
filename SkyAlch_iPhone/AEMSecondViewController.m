//
//  AEMSecondViewController.m
//  SkyAlch_iPhone
//
//  Created by Arthur Mayes on 4/11/12.
//  Copyright (c) 2012 Arthur Mayes. All rights reserved.
//

#import "AEMSecondViewController.h" // Potions

@interface AEMSecondViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *potionsArray;
@end

@implementation AEMSecondViewController

-(NSArray *)potionsArray{
    if (!_potionsArray) _potionsArray = (NSArray *)[[MainDictionary sharedDictionary] getPotions];
    return _potionsArray;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //self.parentViewController.navigationItem.title = @"Potions";
    //self.parentViewController.navigationItem.rightBarButtonItem.enabled = YES;
    self.potionsArray = nil;
    [self.tableView reloadData];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{return 1;}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{return  [self.potionsArray count];}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
        
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
    [cell textLabel].lineBreakMode = NSLineBreakByWordWrapping;
    [cell textLabel].numberOfLines = 0;
    [cell textLabel].font = [UIFont fontWithName:@"Helvetica Bold" size:16.0];
    [[cell textLabel] setText:self.potionsArray[indexPath.row]];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    IngredientsForPotion *newView = [[IngredientsForPotion alloc] init];
    newView.ingredientsArray = [[MainDictionary sharedDictionary] getIngredientsForPotion:self.potionsArray[indexPath.row]];
    newView.currentPotionString = self.potionsArray[indexPath.row];
    [self.navigationController pushViewController:newView animated:YES];
}

//The following two methods add the search string down the side of the table
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    NSMutableArray *charactersForSort = [[NSMutableArray alloc] init];

    for (NSString *item in self.potionsArray)
    {
        if (![charactersForSort containsObject:[item substringToIndex:1]]) [charactersForSort addObject:[item substringToIndex:1]];
    }
    return charactersForSort;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    NSUInteger rowToScrollTo = 0;
    for (NSString *item in self.potionsArray)
    {
        if ([[item substringToIndex:1] isEqualToString:title]){
           
            [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:rowToScrollTo inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
            return rowToScrollTo;
            
        }
        rowToScrollTo++;
    }
    return rowToScrollTo;
}
@end
