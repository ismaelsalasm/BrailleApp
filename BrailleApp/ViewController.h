//
//  ViewController.h
//  BrailleApp
//
//  Created by Ismael Salas Martos on 16/4/15.
//  Copyright (c) 2015 Ismael Salas Martos. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>


{
    UIImageView *_button1;
    BOOL _tocaButton1;
}

@property(nonatomic, retain) IBOutlet UIImageView *button1;
@property(nonatomic) BOOL tocaButton1;

@property (strong, nonatomic) IBOutlet UITextField *mensajeTextField;

@property (strong, nonatomic) IBOutlet UIButton *boton1;
@property (strong, nonatomic) IBOutlet UIButton *boton2;
@property (strong, nonatomic) IBOutlet UIButton *boton3;
@property (strong, nonatomic) IBOutlet UIButton *boton4;
@property (strong, nonatomic) IBOutlet UIButton *boton5;
@property (strong, nonatomic) IBOutlet UIButton *boton6;

@property (nonatomic, strong) NSString *frase;
@property (nonatomic, strong) AVSpeechSynthesizer *synthesizer;


/*- (IBAction)boton1Presionado:(id)sender;
- (IBAction)boton2Presionado:(id)sender;
- (IBAction)boton3Presionado:(id)sender;
- (IBAction)boton4Presionado:(id)sender;
- (IBAction)boton5Presionado:(id)sender;
- (IBAction)boton6Presionado:(id)sender;*/


@end



