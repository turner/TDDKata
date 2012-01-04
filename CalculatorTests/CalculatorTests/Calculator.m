#import "Calculator.h"


@implementation Calculator {

}

- (BOOL)containsWithin:(NSString *)thisString theValue:(NSString *)thisValue {
    return [thisString rangeOfString:thisValue].location != NSNotFound;
}

- (int)sum:(NSString *)numbersToAdd {
    NSArray *numbersArray = [numbersToAdd componentsSeparatedByString:@","];
    int total = 0;
    for (NSString *numberString in numbersArray)
        total += [numberString intValue];
    return total;
}

- (int)add:(NSString *)numbersToAdd {
    if ([self containsWithin:numbersToAdd theValue:@","])
        return [self sum:numbersToAdd];
    return [numbersToAdd length] > 0 ? [numbersToAdd intValue] : 0;
}
@end