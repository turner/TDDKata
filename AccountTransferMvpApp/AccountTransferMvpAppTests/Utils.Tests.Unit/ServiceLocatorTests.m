#import "ServiceLocatorTests.h"
#import "PresenterTypeEnum.h"
#import "ServiceLocator.h"
#import "AccountTransferPresenter.h"

@implementation ServiceLocatorTests

-(void)testGivenSut_whenResolveMethodIsPassedAnEnumValue_thenMatchingPresenterIsReturned {
    PresenterTypeEnum presenterTypeEnum = AccountTransfer;
    id accountTransferPresenter = [ServiceLocator resolve:presenterTypeEnum];

    STAssertTrue([accountTransferPresenter isKindOfClass:[AccountTransferPresenter class]], @"The matching presenter should have been returned.");
}

@end
