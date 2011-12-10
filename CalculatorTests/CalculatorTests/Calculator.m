#import "Calculator.h"


@implementation Calculator {

}

- (BOOL)containsWithin:(NSString *)stringToSearch theSubstring:(NSString *)value {
    return [stringToSearch rangeOfString:value].location != NSNotFound;
}

- (int)sum:(NSString *)numbersToAdd {
        int total = 0;
        NSArray *numbersArray = [numbersToAdd componentsSeparatedByString:@","];
        for(NSString *numberString in numbersArray)
            total += [numberString intValue];
        return total;
    }

- (NSString *)handleNewLineDelimiters:(NSString *)numbersToAdd {
    numbersToAdd = [numbersToAdd stringByReplacingOccurrencesOfString:@"\n" withString:@","];
    return numbersToAdd;
}

- (void)guardConditionRejectDuplicateDelimiters:(NSString *)numbersToAdd {
    if ([self containsWithin:numbersToAdd theSubstring:@",,"])
        [NSException raise:@"Duplicate exception" format:@"You cannot use duplicate delimiters"];
}

- (int)add:(NSString *)numbersToAdd {
    numbersToAdd = [self handleNewLineDelimiters:numbersToAdd];
    [self guardConditionRejectDuplicateDelimiters:numbersToAdd];
    if ([self containsWithin:numbersToAdd theSubstring:@","])
        return [self sum:numbersToAdd];

    return [numbersToAdd length] > 0 ? [numbersToAdd intValue] : 0;
}
@end