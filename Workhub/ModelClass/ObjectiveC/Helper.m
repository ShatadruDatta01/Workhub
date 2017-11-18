//
//  Helper.m
//  TestAPI
//
//  Created by sachitananda sahu  on 21/08/17.
//  Copyright © 2017 Sachita. All rights reserved.
//

#import "Helper.h"

@implementation Helper
- (void) someMethod {
    NSLog(@"SomeMethod Ran");
}

/*Build Compositekey*/
-(NSString *) buidCompositeKey:(NSString *)cid aToken:(NSString *)companyAccessToken {
    NSString *createCompositeKey = [NSString stringWithFormat:@"%@&%@",[self stringEncode:cid] ,[self stringEncode:companyAccessToken]];
    
    //    NSLog(@"CompositeKey : %@", createCompositeKey);
    return createCompositeKey;
}

/*Convert base64 my String*/
-(NSString *)stringConverBase64:(NSString *)stringText {
    NSData *nsdata = [stringText
                      dataUsingEncoding:NSUTF8StringEncoding];
    
    // Get NSString from NSData object in Base64
    NSString *base64Encoded = [nsdata base64EncodedStringWithOptions:0];
    return base64Encoded;
}

/*Convert base64 my String*/
-(NSString *)computeSignature:(NSString*) baseString key:(NSString *)keyString {
    const char *cKey  = [keyString cStringUsingEncoding:NSASCIIStringEncoding];
    const char *cData = [baseString cStringUsingEncoding:NSASCIIStringEncoding];
    
    unsigned char cHMAC[CC_SHA1_DIGEST_LENGTH];
    
    CCHmac(kCCHmacAlgSHA1, cKey, strlen(cKey), cData, strlen(cData), cHMAC);
    
    NSData *HMAC = [[NSData alloc] initWithBytes:cHMAC length:sizeof(cHMAC)];
    
    NSString *hash = [HMAC base64EncodedStringWithOptions:0];
    //    NSLog(@"%@",hash);
    return hash;
}
-(NSString *)stringEncode:(NSString *)textString {
    NSString *string = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL,(CFStringRef)textString,NULL,(CFStringRef)@"!*'\"();:@&=+$,/?%#[]% ",
        CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding)));;
    return string;
}
-(NSString *)buildBaseString:(NSString *)url mType:(NSString*) MethodType list:(NSDictionary *)nameValuePairs {
    
    NSString *createKeyValueUri = @"&";
    
    if([MethodType isEqualToString:@"GET"] || [MethodType isEqualToString:@"DELETE"]){
        createKeyValueUri = @"?";
    }else{
        createKeyValueUri = @"&";
    }
    NSArray *keys = [nameValuePairs allKeys];
    NSArray *sKeys = [keys sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    
    for(id key in sKeys){
        createKeyValueUri = [createKeyValueUri stringByAppendingString:[NSString stringWithFormat:@"%@=%@&",key,[self stringEncode:[nameValuePairs objectForKey:key]]]];
        //        NSLog(@"createKeyValueUri::::::%@", createKeyValueUri);
    }
    
    NSString *tempcreateKeyValueUri = [createKeyValueUri substringToIndex:[createKeyValueUri length]-1];
    NSString *tempurl = url;
    
    return [NSString stringWithFormat:@"%@&%@%@",MethodType, [self stringEncode:tempurl], [self stringEncode:tempcreateKeyValueUri]];
    
}
-(NSString *) headerVersionCreate:(NSString *)url mthod:(NSString *)requestMethod list:(NSDictionary *) nameValuePairs cid:(NSString *) cid aToken:(NSString *)companytoken {
    
    NSString *baseString = [self buildBaseString:url mType:requestMethod list:nameValuePairs];
    baseString = [baseString stringByReplacingOccurrencesOfString:@"%2C" withString:@"%252C"];
    baseString = [baseString stringByReplacingOccurrencesOfString:@"%40" withString:@"%2540"];
    
    if ([url containsString:@"https://apils.socioadvocacy.com/contentidea/create"]) {
        baseString = [baseString stringByReplacingOccurrencesOfString:@"%252B" withString:@"%2520"];
        baseString = [baseString stringByReplacingOccurrencesOfString:@"%2525" withString:@"%25"];
        baseString = [baseString stringByReplacingOccurrencesOfString:@"%40" withString:@"%2540"];
        baseString = [baseString stringByReplacingOccurrencesOfString:@"%2526%252339%253B" withString:@"%2527"];
    }else{
        baseString = [baseString stringByReplacingOccurrencesOfString:@"%252520" withString:@"%2520"];
    }
    
    NSString *compositeKey = [self buidCompositeKey:cid aToken:companytoken];
    NSString *oauth_signature = [self computeSignature:baseString key:compositeKey];
    /*HMAC-SHA1*/
    
    NSDate *now = [NSDate date];
    NSCalendar *gregorian=[[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [gregorian setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    
    NSDateComponents* timeZoneComps = [gregorian components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond|NSCalendarUnitTimeZone fromDate:now];
    
    NSDate *selectedDate=[gregorian dateFromComponents:timeZoneComps];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterFullStyle];
    [formatter setDateFormat:@"EEE, dd MMM yyyy HH:mm:ss zzz"];
    
    NSString *strSelectedDate= [formatter stringFromDate:selectedDate];
    //    NSLog(@"%@",strSelectedDate);
    //    NSLog(@"%f",[[formatter dateFromString:strSelectedDate] timeIntervalSince1970]);
    
    NSString *st = [NSString stringWithFormat:@"%ld",(long)[[formatter dateFromString:strSelectedDate] timeIntervalSince1970]];
    //    NSLog(@"\noauth_nonce :%@", [Helper stringConverBase64:st]);
    
    NSString *s = [NSString stringWithFormat:@"Authorization: OAuth %@='%@',%@='%@',%@='%@',%@='%@',%@='%@',%@='%@'",KEY_OAUTH_NONCE,[self stringConverBase64:st],KEY_OAUTH_SIGNATURE_METHOD,VALUE_OAUTH_SIGNATURE_METHOD,KEY_OAUTH_TOKEN,companytoken,KEY_OAUTH_TIMESTAMP,st,KEY_OAUTH_VERSION,VALUE_OAUTH_VERSION,KEY_OAUTH_SIGNATURE,[self stringEncode:oauth_signature]];
    //return st;
    
    return s/*[Helper buildAuthorizationHeader:nameValuePairsHeader]*/;
}

-(NSString *)generateCurrentTime {
    NSDate *now = [NSDate date];
    NSCalendar *gregorian=[[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [gregorian setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    
    NSDateComponents* timeZoneComps = [gregorian components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond|NSCalendarUnitTimeZone fromDate:now];
    
    NSDate *selectedDate=[gregorian dateFromComponents:timeZoneComps];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterFullStyle];
    [formatter setDateFormat:@"EEE, dd MMM yyyy HH:mm:ss zzz"];
    
    NSString *strSelectedDate= [formatter stringFromDate:selectedDate];
    //    NSLog(@"%@",strSelectedDate);
    //    NSLog(@"%f",[[formatter dateFromString:strSelectedDate] timeIntervalSince1970]);
    
    NSString *st = [NSString stringWithFormat:@"%ld",(long)[[formatter dateFromString:strSelectedDate] timeIntervalSince1970]];
    return st;
}

-(NSArray *)getComapanyAccessTokenAndCid:(NSString*)accesstoken {
    
    NSData *plainTextData = [NSData dataFromBase64String:accesstoken];
    NSString *plainText = [[NSString alloc] initWithData:plainTextData encoding:NSUTF8StringEncoding];
    NSArray *base64String = [plainText componentsSeparatedByString:@"-"];
    return base64String;
}
@end
