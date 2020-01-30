//
//  ViewController.h
//  myTodo
//
//  Created by Samieh Sadeghi on 2020-01-22.
//  Copyright © 2020 Samieh Sadeghi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController:UIViewController<UITableViewDataSource,UITableViewDelegate>
{
//Two arrays represent two categories(sections).
NSMutableArray *incompleteTask;
NSMutableArray *completeTask;
}
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editBarButtonItem;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *addBarButtonItem;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)editCell:(id)sender;


@end

