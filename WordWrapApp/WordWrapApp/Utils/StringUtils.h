#import <Foundation/Foundation.h>


@interface StringUtils : NSObject
- (NSString *)wrapLine:(NSString *)input byColumnWdith:(int)width;
@end