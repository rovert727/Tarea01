//
//  NewViewController.h
//  Tarea1
//
//  Created by Robert Rodriguez on 01/04/13.
//  Copyright (c) 2013 Robert Rodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewViewController : UIViewController
- (IBAction)Back:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (strong,nonatomic) NSMutableArray *name,*text,*imagen;
@property (strong, nonatomic) IBOutlet UITextField *contact;
@property (strong, nonatomic) IBOutlet UITextView *message;

- (IBAction)done:(id)sender;

@property (strong, nonatomic) IBOutlet UIPickerView *dec;
@property (strong, nonatomic) IBOutlet UISegmentedControl *myX;
- (IBAction)X:(id)sender;

@end
