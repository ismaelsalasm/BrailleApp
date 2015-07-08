//
//  CodificacionBraille.m
//  BrailleApp
//
//  Created by Ismael Salas Martos on 8/5/15.
//  Copyright (c) 2015 Ismael Salas Martos. All rights reserved.
//

#import "CodificacionBraille.h"

// Definición de botón activo o no activo.

#define BOTON_ACTIVO @"1"
#define BOTON_NO_ACTIVO @"0"

@interface CodificacionBraille()

// Declaración de propiedades de los diccionarios.

//@property (nonatomic, strong) NSDictionary *dictMinusculas;
//@property (nonatomic, strong) NSDictionary *dictMayusculas;
//@property (nonatomic, strong) NSDictionary *dictNumeros;

@end

// Implementación de la Codificación Alfabeto Braille.

@implementation CodificacionBraille

// Codificación del Alfabeto Braille en tres diccionarios: normal(minúsculas), Mayúsculas y Números.

- (NSDictionary *)dictMinusculas
{
    if (!_dictMinusculas) {
        _dictMinusculas = @{@"100000" : @"a",
                            @"110000" : @"b",
                            @"100100" : @"c",
                            @"100110" : @"d",
                            @"100010" : @"e",
                            @"110100" : @"f",
                            @"110110" : @"g",
                            @"110010" : @"h",
                            @"010100" : @"i",
                            @"010110" : @"j",
                            @"101000" : @"k",
                            @"111000" : @"l",
                            @"101100" : @"m",
                            @"101110" : @"n",
                            @"101010" : @"o",
                            @"111100" : @"p",
                            @"111110" : @"q",
                            @"111010" : @"r",
                            @"011100" : @"s",
                            @"011110" : @"t",
                            @"101001" : @"u",
                            @"111001" : @"v",
                            @"101101" : @"x",
                            @"101111" : @"y",
                            @"101011" : @"z",
                            @"111011" : @"á",
                            @"011101" : @"é",
                            @"001100" : @"í",
                            @"001101" : @"ó",
                            @"011111" : @"ú",
                            @"110011" : @"ü",
                            @"110111" : @"ñ",
                            @"010111" : @"w",
                            @"111101" : @"&",
                            @"001000" : @".",
                            @"001111" : @"ª", //prefijo numérico
                            @"000101" : @"º", //prefijo mayúscula
                            @"010000" : @",",
                            @"011000" : @";",
                            @"010010" : @":",
                            @"001001" : @"-",
                            @"100000" : @"'", //comilla
                            @"001010" : @"*",
                            @"000100" : @"@",
                            @"010101" : @"¿",
                            @"010001" : @"?",
                            @"010011" : @"¡",
                            @"011010" : @"!",
                            @"110001" : @"(",
                            @"001110" : @")",
                            @"100001" : @"/",
                            @"100011" : @"%",
                            @"100101" : @"+",
                            @"011011" : @"^",
                            @"110101" : @"\n", //salto de línea
                            @"000110" : @"=",
                            @"000011" : @"∞∞", //borrar cadena de caracteres
                            @"000111" : @">",
                            @"001011" : @"<",
                            @"100111" : @"_", //guíon bajo
                            @"000001" : @" ", //espacio
                            @"000010" : @"∞", //borrar carácter
                            @"111111" : @"\n", //salto de línea
                            @"000000" : @" " //no puede ser nada
                            };
    }
    return _dictMinusculas;
}

- (NSDictionary *)dictMayusculas
{
    if (!_dictMayusculas) {
        _dictMayusculas = @{@"100000" : @"A",
                            @"110000" : @"B",
                            @"100100" : @"C",
                            @"100110" : @"D",
                            @"100010" : @"E",
                            @"110100" : @"F",
                            @"110110" : @"G",
                            @"110010" : @"H",
                            @"010100" : @"I",
                            @"010110" : @"J",
                            @"101000" : @"K",
                            @"111000" : @"L",
                            @"101100" : @"M",
                            @"101110" : @"N",
                            @"101010" : @"O",
                            @"111100" : @"P",
                            @"111110" : @"Q",
                            @"111010" : @"R",
                            @"011100" : @"S",
                            @"011110" : @"T",
                            @"101001" : @"U",
                            @"111001" : @"V",
                            @"101101" : @"X",
                            @"101111" : @"Y",
                            @"101011" : @"Z",
                            @"111011" : @"Á",
                            @"011101" : @"É",
                            @"001100" : @"Í",
                            @"001101" : @"Ó",
                            @"011111" : @"Ú",
                            @"110011" : @"Ü",
                            @"110111" : @"Ñ",
                            @"010111" : @"W",
                            @"111101" : @"&",
                            @"001000" : @".",
                            @"001111" : @"º", //prefijo numérico
                            @"000101" : @"ª", //prefijo mayúscula
                            @"010000" : @",",
                            @"011000" : @";",
                            @"010010" : @":",
                            @"001001" : @"-",
                            @"100000" : @"'", //comilla
                            @"001010" : @"*",
                            @"000100" : @"@",
                            @"010101" : @"¿",
                            @"010001" : @"?",
                            @"010011" : @"¡",
                            @"011010" : @"!",
                            @"110001" : @"(",
                            @"001110" : @")",
                            @"100001" : @"/",
                            @"100011" : @"%",
                            @"100101" : @"+",
                            @"011011" : @"^",
                            @"110101" : @"\n", //salto de línea
                            @"000110" : @"=",
                            @"000011" : @"∞∞", //borrar cadena de caracteres
                            @"000111" : @">",
                            @"001011" : @"<",
                            @"100111" : @"_", //guíon bajo
                            @"000001" : @" ", //espacio
                            @"000010" : @"∞", //borrar carácter
                            @"111111" : @"\n", //salto de línea
                            @"000000" : @" " //no puede ser nada
                            };
    }
    return _dictMayusculas;
}

- (NSDictionary *)dictNumeros
{
    if (!_dictNumeros) {
        _dictNumeros = @{@"100000" : @"1",
                         @"110000" : @"2",
                         @"100100" : @"3",
                         @"100110" : @"4",
                         @"100010" : @"5",
                         @"110100" : @"6",
                         @"110110" : @"7",
                         @"110010" : @"8",
                         @"010100" : @"9",
                         @"010110" : @"0",
                       //@"101000" : @"k",
                       //@"111000" : @"l",
                       //@"101100" : @"m",
                       //@"101110" : @"n",
                       //@"101010" : @"o",
                       //@"111100" : @"p",
                       //@"111110" : @"q",
                       //@"111010" : @"r",
                       //@"011100" : @"s",
                       //@"011110" : @"t",
                       //@"101001" : @"u",
                       //@"111001" : @"v",
                       //@"101101" : @"x",
                       //@"101111" : @"y",
                       //@"101011" : @"z",
                       //@"111011" : @"á",
                       //@"011101" : @"é",
                       //@"001100" : @"í",
                       //@"001101" : @"ó",
                       //@"011111" : @"ú",
                       //@"110011" : @"ü",
                       //@"110111" : @"ñ",
                       //@"010111" : @"w",
                         @"111101" : @"&",
                         @"001000" : @".",
                         @"001111" : @"ª", //prefijo numérico
                         @"000101" : @"ª", //prefijo mayúscula
                         @"010000" : @",",
                         @"011000" : @";",
                         @"010010" : @":",
                         @"001001" : @"-",
                         @"100000" : @"'", //comilla
                         @"001010" : @"*",
                         @"000100" : @"@",
                         @"010101" : @"¿",
                         @"010001" : @"?",
                         @"010011" : @"¡",
                         @"011010" : @"!",
                         @"110001" : @"(",
                         @"001110" : @")",
                         @"100001" : @"/",
                         @"100011" : @"%",
                         @"100101" : @"+",
                         @"011011" : @"^",
                         @"110101" : @"\n", // salto de línea
                         @"000110" : @"=",
                         @"000011" : @"∞∞", //borrar cadena de caracteres
                         @"000111" : @">",
                         @"001011" : @"<",
                         @"100111" : @"_", //guíon bajo
                         @"000001" : @" ", //espacio
                         @"000010" : @"∞", //borrar carácter
                         @"111111" : @"\n", //salto de línea
                         @"000000" : @" " //no puede ser nada
                         };
    }
    return _dictNumeros;
}

// Función key que te devuelve del diccionario seleccionado la codificación(el valor) según BOTON_ACTIVO y BOTON_NO_ACTIVO.

- (NSString*)letraConCodificacion:(NSArray *)Codificacion usarDictionary:(NSString *)usarDictionary
{
    
    NSString *key = @"";
    for (int i = 0; i< Codificacion.count ; i++) {
        BOOL active = [Codificacion[i] boolValue];
        if (active){
            //YES
            key = [key stringByAppendingString:BOTON_ACTIVO];
        } else {
            //NO
            key = [key stringByAppendingString:BOTON_NO_ACTIVO];
        }
    }
    
    if ([usarDictionary isEqualToString:@"dictNumeros"]) {
        return self.dictNumeros[key];
    }else if ([usarDictionary isEqualToString:@"dictMayusculas"]){
        return self.dictMayusculas[key];
    }
    
return self.dictMinusculas[key];

}


@end


