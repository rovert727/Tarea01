//
//  NewViewController.m
//  Tarea1
//
//  Created by Robert Rodriguez on 01/04/13.
//  Copyright (c) 2013 Robert Rodriguez. All rights reserved.
//

#import "NewViewController.h"
#import "ViewController.h"
#import "MyCell.h"

@interface NewViewController ()

@end

@implementation NewViewController

@synthesize myTableView,text,name,contact,message,dec,imagen,myX;
NSString *name1 = @"Mensaje para Robert";NSString *name2 = @"Mensaje para Caro";NSString *name3 = @"Mensaje para Jorge";
NSString *text1 = @"robert";NSString *text2 = @"Caro";NSString *text3 = @"Jorge";
int selected=0;
int change=0;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    name = [NSMutableArray new];
    [name addObject:name1];
    [name addObject:name2];
    [name addObject:name3];
    
    text = [NSMutableArray new];
    [text addObject:text1];
    [text addObject:text2];
    [text addObject:text3];
    
    imagen = [NSMutableArray new];
    UIImage *Image1= [UIImage imageNamed:@"1.jpeg"];
    [imagen addObject:Image1];
    UIImage *Image2= [UIImage imageNamed:@"2.jpeg"];
    [imagen addObject:Image2];
    UIImage *Image3= [UIImage imageNamed:@"3.jpeg"];
    [imagen addObject:Image3];

    [contact setText:[text objectAtIndex:selected]];
    [message setText:[name objectAtIndex:selected]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Back:(UIButton *)sender {
        
        ViewController *home = [self.storyboard instantiateViewControllerWithIdentifier:@"homeController"];
        [self presentViewController:home animated:YES completion:nil];
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
    
    if(indexPath.row == change )
    {
        [tableView
         selectRowAtIndexPath:indexPath
         animated:TRUE
         scrollPosition:UITableViewScrollPositionNone
         ];
        
        [[tableView delegate]
         tableView:tableView
         didSelectRowAtIndexPath:indexPath
         ];
        
    }
    
    cell.myLabel.text = [text objectAtIndex:indexPath.row];
    cell.myImage.image = [imagen objectAtIndex:indexPath.row];
    cell.myText.text = [name objectAtIndex:indexPath.row];
    
    return cell;
    }

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CGSize maxSize = CGSizeMake(150, 150);
    CGSize cellSize = [[name objectAtIndex:indexPath.row]
                       sizeWithFont:[UIFont systemFontOfSize:15]
                       constrainedToSize:maxSize
                       lineBreakMode:NSLineBreakByWordWrapping];
    return cellSize.height+40;
}
    
- (IBAction)done:(id)sender {
    [contact resignFirstResponder];
    [message resignFirstResponder];
    switch (selected) {
        case 0:
            text1 = contact.text;
            name1 = message.text;
            break;
        case 1:
            text2 = contact.text;
            name2 = message.text;
            break;
        case 2:
            text3 = contact.text;
            name3 = message.text;
            break;
        default:
            break;
    }
    NewViewController *login = [[NewViewController alloc] init];
    if([contact.text isEqualToString:@""] || [message.text isEqualToString:@""]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alto" message:@"Un campo o ambos estan vacios, favor de llenar para nombre y mensaje" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];

    }
    else {
        login = [self.storyboard instantiateViewControllerWithIdentifier:@"newController"];
        login.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        [self presentViewController:login animated:YES completion:nil];

    }
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}


// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 3;
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [text objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    NSLog(@"Selected Color: %@. Index of selected color: %i", [text objectAtIndex:row], row);
    selected= row;
    [contact setText:[text objectAtIndex:selected]];
    [message setText:[name objectAtIndex:selected]];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"cambio");
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    self.view.backgroundColor = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    
    myX.selectedSegmentIndex = indexPath.row;
    
}
    
- (IBAction)X:(id)sender {
    change = myX.selectedSegmentIndex;
    [myTableView reloadData];
}
@end
