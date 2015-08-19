//
//  RSADataVerifier.h
//  SafepayService
//
//  Created by wenbi on 11-4-11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSADataVerifier : NSObject {
	NSString *_publicKey;
}

- (instancetype)initWithPublicKey:(NSString *)publicKey;

- (BOOL)verifyString:(NSString *)originStr withSign:(NSString *)signStr;

@end
