//
//  CompartirViewController.h
//  BrailleApp
//
//  Created by Ismael Salas Martos on 16/6/15.
//  Copyright (c) 2015 Ismael Salas Martos. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "ViewController.h"

@interface CompartirViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) NSString *frase;
@property (nonatomic,strong) ViewController *parent;
@property (strong, nonatomic) IBOutlet UITextView *fraseTextField;
@property (strong, nonatomic) IBOutlet UITextField *mensajeTextField;

@property (strong, nonatomic) IBOutlet UIButton *botonBORRAR;
@property (strong, nonatomic) IBOutlet UIButton *botonVOLVERALTECLADO;
@property (strong, nonatomic) IBOutlet UIButton *botonCOPIARENPORTAPAPELES;
@property (strong, nonatomic) IBOutlet UIButton *botonENVIARSMS;
@property (strong, nonatomic) IBOutlet UIButton *botonENVIARCORREO;
@property (strong, nonatomic) IBOutlet UIButton *botonCOMPARTIRENFACEBOOK;

@end
