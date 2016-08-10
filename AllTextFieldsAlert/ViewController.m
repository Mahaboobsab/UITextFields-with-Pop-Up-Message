//
//  ViewController.m
//  AllTextFieldsAlert
//
//  Created by test on 01/08/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"
#define REGEX_USER_NAME_LIMIT @"^.{3,10}$"
#define REGEX_USER_NAME @"[A-Za-z0-9]{3,10}"
#define REGEX_EMAIL @"[A-Z0-9a-z._%+-]{3,}+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
#define REGEX_PASSWORD_LIMIT @"^.{6,20}$"
#define REGEX_PASSWORD @"[A-Za-z0-9]{6,20}"
#define REGEX_PHONE_DEFAULT @"[0-9]{3}\\-[0-9]{3}\\-[0-9]{4}"
@interface ViewController ()

- (IBAction)click:(id)sender;

@end

@implementation ViewController{

    TextFieldValidator *txtDemo;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupAlerts];
    txtDemo=[[TextFieldValidator alloc] initWithFrame:CGRectMake(20, 200, 280, 30)];
    txtDemo.borderStyle=UITextBorderStyleRoundedRect;
    txtDemo.placeholder=@"Programmatically created - Email";
    txtDemo.delegate=self;
    txtDemo.presentInView=self.view;
    [self.viewContainer addSubview:txtDemo];
    [txtDemo addRegx:REGEX_EMAIL withMsg:@"Enter valid email."];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)click:(id)sender {
    

    
    if([self.txtUserName validate] & [self.txtEmail validate] &   [self.txtPhone validate] &[txtDemo validate]){
//        secondViewController=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SecondViewController"];
//        [self.navigationController pushViewController:secondViewController animated:YES];
    }

    
}

-(void)setupAlerts{
    [self.txtUserName addRegx:REGEX_USER_NAME_LIMIT withMsg:@"User name charaters limit should be come between 3-10"];
    [self.txtUserName addRegx:REGEX_USER_NAME withMsg:@"Only alpha numeric characters are allowed."];
    //self.txtUserName.validateOnResign=NO;
    self.txtUserName.validateOnResign=YES;
    [self.txtEmail addRegx:REGEX_EMAIL withMsg:@"Enter valid email."];
    self.txtEmail.validateOnResign=YES;
    
    
    [self.txtPhone addRegx:REGEX_PASSWORD_LIMIT withMsg:@"Pass within 6 to 30"];
    //self.txtPhone.isMandatory=NO;
    
    self.txtPhone.isMandatory=YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    if([self.txtUserName validate] & [self.txtEmail validate] &   [self.txtPhone validate] ){
    
        return YES;
    }
    else{
    
        NSLog(@"Failed to Validate");
    }
    
    return YES;
}
@end
