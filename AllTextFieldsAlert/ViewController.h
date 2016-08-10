//
//  ViewController.h
//  AllTextFieldsAlert
//
//  Created by test on 01/08/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TextFieldValidator.h"
@interface ViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet TextFieldValidator *txtUserName;
@property (weak, nonatomic) IBOutlet TextFieldValidator *txtEmail;
@property (weak, nonatomic) IBOutlet TextFieldValidator *txtPhone;

@property (strong, nonatomic) IBOutlet UIView *viewContainer;


@end

