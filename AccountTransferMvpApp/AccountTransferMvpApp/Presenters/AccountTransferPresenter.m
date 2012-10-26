#import "AccountTransferPresenter.h"
#import "IAccountTransferView.h"
#import "IRemoteAccountRepository.h"
#import "ILocalAccountRepository.h"


@implementation AccountTransferPresenter {

}
@synthesize accountTransferView = _accountTransferView;
@synthesize remoteAccountRepository = _remoteAccountRepository;
@synthesize localAccountRepository = _localAccountRepository;


- (void)transferAmount {
    NSNumber *amount = [_accountTransferView getTransferAmount];
    [_remoteAccountRepository withdrawAmount:amount];
    [_localAccountRepository depositAmount:amount];
    [_accountTransferView displayMessage:[NSString stringWithFormat:@"$%@ was transferred",amount]];
}
@end