//
//  FISCaesarCipher.m
//  CaesarCipher
//
//  Created by Chris Gonzales on 5/29/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import "FISCaesarCipher.h"

@implementation FISCaesarCipher
//define methods here

-(NSString *)encodeWithMessage:(NSString *)message andOffset:(NSInteger)key{
    // a offset 3 = d
    
    NSMutableString *newCharacter = [[NSMutableString alloc] init];
    
    for (NSNumber *asciiCodeNumbers in [self encoder:[self arrayWithCharactersOfMessage:message]]){
        NSInteger asciiNumber = [asciiCodeNumbers integerValue];
        NSInteger offSet = (key % 26);
        
        // Handles lowercase letters
        if (asciiNumber >= 97 && asciiNumber <= 122){
            NSInteger newNumber = asciiNumber + offSet;
            
            if (newNumber > 122 && newNumber < 148){
                newNumber = newNumber - 26;
                NSString *characterToAdd = [NSString stringWithFormat:@"%c", newNumber];
                [newCharacter appendString:characterToAdd];
            }
            else if (key % 26 == 0){
                newNumber = asciiNumber;
                NSString *characterToAdd = [NSString stringWithFormat:@"%c", newNumber];
                [newCharacter appendString:characterToAdd];
            }
            else {
                NSString *characterToAdd = [NSString stringWithFormat:@"%c", newNumber];
                [newCharacter appendString:characterToAdd];
            }
        }
        
        // Handles uppercase letters
        else if (asciiNumber >= 65 && asciiNumber <= 90){
            NSInteger newNumber = asciiNumber + offSet;
            
            if (newNumber > 90){
                newNumber = newNumber - 26;
                NSString *characterToAdd = [NSString stringWithFormat:@"%c", newNumber];
                [newCharacter appendString:characterToAdd];
            }
            else {
                NSString *characterToAdd = [NSString stringWithFormat:@"%c", newNumber];
                [newCharacter appendString:characterToAdd];
            }
        }
        else if (asciiNumber == 32){
            NSInteger newNumber = asciiNumber;
            NSString *characterToAdd = [NSString stringWithFormat:@"%c", newNumber];
            [newCharacter appendString:characterToAdd];
        }
        else {
            NSInteger newNumber = asciiNumber;
            NSString *characterToAdd = [NSString stringWithFormat:@"%c", newNumber];
            [newCharacter appendString:characterToAdd];
        }
        
    }
    
    return newCharacter;
}

-(NSString *)decodeWithMessage:(NSString *)encodedMessage andOffset:(NSInteger)key{
    
    NSMutableString *newCharacter = [[NSMutableString alloc] init];
    
    for (NSNumber *asciiCodeNumbers in [self encoder:[self arrayWithCharactersOfMessage:encodedMessage]]){
        NSInteger asciiNumber = [asciiCodeNumbers integerValue];
        NSInteger offSet = (key % 26);
        
        // Handles lowercase letters
        if (asciiNumber >= 97 && asciiNumber <= 122){
            NSInteger newNumber = asciiNumber - offSet;
            
            if (newNumber > 71 && newNumber < 97){
                newNumber = newNumber + 26;
                NSString *characterToAdd = [NSString stringWithFormat:@"%c", newNumber];
                [newCharacter appendString:characterToAdd];
            }
            else if (key % 26 == 0){
                newNumber = asciiNumber;
                NSString *characterToAdd = [NSString stringWithFormat:@"%c", newNumber];
                [newCharacter appendString:characterToAdd];
            }
            else {
                NSString *characterToAdd = [NSString stringWithFormat:@"%c", newNumber];
                [newCharacter appendString:characterToAdd];
            }
        }
        
        // Handles uppercase letters
        else if (asciiNumber >= 65 && asciiNumber <= 90){
            NSInteger newNumber = asciiNumber - offSet;
            
            if (newNumber < 65){
                newNumber = newNumber + 26;
                NSString *characterToAdd = [NSString stringWithFormat:@"%c", newNumber];
                [newCharacter appendString:characterToAdd];
            }
            else {
                NSString *characterToAdd = [NSString stringWithFormat:@"%c", newNumber];
                [newCharacter appendString:characterToAdd];
            }
        }
        else if (asciiNumber == 32){
            NSInteger newNumber = asciiNumber;
            NSString *characterToAdd = [NSString stringWithFormat:@"%c", newNumber];
            [newCharacter appendString:characterToAdd];
        }
        else {
            NSInteger newNumber = asciiNumber;
            NSString *characterToAdd = [NSString stringWithFormat:@"%c", newNumber];
            [newCharacter appendString:characterToAdd];
        }
        
    }
    return newCharacter;
}





// Take input array and output same array in ascii code
-(NSArray *)encoder:(NSArray*)messageToEncode{
    NSMutableArray *encodedMessage = [[NSMutableArray alloc] init];
    
    for (NSUInteger i = 0; i < [messageToEncode count]; i++){
        NSInteger asciiNumber = [messageToEncode[i] characterAtIndex:0];
        NSNumber *arrayNumber = [NSNumber numberWithInteger:asciiNumber];
        [encodedMessage addObject:arrayNumber];
    }
    
    return encodedMessage;
}

// Take input string and output array of characters
-(NSArray *)arrayWithCharactersOfMessage:(NSString *)message
{
    NSMutableArray *strings = [[NSMutableArray alloc] init];
    
    for (NSUInteger i = 0; i < message.length; i++){
        NSString *characters = [message substringWithRange:NSMakeRange(i, 1)];
        [strings addObject:characters];
    }
    
    return strings;
}

@end;
