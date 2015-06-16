//
//  ViewController.m
//  BrailleApp
//
//  Created by Ismael Salas Martos on 16/4/15.
//  Copyright (c) 2015 Ismael Salas Martos. All rights reserved.
//

#import "ViewController.h"

#import "CodificacionBraille.h"

#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>
#import <MessageUI/MFMessageComposeViewController.h>


@interface ViewController () <UITextFieldDelegate, UIGestureRecognizerDelegate, MFMessageComposeViewControllerDelegate>

// Declaración de propiedades de los valores de los botones y del tiempo de detección.

@property (nonatomic) NSNumber *valorBoton1;
@property (nonatomic) NSNumber *valorBoton2;
@property (nonatomic) NSNumber *valorBoton3;
@property (nonatomic) NSNumber *valorBoton4;
@property (nonatomic) NSNumber *valorBoton5;
@property (nonatomic) NSNumber *valorBoton6;

- (void) handleSwipe:(UISwipeGestureRecognizer *)recognizer;

@property (nonatomic, strong) NSString *frase;

@property (nonatomic, strong) AVSpeechSynthesizer *synthesizer;

@property (strong, nonatomic) NSTimer *tiempoDeteccion;

// Declaración contador Timer.

- (void) startTimer;

@end

// Definición del tiempo de detección.

#define TIMER_TIME 0.5 //10ms


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.(Acciones después de que se haya cargado la Vista)
    
    self.synthesizer = [[AVSpeechSynthesizer alloc] init];
    
    self.frase=@"";
    
    
    // Resetear el estado de los Botones: todos a NO.
    
     [self resetButtonStates];
    
    self.mensajeTextField.delegate = self;
    
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(hideKeyBoard)];
    
    [self.view addGestureRecognizer:tapGesture];

    UISwipeGestureRecognizer * swipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeRecognizer.numberOfTouchesRequired = 2;
    swipeRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    swipeRecognizer.delegate = self;
    [self.view addGestureRecognizer:swipeRecognizer];
}

- (void)hideKeyBoard {
        [_mensajeTextField resignFirstResponder];
    }

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.mensajeTextField resignFirstResponder];
    return YES;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

// Función contador Timer (detecta que botones se han pulsado dentro del tiempo de detección).

- (void) startTimer {
    self.tiempoDeteccion = [NSTimer scheduledTimerWithTimeInterval:TIMER_TIME target:self selector:@selector(checkButton) userInfo:nil repeats:NO];

    //Función para no bloquear el contador Timer.
    
    [[NSRunLoop currentRunLoop] addTimer:self.tiempoDeteccion forMode:NSRunLoopCommonModes];
}

// Función que comprueba el estado de los botones y devuelve el valor (comprueba que botones se pulsan).

- (void) checkButton {

    CodificacionBraille *codificacionBraile = [[CodificacionBraille alloc] init];
    NSString *value = [codificacionBraile letraConCodificacion:@[self.valorBoton1,self.valorBoton2,self.valorBoton3,self.valorBoton4,self.valorBoton5,self.valorBoton6] usarDictionary:@"dictMinusuculas"];

    NSLog(@"Respuesta: %@",value);
    
    if (value==@"∞") {
        if ([self.frase length] > 0) {
            self.frase = [self.frase substringToIndex:[self.frase length] - 1];
        } else {
            //no characters to delete... attempting to do so will result in a crash
        }
    } else if (value==@"#"){
        self.frase = @"";
    }
    else{
        self.frase = [self.frase stringByAppendingString:value];
    }
    
    NSLog(@"Frase: %@",self.frase);
    
    
    self.mensajeTextField.text = self.frase;
    

    
    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:self.frase];
    utterance.rate = AVSpeechUtteranceMinimumSpeechRate;
    
    AVSpeechSynthesisVoice *synthesizer_voice_fr = [AVSpeechSynthesisVoice voiceWithLanguage:@"fr-FR"];
    AVSpeechSynthesisVoice *synthesizer_voice_en = [AVSpeechSynthesisVoice voiceWithLanguage:@"en-US"];
    AVSpeechSynthesisVoice *synthesizer_voice_es = [AVSpeechSynthesisVoice voiceWithLanguage:@"es-ES"];
    
    utterance.voice = synthesizer_voice_es;
    
    [self.synthesizer speakUtterance:utterance];
    
    //[self sendSMS:self.frase recipientList:[NSArray arrayWithObjects: nil]];
    
    [self resetButtonStates];
}

// Función para resetear todos los botones a NO.

- (void) resetButtonStates {
   
    self.valorBoton1 = @NO;
    self.valorBoton2 = @NO;
    self.valorBoton3 = @NO;
    self.valorBoton4 = @NO;
    self.valorBoton5 = @NO;
    self.valorBoton6 = @NO;
}

// Conexiones de los botones con la acción de presionar botón (pone el valor del botón a YES cuando se presiona dentro del tiempo de detección)

- (IBAction)boton1Presionado:(id)sender
{
    NSLog(@"He presionado el botón 1");
    self.valorBoton1=@YES;
    if(!self.tiempoDeteccion.valid) [self startTimer];
    
}


- (IBAction)boton2Presionado:(id)sender
{
    self.valorBoton2 = @YES;
    NSLog(@"He presionado el botón 2");
    if(!self.tiempoDeteccion.valid) [self startTimer];
    
}


- (IBAction)boton3Presionado:(id)sender
{
    self.valorBoton3 = @YES;
    NSLog(@"He presionado el botón 3");
    if(!self.tiempoDeteccion.valid) [self startTimer];
    
}


- (IBAction)boton4Presionado:(id)sender
{
    self.valorBoton4 = @YES;
    NSLog(@"He presionado el botón 4");
    if(!self.tiempoDeteccion.valid) [self startTimer];
    
}


- (IBAction)boton5Presionado:(id)sender
{
    self.valorBoton5 = @YES;
    NSLog(@"He presionado el botón 5");
    if(!self.tiempoDeteccion.valid) [self startTimer];
    
}


- (IBAction)boton6Presionado:(id)sender
{
    self.valorBoton6 = @YES;
    NSLog(@"He presionado el botón 6");
    if(!self.tiempoDeteccion.valid) [self startTimer];
    
}

- (void)sendSMS:(NSString *)bodyOfMessage recipientList:(NSArray *)recipients
{
  MFMessageComposeViewController *controller = [[MFMessageComposeViewController alloc] init];
  if([MFMessageComposeViewController canSendText])
  {
    controller.body = bodyOfMessage;    
    controller.recipients = recipients;
    controller.messageComposeDelegate = self;
    [self presentViewController:controller animated:YES completion:nil];
  }    
}

- (void)handleSwipe:(UISwipeGestureRecognizer *)recognizer{
    [self performSegueWithIdentifier:@"show_compartir" sender:self];
}

@end









    
