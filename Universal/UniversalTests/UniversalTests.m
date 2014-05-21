//
//  UniversalTests.m
//  UniversalTests
//
//  Created by 孙晓冬 on 14-3-19.
//  Copyright (c) 2014年 孙晓冬. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface UniversalTests : XCTestCase

@end

@implementation UniversalTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

@end
