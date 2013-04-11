//
//  ViewController.m
//  Tarea1
//
//  Created by Robert Rodriguez on 01/04/13.
//  Copyright (c) 2013 Robert Rodriguez. All rights reserved.
//

#import "ViewController.h"
#import "NewViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize MyPassword, MyUsername;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)mybutton:(UIButton *)sender {
        
        if ([MyUsername.text isEqualToString:@"test"] &&
            [MyPassword.text isEqualToString:@"test"]) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Bienvenido"
                                                            message:[NSString stringWithFormat:@"Hola %@", MyUsername.text]
                                                           delegate:self
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil, nil];
            
            //Set user defaults
            [[NSUserDefaults standardUserDefaults] setObject:MyUsername.text forKey:@"username"];
            [[NSUserDefaults standardUserDefaults] setObject:MyPassword.text forKey:@"password"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            NSLog(@"username: %@", [[NSUserDefaults standardUserDefaults] objectForKey:@"username"]);
            NSLog(@"password: %@", [[NSUserDefaults standardUserDefaults] objectForKey:@"password"]);
            
            [alert show];
            //Instantiate blue controller
            NewViewController *blue = [self.storyboard instantiateViewControllerWithIdentifier:@"newController"];
            //perform transition
            [self presentViewController:blue animated:YES completion:nil];
        } else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alto" message:@"No estas registrado, verifica tus datos" delegate:self cancelButtonTitle:@"Adios" otherButtonTitles:nil, nil];
            [alert show];
        }
        
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if (textField==MyUsername) {
        [MyPassword becomeFirstResponder];
    } else if (textField == MyPassword) {
        
        if ([MyUsername.text isEqualToString:@"test"] &&
            [MyPassword.text isEqualToString:@"test"]) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Bienvenido"
                                                            message:[NSString stringWithFormat:@"Hola %@", MyUsername.text]
                                                           delegate:self
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil, nil];
            
            //Set user defaults
            [[NSUserDefaults standardUserDefaults] setObject:MyUsername.text forKey:@"username"];
            [[NSUserDefaults standardUserDefaults] setObject:MyPassword.text forKey:@"password"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            NSLog(@"username: %@", [[NSUserDefaults standardUserDefaults] objectForKey:@"username"]);
            NSLog(@"password: %@", [[NSUserDefaults standardUserDefaults] objectForKey:@"password"]);
            
            [alert show];
            //Instantiate blue controller
            NewViewController *blue = [self.storyboard instantiateViewControllerWithIdentifier:@"newController"];
            //perform transition
            [self presentViewController:blue animated:YES completion:nil];
        } else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alto" message:@"No estas registrado, verifica tus datos" delegate:self cancelButtonTitle:@"Adios" otherButtonTitles:nil, nil];
            [alert show];
        }
        
    }
    
    return true;
    
}

- (IBAction)dismissKeyboar:(id)sender{
    [MyUsername resignFirstResponder];
    [MyPassword resignFirstResponder];
}
    
@end

    
