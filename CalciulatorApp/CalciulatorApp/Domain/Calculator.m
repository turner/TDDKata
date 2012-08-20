#import <Foundation/Foundation.h>
#import "Calculator.h"


@implementation Calculator {

}

- (NSInteger)sum:(NSString *)numbersToAdd {
    NSArray *const numbersArray = [numbersToAdd componentsSeparatedByString:@","];
    int total = 0;
    NSString *negativeNumbers = @"";
    for (NSString *numberString in numbersArray) {
        int number = [numberString integerValue];
        if (number < 0)
            negativeNumbers = [NSString stringWithFormat:@"%@,%i", negativeNumbers, number];
        total += number;
    }
    if ([negativeNumbers length] > 0)
        [NSException raise:@"NegativeNumbersException" format:@"You cannot input negative numbers: %@", negativeNumbers];
    return total;
}

- (NSString *)handleNewLineDelimiter:(NSString *)numbersToAdd {
    numbersToAdd = [numbersToAdd stringByReplacingOccurrencesOfString:@"\n" withString:@","];
    return numbersToAdd;
}

- (void)guardCondition_rejectDuplicateDelimiters:(NSString *)numbersToAdd {
    if ([numbersToAdd rangeOfString:@",,"].location != NSNotFound)
        [NSException raise:@"DuplicateDelimitersException" format:@"You cannot input duplicate delimiters."];
}

- (NSString *)handleCustomDelimiter:(NSString *)numbersToAdd {
    if ([numbersToAdd hasPrefix:@"//"]) {
        NSString *customDelimiter = [numbersToAdd substringWithRange:NSMakeRange(2, 1)];
        NSString *suffix = [numbersToAdd substringWithRange:NSMakeRange(4, [numbersToAdd length] - 4)];
        numbersToAdd = [suffix stringByReplacingOccurrencesOfString:customDelimiter withString:@","];
    }
    return numbersToAdd;
}

- (NSInteger)add:(NSString *)numbersToAdd {
    numbersToAdd = [self handleCustomDelimiter:numbersToAdd];
    numbersToAdd = [self handleNewLineDelimiter:numbersToAdd];
    [self guardCondition_rejectDuplicateDelimiters:numbersToAdd];
    if ([numbersToAdd rangeOfString:@","].location != NSNotFound)
        return [self sum:numbersToAdd];

    return [numbersToAdd length] > 0 ? [numbersToAdd integerValue] : 0;
}
@end