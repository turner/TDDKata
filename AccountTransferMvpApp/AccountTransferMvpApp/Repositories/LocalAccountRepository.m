#import "LocalAccountRepository.h"


@implementation LocalAccountRepository {

}
- (void)depositAmount:(NSNumber *)amount {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Deposit Amount Called"
                                                        message:[NSString stringWithFormat:@"Amount: %@", amount]
                                                       delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alertView show];
}


@end