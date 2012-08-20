#import "CalculatorTests.h"
#import "Calculator.h"

@implementation CalculatorTests

- (void)setUp {
    [super setUp];
    sut = [[Calculator alloc] init];
}

- (void)testAddMethod_zeroLengthInput_returnsZero {
    NSInteger expected = 0;
    NSInteger result = [sut add:@""];

    STAssertEquals(expected, result, @"Zero length input should return 0.");
}

- (void)testAddMethod_oneLengthInput_returnsEquivalent {
    NSInteger expected = 3;
    NSInteger result = [sut add:@"3"];

    STAssertEquals(expected, result, @"One length input should return equivalent.");
}

- (void)testAddMethod_twoLengthInput_returnsSum {
    NSInteger expected = 8;
    NSInteger result = [sut add:@"3,5"];

    STAssertEquals(expected, result, @"Two length input should return sum.");
}

- (void)testAddMethod_anyLengthInput_returnsSum {
    NSInteger expected = 0;
    NSInteger howMany = arc4random() % 999;
    NSMutableString *numbersToAdd = [NSMutableString string];

    for (int i = 0; i < howMany; i++) {
        [numbersToAdd appendFormat:[NSString stringWithFormat:@"%d,",i]];
        expected += i;
    }

    NSInteger result = [sut add:numbersToAdd];

    STAssertEquals(expected, result, @"Any length input should return sum.");
}

- (void)testAddMethod_newLineInput_returnsSum {
    NSInteger expected = 12;
    NSInteger result = [sut add:@"3,5\n4"];

    STAssertEquals(expected, result, @"New line input should return sum.");
}

- (void)testAddMethod_duplicateDelimiterInput_throwsException {
    STAssertThrowsSpecificNamed([sut add:@"3,5,\n4"], NSException, @"DuplicateDelimitersException", @"Should have rejected duplicate delimiters.");
}

- (void)testAddMethod_customDelimiterInput_returnsSum {
    NSInteger expected = 14;
    NSInteger result = [sut add:@"//%\n2%3,5\n4"];

    STAssertEquals(expected, result, @"Custom delimiter input should return sum.");
}

- (void)testAddMethod_negativeNumberInput_throwsException {
    STAssertThrowsSpecificNamed([sut add:@"3,5,4,-5,-6"], NSException, @"NegativeNumbersException", @"Should have rejected negative numbers.");
}


@end
