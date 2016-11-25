//
//  MVViewController.m
//  MVMaterialToggleButton
//
//  Created by Mrugrajsinh Vansadia on 11/25/2016.
//  Copyright (c) 2016 Mrugrajsinh Vansadia. All rights reserved.
//

#import "MVViewController.h"
#import <MVMaterialToggleButton/MVMaterialToggleButton-umbrella.h>
@interface MVViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblStatus;

@end

@implementation MVViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)btnToggleAction:(MVMaterialToggleButton *)sender {
    if(sender.selected){
        _lblStatus.text = @"SELECTED";
    }else{
        _lblStatus.text = @"NOT SELECTED";
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
