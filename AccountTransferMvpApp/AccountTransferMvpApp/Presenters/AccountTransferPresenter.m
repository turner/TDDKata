#import "AccountTransferPresenter.h"


@implementation AccountTransferPresenter {

}
@synthesize accountTransferView = _accountTransferView;
@synthesize remoteAccountRepository = _remoteAccountRepository;
@synthesize localAccountRepository = _localAccountRepository;


- (void)transferAmount {
    NSNumber *amount = [_accountTransferView getTransferAmount];
    [_remoteAccountRepository withdrawAmount:amount];
    [_localAccountRepository depositAmount:amount];
    [_accountTransferView setMessage:[NSString stringWithFormat:@"$%@ was transferred", amount]];
}

- (id)initWithRemote:(id <IRemoteAccountRepository>)remoteAccountRepository andLocal:(id <ILocalAccountRepository>)localAccountRepository {
    if (self = [super init]) {
        _remoteAccountRepository = remoteAccountRepository;
        _localAccountRepository = localAccountRepository;
    }
    return self;
}
@end