#import <Foundation/Foundation.h>

@protocol IRemoteAccountRepository;
@protocol ILocalAccountRepository;
@protocol IAccountTransferView;


@interface AccountTransferPresenter : NSObject
@property(nonatomic, strong) id <IRemoteAccountRepository> remoteAccountRepository;

@property(nonatomic, strong) id <ILocalAccountRepository> localAccountRepository;

@property(nonatomic, strong) id <IAccountTransferView> accountTransferView;

- (id)initWithRemote:(id <IRemoteAccountRepository>)remoteAccountRepository andLocal:(id <ILocalAccountRepository>)localAccountRepository;

- (void)transferAmount;
@end