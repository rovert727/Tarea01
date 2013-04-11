//
//  ViewController.h
//  Tarea1
//
//  Created by Robert Rodriguez on 01/04/13.
//  Copyright (c) 2013 Robert Rodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *MyUsername;
@property (weak, nonatomic) IBOutlet UITextField *MyPassword;

- (IBAction)mybutton:(id)sender;
@end
