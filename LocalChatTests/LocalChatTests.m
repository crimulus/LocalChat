//
//  LocalChatTests.m
//  LocalChatTests
//
//  Created by Tharp, Jeremy on 11/20/14.
//  Copyright (c) 2014 Tharp, Jeremy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "MPCManager.h"

@interface LocalChatTests : XCTestCase

@end

@implementation LocalChatTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testMyMPCManagerNotNil {
    MPCManager *mpc = [[MPCManager alloc] init];
    XCTAssertNotNil(mpc, @"MPC Manager object is nil");
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
