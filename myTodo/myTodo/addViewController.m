//
//  addViewController.m
//  myTodo
//
//  Created by Samieh Sadeghi on 2020-01-22.
//  Copyright © 2020 Samieh Sadeghi. All rights reserved.
//

#import "addViewController.h"

@interface addViewController ()

@end

@implementation addViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
   [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
   // or @"yyyy-MM-dd hh:mm:ss a" if you prefer the time with AM/PM
  // NSLog(@"%@",[dateFormatter stringFromDate:[NSDate date]]);
    NSString *s=[dateFormatter stringFromDate:[NSDate date]];
    
    NSUserDefaults *todoList = [NSUserDefaults standardUserDefaults];
    incompleteTask=[todoList mutableArrayValueForKey:@"myList"];
    _btnDone.enabled=NO;
    
   
}

- (IBAction)addNewItem:(id)sender {
     //User can add new task, the task save in NSUserDefaults
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
     [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
     
    // NSLog(@"%@",[dateFormatter stringFromDate:[NSDate date]]);
    NSString *s=[NSString stringWithFormat:@"%@%@%@%@",_item.text,@" [",[dateFormatter stringFromDate:[NSDate date]],@" ]"];
    
    
    [incompleteTask addObject:(s)];
    NSUserDefaults *todoList = [NSUserDefaults standardUserDefaults];
    [todoList setObject:incompleteTask forKey:@"myList"];
    [todoList synchronize];
    //Show insert message.
    NSString *message=[NSString stringWithFormat:@"%@%@",_item.text,@" was inserted"];
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"Message" message: message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * action = [UIAlertAction actionWithTitle: @ "OK"
                               style: UIAlertActionStyleDefault handler: ^ (UIAlertAction * _Nonnull action) {
                    
                               }
                              ];
     [alert addAction: action];
    [self presentViewController: alert animated: true completion: nil];
    
    _item.text=nil;
    _btnDone.enabled=NO;
    
    
}

- (IBAction)textChange:(id)sender {
    //Based on input text(it should not be empty) Done button will be enable or disable
    if(_item.text.length>0){
        _btnDone.enabled=YES;
    }else if (_item.text.length==0){
        _btnDone.enabled=NO;
    }
}


@end
