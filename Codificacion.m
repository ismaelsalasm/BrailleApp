//
//  Codificacion.m
//  
//
//  Created by Ismael Salas Martos on 16/4/15.
//
//

#import "Codificacion.h"

#define BOTON_ACTIVO @"1"
#define BOTON_NO_ACTIVO @"0"

@interface Codificacion()

@property (nonatomic, strong) NSDictionary *dict;

@end

@implementation Codificacion

- (NSDictionary *)dict
{
    if (!_dict) {
        _dict = @{@"100000" : @"a",
                  @"110000" : @"b"
                  };
    }
    return _dict;
}

//- (Codificacion *)init
//{
//    self = [super init];
//    return self;
//}


- (NSString*)letraConCodificacion:(NSArray *)Codificacion
{
    
    NSString *key = @"";
    for (int i = 0; i< Codificacion.count ; i++) {
        BOOL active = (BOOL) Codificacion[i];
        if (active){
            //YES
            [key stringByAppendingString:BOTON_ACTIVO];
        } else {
            //NO
            [key stringByAppendingString:BOTON_NO_ACTIVO];
        }
    }
    
    return self.dict[key];
    
/*    if (Codificacion[boton1]=1 && Codificacion[boton2]=0 && Codificacion[boton3]=0 && Codificacion[boton4]=0 && Codificacion[boton5]=0 && Codificacion[boton6]=0) {
        return @"a";
    }
    
    if (Codificacion[boton1]=1 && Codificacion[boton2]=1 && Codificacion[boton3]=0 && Codificacion[boton4]=0 && Codificacion[boton5]=0 && Codificacion[boton6]=0) {
        return @"b";
    }
    
    if (Codificacion[boton1]=1 && Codificacion[boton2]=0 && Codificacion[boton3]=0 && Codificacion[boton4]=1 && Codificacion[boton5]=0 && Codificacion[boton6]=0) {
        return @"c";
    }
    
    if (Codificacion[boton1]=1 && Codificacion[boton2]=0 && Codificacion[boton3]=0 && Codificacion[boton4]=1 && Codificacion[boton5]=1 && Codificacion[boton6]=0) {
        return @"d";
    }
    
    if (Codificacion[boton1]=1 && Codificacion[boton2]=0 && Codificacion[boton3]=0 && Codificacion[boton4]=0 && Codificacion[boton5]=1 && Codificacion[boton6]=0) {
        return @"e";
    }
    
    if (Codificacion[boton1]=1 && Codificacion[boton2]=1 && Codificacion[boton3]=0 && Codificacion[boton4]=1 && Codificacion[boton5]=0 && Codificacion[boton6]=0) {
        return @"f";
    }
    
    if (Codificacion[boton1]=1 && Codificacion[boton2]=1 && Codificacion[boton3]=0 && Codificacion[boton4]=1 && Codificacion[boton5]=1 && Codificacion[boton6]=0) {
        return @"g";
    }
    
    if (Codificacion[boton1]=1 && Codificacion[boton2]=1 && Codificacion[boton3]=0 && Codificacion[boton4]=0 && Codificacion[boton5]=1 && Codificacion[boton6]=0) {
        return @"h";
    }
    
    if (Codificacion[boton1]=0 && Codificacion[boton2]=1 && Codificacion[boton3]=0 && Codificacion[boton4]=1 && Codificacion[boton5]=0 && Codificacion[boton6]=0) {
        return @"i";
    }
    
    if (Codificacion[boton1]=0 && Codificacion[boton2]=1 && Codificacion[boton3]=0 && Codificacion[boton4]=1 && Codificacion[boton5]=1 && Codificacion[boton6]=0) {
        return @"j";
    }
    
    if (Codificacion[boton1]=1 && Codificacion[boton2]=0 && Codificacion[boton3]=1 && Codificacion[boton4]=0 && Codificacion[boton5]=0 && Codificacion[boton6]=0) {
        return @"k";
    }
    
    if (Codificacion[boton1]=1 && Codificacion[boton2]=1 && Codificacion[boton3]=1 && Codificacion[boton4]=0 && Codificacion[boton5]=0 && Codificacion[boton6]=0) {
        return @"l";
    }
    
    if (Codificacion[boton1]=1 && Codificacion[boton2]=0 && Codificacion[boton3]=1 && Codificacion[boton4]=1 && Codificacion[boton5]=1 && Codificacion[boton6]=0) {
        return @"m";
    }
    
    if (Codificacion[boton1]=1 && Codificacion[boton2]=0 && Codificacion[boton3]=1 && Codificacion[boton4]=1 && Codificacion[boton5]=0 && Codificacion[boton6]=0) {
        return @"n";
    }
    
    if (Codificacion[boton1]=1 && Codificacion[boton2]=0 && Codificacion[boton3]=1 && Codificacion[boton4]=0 && Codificacion[boton5]=1 && Codificacion[boton6]=0) {
        return @"o";
    }
    
    if (Codificacion[boton1]=1 && Codificacion[boton2]=1 && Codificacion[boton3]=1 && Codificacion[boton4]=1 && Codificacion[boton5]=0 && Codificacion[boton6]=0) {
        return @"p";
    }
    
    if (Codificacion[boton1]=1 && Codificacion[boton2]=1 && Codificacion[boton3]=1 && Codificacion[boton4]=1 && Codificacion[boton5]=1 && Codificacion[boton6]=0) {
        return @"q";
    }
    
    if (Codificacion[boton1]=1 && Codificacion[boton2]=1 && Codificacion[boton3]=1 && Codificacion[boton4]=0 && Codificacion[boton5]=1 && Codificacion[boton6]=0) {
        return @"r";
    }
    
    if (Codificacion[boton1]=0 && Codificacion[boton2]=1 && Codificacion[boton3]=1 && Codificacion[boton4]=1 && Codificacion[boton5]=0 && Codificacion[boton6]=0) {
        return @"s";
    }
    
    if (Codificacion[boton1]=0 && Codificacion[boton2]=1 && Codificacion[boton3]=1 && Codificacion[boton4]=1 && Codificacion[boton5]=1 && Codificacion[boton6]=0) {
        return @"t";
    }
    
    if (Codificacion[boton1]=1 && Codificacion[boton2]=0 && Codificacion[boton3]=1 && Codificacion[boton4]=0 && Codificacion[boton5]=0 && Codificacion[boton6]=1) {
        return @"u";
    }
    
    if (Codificacion[boton1]=1 && Codificacion[boton2]=1 && Codificacion[boton3]=1 && Codificacion[boton4]=0 && Codificacion[boton5]=0 && Codificacion[boton6]=1) {
        return @"v";
    }
    
    if (Codificacion[boton1]=1 && Codificacion[boton2]=0 && Codificacion[boton3]=1 && Codificacion[boton4]=1 && Codificacion[boton5]=0 && Codificacion[boton6]=1) {
        return @"x";
    }
    
    if (Codificacion[boton1]=1 && Codificacion[boton2]=0 && Codificacion[boton3]=1 && Codificacion[boton4]=1 && Codificacion[boton5]=1 && Codificacion[boton6]=1) {
        return @"y";
    }
    
    if (Codificacion[boton1]=1 && Codificacion[boton2]=0 && Codificacion[boton3]=1 && Codificacion[boton4]=0 && Codificacion[boton5]=1 && Codificacion[boton6]=1) {
        return @"z";
    }
    
    if (Codificacion[boton1]=0 && Codificacion[boton2]=0 && Codificacion[boton3]=0 && Codificacion[boton4]=0 && Codificacion[boton5]=0 && Codificacion[boton6]=0) {
        return @"";
    }
    
    if (Codificacion[boton1]=0 && Codificacion[boton2]=0 && Codificacion[boton3]=0 && Codificacion[boton4]=0 && Codificacion[boton5]=0 && Codificacion[boton6]=0) {
        return @"";
    }
 
    if (Codificacion[boton1]=0 && Codificacion[boton2]=0 && Codificacion[boton3]=0 && Codificacion[boton4]=0 && Codificacion[boton5]=0 && Codificacion[boton6]=0) {
        return @"";
    }
 
    if (Codificacion[boton1]=0 && Codificacion[boton2]=0 && Codificacion[boton3]=0 && Codificacion[boton4]=0 && Codificacion[boton5]=0 && Codificacion[boton6]=0) {
        return @"";
    }
 
    if (Codificacion[boton1]=0 && Codificacion[boton2]=0 && Codificacion[boton3]=0 && Codificacion[boton4]=0 && Codificacion[boton5]=0 && Codificacion[boton6]=0) {
        return @"";
    }
 
    if (Codificacion[boton1]=0 && Codificacion[boton2]=0 && Codificacion[boton3]=0 && Codificacion[boton4]=0 && Codificacion[boton5]=0 && Codificacion[boton6]=0) {
        return @"";
    }
 
    if (Codificacion[boton1]=0 && Codificacion[boton2]=0 && Codificacion[boton3]=0 && Codificacion[boton4]=0 && Codificacion[boton5]=0 && Codificacion[boton6]=0) {
        return @"";
    }
 
    if (Codificacion[boton1]=0 && Codificacion[boton2]=0 && Codificacion[boton3]=0 && Codificacion[boton4]=0 && Codificacion[boton5]=0 && Codificacion[boton6]=0) {
        return @"";
    }
 
    if (Codificacion[boton1]=0 && Codificacion[boton2]=0 && Codificacion[boton3]=0 && Codificacion[boton4]=0 && Codificacion[boton5]=0 && Codificacion[boton6]=0) {
        return @"";
    }
 
    if (Codificacion[boton1]=0 && Codificacion[boton2]=0 && Codificacion[boton3]=0 && Codificacion[boton4]=0 && Codificacion[boton5]=0 && Codificacion[boton6]=0) {
        return @"";
    }
 
    if (Codificacion[boton1]=0 && Codificacion[boton2]=0 && Codificacion[boton3]=0 && Codificacion[boton4]=0 && Codificacion[boton5]=0 && Codificacion[boton6]=0) {
        return @"";
    }
 
    if (Codificacion[boton1]=0 && Codificacion[boton2]=0 && Codificacion[boton3]=0 && Codificacion[boton4]=0 && Codificacion[boton5]=0 && Codificacion[boton6]=0) {
        return @"";
    }
 
    if (Codificacion[boton1]=0 && Codificacion[boton2]=0 && Codificacion[boton3]=0 && Codificacion[boton4]=0 && Codificacion[boton5]=0 && Codificacion[boton6]=0) {
        return @"";
    }
 
    if (Codificacion[boton1]=0 && Codificacion[boton2]=0 && Codificacion[boton3]=0 && Codificacion[boton4]=0 && Codificacion[boton5]=0 && Codificacion[boton6]=0) {
        return @"";
    }
 
    if (Codificacion[boton1]=0 && Codificacion[boton2]=0 && Codificacion[boton3]=0 && Codificacion[boton4]=0 && Codificacion[boton5]=0 && Codificacion[boton6]=0) {
        return @"";
    }
 
    if (Codificacion[boton1]=0 && Codificacion[boton2]=0 && Codificacion[boton3]=0 && Codificacion[boton4]=0 && Codificacion[boton5]=0 && Codificacion[boton6]=0) {
        return @"";
    }
 
    if (Codificacion[boton1]=0 && Codificacion[boton2]=0 && Codificacion[boton3]=0 && Codificacion[boton4]=0 && Codificacion[boton5]=0 && Codificacion[boton6]=0) {
        return @"";
    }
 
    if (Codificacion[boton1]=0 && Codificacion[boton2]=0 && Codificacion[boton3]=0 && Codificacion[boton4]=0 && Codificacion[boton5]=0 && Codificacion[boton6]=0) {
        return @"";
    }
 
    if (Codificacion[boton1]=0 && Codificacion[boton2]=0 && Codificacion[boton3]=0 && Codificacion[boton4]=0 && Codificacion[boton5]=0 && Codificacion[boton6]=0) {
        return @"";
    }
 
    if (Codificacion[boton1]=0 && Codificacion[boton2]=0 && Codificacion[boton3]=0 && Codificacion[boton4]=0 && Codificacion[boton5]=0 && Codificacion[boton6]=0) {
        return @"";
    }
 
    if (Codificacion[boton1]=0 && Codificacion[boton2]=0 && Codificacion[boton3]=0 && Codificacion[boton4]=0 && Codificacion[boton5]=0 && Codificacion[boton6]=0) {
        return @"";
    }
 
    if (Codificacion[boton1]=0 && Codificacion[boton2]=0 && Codificacion[boton3]=0 && Codificacion[boton4]=0 && Codificacion[boton5]=0 && Codificacion[boton6]=0) {
        return @"";
    }
 
    if (Codificacion[boton1]=0 && Codificacion[boton2]=0 && Codificacion[boton3]=0 && Codificacion[boton4]=0 && Codificacion[boton5]=0 && Codificacion[boton6]=0) {
        return @"";
    }
 
    if (Codificacion[boton1]=0 && Codificacion[boton2]=0 && Codificacion[boton3]=0 && Codificacion[boton4]=0 && Codificacion[boton5]=0 && Codificacion[boton6]=0) {
        return @"";
    }
 
    if (Codificacion[boton1]=0 && Codificacion[boton2]=0 && Codificacion[boton3]=0 && Codificacion[boton4]=0 && Codificacion[boton5]=0 && Codificacion[boton6]=0) {
        return @"";
    }
 
    if (Codificacion[boton1]=0 && Codificacion[boton2]=0 && Codificacion[boton3]=0 && Codificacion[boton4]=0 && Codificacion[boton5]=0 && Codificacion[boton6]=0) {
        return @"";
    }
 
    if (Codificacion[boton1]=0 && Codificacion[boton2]=0 && Codificacion[boton3]=0 && Codificacion[boton4]=0 && Codificacion[boton5]=0 && Codificacion[boton6]=0) {
        return @"";
    }
 
    if (Codificacion[boton1]=0 && Codificacion[boton2]=0 && Codificacion[boton3]=0 && Codificacion[boton4]=0 && Codificacion[boton5]=0 && Codificacion[boton6]=0) {
        return @"";
    }
 
    if (Codificacion[boton1]=0 && Codificacion[boton2]=0 && Codificacion[boton3]=0 && Codificacion[boton4]=0 && Codificacion[boton5]=0 && Codificacion[boton6]=0) {
        return @"";
    }
 
    if (Codificacion[boton1]=0 && Codificacion[boton2]=0 && Codificacion[boton3]=0 && Codificacion[boton4]=0 && Codificacion[boton5]=0 && Codificacion[boton6]=0) {
        return @"";
    }
 
    if (Codificacion[boton1]=0 && Codificacion[boton2]=0 && Codificacion[boton3]=0 && Codificacion[boton4]=0 && Codificacion[boton5]=0 && Codificacion[boton6]=0) {
        return @"";
    }
 
    if (Codificacion[boton1]=0 && Codificacion[boton2]=0 && Codificacion[boton3]=0 && Codificacion[boton4]=0 && Codificacion[boton5]=0 && Codificacion[boton6]=0) {
        return @"";
    }
 
    if (Codificacion[boton1]=0 && Codificacion[boton2]=0 && Codificacion[boton3]=0 && Codificacion[boton4]=0 && Codificacion[boton5]=0 && Codificacion[boton6]=0) {
        return @"";
    }
 
    if (Codificacion[boton1]=0 && Codificacion[boton2]=0 && Codificacion[boton3]=0 && Codificacion[boton4]=0 && Codificacion[boton5]=0 && Codificacion[boton6]=0) {
        return @"";
    }
 
    if (Codificacion[boton1]=0 && Codificacion[boton2]=0 && Codificacion[boton3]=0 && Codificacion[boton4]=0 && Codificacion[boton5]=0 && Codificacion[boton6]=0) {
        return @"";
    }
 
    if (Codificacion[boton1]=0 && Codificacion[boton2]=0 && Codificacion[boton3]=0 && Codificacion[boton4]=0 && Codificacion[boton5]=0 && Codificacion[boton6]=0) {
        return @"";
    }
 
    if (Codificacion[boton1]=0 && Codificacion[boton2]=0 && Codificacion[boton3]=0 && Codificacion[boton4]=0 && Codificacion[boton5]=0 && Codificacion[boton6]=0) {
        return @"";
    }
 
    if (Codificacion[boton1]=0 && Codificacion[boton2]=0 && Codificacion[boton3]=0 && Codificacion[boton4]=0 && Codificacion[boton5]=0 && Codificacion[boton6]=0) {
        return @"";
    }
 
    if (Codificacion[boton1]=0 && Codificacion[boton2]=0 && Codificacion[boton3]=0 && Codificacion[boton4]=0 && Codificacion[boton5]=0 && Codificacion[boton6]=0) {
        return @"";
    }
*/
}

@end

