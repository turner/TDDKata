#import "StringUtilsTests.h"
#import "StringUtils.h"

@implementation StringUtilsTests

- (void)setUp {
    [super setUp];
    sut = [[StringUtils alloc] init];
}

- (void)testWrapLineByColumnWidthMethod_columnWidthZero_shouldReturnNoLineBreaks {
    NSString *input = @"Many multi-marmotted maps may multiply 3.14527 x more magnificently.";
    NSString *expected = input;

    NSString *result = [sut wrapLine:input byColumnWidth:0 withWordBreak:NO];

    STAssertEqualObjects(expected, result, @"0 length column width should return no line breaks.");
}

- (void)testWrapLineByColumnWidthMethod_columnWidth20_shouldReturnExactLineBreaks {
    NSString *input = @"Many multi-marmotted maps may multiply 3.14527 x more magnificently.";
    NSString *expected = @"Many multi-marmotted\n maps may multiply 3\n.14527 x more magnif\nicently.";

    NSString *result = [sut wrapLine:input byColumnWidth:20 withWordBreak:NO];

    STAssertEqualObjects(expected, result, @"20 length column width should return exact line breaks.");
}

- (void)testWrapLineByColumnWidthMethod_inputTextShorterThanColumnWidth_shouldReturnNoLineBreaks {
    NSString *input = @"Short input";
    NSString *expected = input;

    NSString *result = [sut wrapLine:input byColumnWidth:20 withWordBreak:NO];

    STAssertEqualObjects(expected, result, @"Input text shorter than column width should return no line breaks.");
}

- (void)testWrapLineByColumnWidthMethod_columnWidthLessThan20_throwsException {
    @try {
        [sut wrapLine:@"test" byColumnWidth:19 withWordBreak:NO];
        STAssertFalse(true, @"When column width > 0 and < 20, should throw exception.");
    } @catch(NSException *ex) {
        STAssertEqualObjects(@"ColumnWidthTooNarrowException", [ex name], @"The expected exception name was not thrown.");
        STAssertEqualObjects(@"You must input a column width > 20.", [ex description], @"The expected exception description was not thrown.");
    }
}

- (void)testWrapLineByColumnWidthWithWordBreakMethod_wordBreakTrue_lineShouldBreakAfterWordSpace {
    NSString *input = @"Many multi-marmotted maps may multiply 3.14527 x more magnificently.";
    NSString *expected = @"Many \nmulti-marmotted \nmaps may multiply \n3.14527 x more \nmagnificently.";

    NSString *result = [sut wrapLine:input byColumnWidth:20 withWordBreak:YES];

    STAssertEqualObjects(expected, result, @"Input text shorter than column width should return no line breaks.");
}

- (void)testWrapLineByColumnWidthMethod_wordLongerThanColumnWidthWhenWordBreakTrue_throwsException {
    @try {
        [sut wrapLine:@"Mary Supercalifragilisticexpialidotious Poppins" byColumnWidth:20 withWordBreak:YES];
        STAssertFalse(true, @"An exception should be thrown when words are longer than column widths and word break is true.");
    } @catch(NSException *ex) {
        STAssertEqualObjects(@"WordWidthWithWordBreakException", [ex name], @"The expected exception name was not thrown.");
        STAssertEqualObjects(@"Word Supercalifragilisticexpialidotious is longer than column width, with word break", [ex description], @"The expected exception description was not thrown.");
    }
}

@end