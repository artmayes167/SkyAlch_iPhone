//
//  AEMFirstViewController.m
//  SkyAlch
//
//  Created by Arthur Mayes on 4/6/12.
//  Copyright (c) 2012 Arthur Mayes. All rights reserved.
//

#import "AEMFirstViewController.h" // Ingredients
@interface AEMFirstViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end


@implementation AEMFirstViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    CGFloat screenScale = [[UIScreen mainScreen] scale];
    if (screenScale == 2.0f) self.tabBarItem.image = [UIImage imageNamed:@"Bowl.png"];
    self.parentViewController.navigationItem.title = @"Ingredients";
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    //self.parentViewController.navigationItem.title = @"Ings";
}
-(void)viewWillDisappear:(BOOL)animated
{
    //self.parentViewController.navigationItem.title = @"Ings";
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{return 1;}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{return  [[MainDictionary sharedDictionary]getIngredientsCount];}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
        
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    [cell textLabel].lineBreakMode = NSLineBreakByWordWrapping;
    [cell textLabel].numberOfLines = 0;
    [cell textLabel].font = [UIFont fontWithName:@"Helvetica Bold" size:16.0];
    [[cell textLabel] setText:[[MainDictionary sharedDictionary] getIngredient: indexPath.row]];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    PotionsAndIngredients *newView = [[PotionsAndIngredients alloc] init];
    //newView.delegate = self;
    newView.potionsArray = [[MainDictionary sharedDictionary] getArrayForKey:[[MainDictionary sharedDictionary] getIngredient: indexPath.row]];
    newView.currentIngredientString = [[MainDictionary sharedDictionary] getIngredient: indexPath.row];
    //newView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self.navigationController pushViewController:newView animated:YES];
    self.parentViewController.navigationItem.title = @"Ings";
    //[self presentViewController:newView animated:YES completion:NULL];
    
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    NSMutableArray *charactersForSort = [[NSMutableArray alloc] init];
    for (NSString *item in [[MainDictionary sharedDictionary] getIngredients])
    {
        if (![charactersForSort containsObject:[item substringToIndex:1]]) [charactersForSort addObject:[item substringToIndex:1]];
    }
    return charactersForSort;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    NSUInteger rowToScrollTo = 0;
    for (NSString *item in [[MainDictionary sharedDictionary] getIngredients])
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
