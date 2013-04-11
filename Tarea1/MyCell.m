//
//  MyCell.m
//  Tarea1
//
//  Created by Robert Rodriguez on 01/04/13.
//  Copyright (c) 2013 Robert Rodriguez. All rights reserved.
//

#import "MyCell.h"
#import "ViewController.h"
#import "NewViewController.h"

@implementation MyCell

@synthesize myText,edit,myLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)edit:(id)sender {
    

    
}
@end
