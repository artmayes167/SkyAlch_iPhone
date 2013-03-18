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


#define POISONS_DEFAULT_KEY @"poisons"
#define POTIONS_DEFAULT_KEY @"potions"
#define MAGICKA_DEFAULT_KEY @"magicka"
-(NSArray *)potionsArray{
    if (!_potionsArray) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        if (![defaults boolForKey:POISONS_DEFAULT_KEY]) {
            if (![defaults boolForKey:MAGICKA_DEFAULT_KEY]) {
                _potionsArray = (NSArray *)[[MainDictionary sharedDictionary]getPotionsWithoutPoisonsOrMagicka];
            } else _potionsArray = (NSArray *)[[MainDictionary sharedDictionary]getPotionsWithoutPoisons];
            return _potionsArray;
        } else if (![defaults boolForKey:POTIONS_DEFAULT_KEY]){
            _potionsArray = (NSArray *)[[MainDictionary sharedDictionary]getPoisonsWithoutPotions];
        } else _potionsArray = (NSArray *)[[MainDictionary sharedDictionary] getPotions];
    }
    NSLog(@"%@", _potionsArray);
    return _potionsArray;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.parentViewController.navigationItem.title = @"Potions";
    self.potionsArray = nil;
    [self.tableView reloadData];
    NSLog(@"%@", self.potionsArray);
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{return 1;}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{return  [self.potionsArray count];}

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
    
    [[cell textLabel] setText:self.potionsArray[indexPath.row]];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
        IngredientsForPotion *newView = [[IngredientsForPotion alloc] init];
    //newView.delegate = self;
    newView.ingredientsArray = [[MainDictionary sharedDictionary] getIngredientsForPotion:self.potionsArray[indexPath.row]];
    newView.currentPotionString = self.potionsArray[indexPath.row];
    //newView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self.navigationController pushViewController:newView animated:YES];
    //[self presentViewController:newView animated:YES completion:NULL];
    
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
