//
//  Helper.h
//  TestAPI
//
//  Created by sachitananda sahu  on 21/08/17.
//  Copyright © 2017 Sachita. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <CommonCrypto/CommonDigest.h>
#include <CommonCrypto/CommonHMAC.h>
#import "NSData+Base64.h"

NSString *KEY_OAUTH_NONCE = @"oauth_nonce";
NSString *KEY_OAUTH_SIGNATURE_METHOD = @"oauth_signature_method";
NSString *KEY_OAUTH_TOKEN = @"oauth_token";
NSString *KEY_OAUTH_TIMESTAMP = @"oauth_timestamp";
NSString *KEY_OAUTH_VERSION = @"oauth_version";
NSString *KEY_OAUTH_SIGNATURE = @"oauth_signature";
NSString *KEY_AUTHORIZATION_OAUTH = @"Authorization: OAuth";


NSString *VALUE_OAUTH_SIGNATURE_METHOD = @"HMAC-SHA1";
NSString *VALUE_OAUTH_VERSION = @"1.0";

@interface Helper : NSObject
@property (strong, nonatomic) id someProperty;

- (void) someMethod;
-(NSString *)buidCompositeKey:(NSString *)cid aToken:(NSString *)companyAccessToken;
-(NSString *)stringConverBase64:(NSString *)stringText;
-(NSString *)computeSignature:(NSString*) baseString key:(NSString *)keyString;
-(NSString *)stringEncode:(NSString *)textString;
-(NSString *) headerVersionCreate:(NSString *)url mthod:(NSString *)requestMethod list:(NSDictionary *) nameValuePairs cid:(NSString *) cid aToken:(NSString *)companytoken;
-(NSString *)buildBaseString:(NSString *)url mType:(NSString*) MethodType list:(NSDictionary *)nameValuePairs;
-(NSString *)generateCurrentTime;
-(NSArray *)getComapanyAccessTokenAndCid:(NSString*)accesstoken;
@end
