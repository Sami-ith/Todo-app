//
//  ViewController.m
//  myTodo
//
//  Created by Samieh Sadeghi on 2020-01-22.
//  Copyright © 2020 Samieh Sadeghi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _editBarButtonItem.title=@"Edit";
    NSUserDefaults *todoList = [NSUserDefaults standardUserDefaults];
    //Two arrays for two categories
    incompleteTask=[todoList mutableArrayValueForKey:@"myList"];
    completeTask=[todoList mutableArrayValueForKey:@"myList2"];
    
    
    _tableView.delegate=self;
    _tableView.dataSource=self;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//Two sections for two categories
    return 2;
}
    
- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    if(section==1){
        return @"Complete";
    }else if(section==0){
        return @"Incomplete";
    }
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Set arrays length for number of rows in each section
    if(section==0){
    return [incompleteTask count];
    }
    else if (section==1){
        return [completeTask count];
    }
    return 1;
  }
 


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId=@"cellId";
    
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellId];
    
  //Set rows(cell) content based on section, completed task are green and have Checkmark style .
    
    if(cell==nil){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
        }
   
    if(indexPath.section==1){
        cell.textLabel.textColor=UIColor.greenColor;
        cell.textLabel.text=[completeTask objectAtIndex:indexPath.row];
        cell.accessoryType=UITableViewCellAccessoryCheckmark;
        cell.tintColor=UIColor.greenColor;
        
        
    }else if (indexPath.section==0){
        cell.accessoryType=UITableViewCellAccessoryNone;
        cell.textLabel.textColor=UIColor.blackColor;
        cell.textLabel.text=[incompleteTask objectAtIndex:indexPath.row ] ;
        //[cell.contentView addSubview:onoff];
        
        //
    }
    
    return cell;
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;

}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(editingStyle==UITableViewCellEditingStyleDelete){
        // Based on category(section) selected cell will delete from related array
        if(indexPath.section==0){
        [incompleteTask removeObjectAtIndex:indexPath.row];
        }else if(indexPath.section==1){
            [completeTask removeObjectAtIndex:indexPath.row];
        }
        [tableView deleteRowsAtIndexPaths:[NSMutableArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
      
    }
    
     
    
}

- (IBAction)editCell:(id)sender{
    //Switch between edit and done for UIBarButtonItem
   if([_editBarButtonItem.title isEqualToString:@"Edit"])
    {
     [_tableView setEditing:YES animated:YES];
       if (self.tableView.editing)
           [_editBarButtonItem setTitle:@"Done"];
            
        else
           [_editBarButtonItem setTitle:@"Edit"];
    }
    else if([_editBarButtonItem.title isEqualToString:@"Done"])
    {
         [_tableView setEditing:NO animated:NO];
        self.viewDidLoad;
}
}


- (void)viewDidAppear:(BOOL)animated{
    self.tableView.reloadData;
     [_tableView setEditing:NO animated:NO];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //By click on cell, user can change section  of cell (between complete and incomplete tasks)
   UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSUserDefaults *todoList = [NSUserDefaults standardUserDefaults];
    if(cell.textLabel.textColor==UIColor.greenColor){
        cell.textLabel.textColor=UIColor.blackColor;
        cell.accessoryType=UITableViewCellAccessoryNone;
        [incompleteTask addObject:cell.textLabel.text];
        [todoList setObject:incompleteTask forKey:@"myList"];
        [todoList synchronize];
        
        
        [completeTask removeObjectAtIndex:indexPath.row];
        [todoList setObject:completeTask forKey:@"myList2"];
        [todoList synchronize];
        
       }
    else{
        //set task to complete
        cell.textLabel.textColor=UIColor.greenColor;
        [completeTask addObject:cell.textLabel.text];
        cell.accessoryType=UITableViewCellAccessoryCheckmark;
        [todoList setObject:completeTask forKey:@"myList2"];
        [todoList synchronize];
       
        
        //delete selected task from incomplete tasks
        [incompleteTask removeObjectAtIndex:indexPath.row];
        [todoList setObject:incompleteTask forKey:@"myList"];
        [todoList synchronize];
        
    
       }
    self.tableView.reloadData;
}




@end
