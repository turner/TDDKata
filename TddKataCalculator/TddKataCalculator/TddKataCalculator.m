//
//  TddKataCalculator.m
//  TddKataCalculator
//
//  Created by David Gadd on 12/01/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "TddKataCalculator.h"

@implementation TddKataCalculator

- (void)setUp
{
    [super setUp];
    calc = [[Calculator alloc] init];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testAddMethod_ZeroLengthInput_ReturnsZero {
    int result = [calc add:@""];
    int expected = 0;
    STAssertEquals(expected, result, @"Zero-length input returns zero.");
}

- (void)testAddMethod_OneLengthInput_ReturnsEquivalent {
    int result = [calc add:@"3"];
    int expected = 3;
    STAssertEquals(expected, result, @"One-length input returns equivalent.");
}

- (void)testAddMethod_TwoLengthInput_ReturnsSum {
    int result = [calc add:@"3,4"];
    int expected = 7;
    STAssertEquals(expected, result, @"Two-length input returns sum.");
}

@end