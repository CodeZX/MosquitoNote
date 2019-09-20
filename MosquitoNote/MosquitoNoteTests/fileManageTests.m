//
//  fileManageTests.m
//  MosquitoNoteTests
//
//  Created by 周鑫 on 2019/9/18.
//  Copyright © 2019 ZX. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MNFileManage.h"

@interface fileManageTests : XCTestCase

@end

@implementation fileManageTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}


- (void)testNoteName {
    
    MNFileManage *mabage = [MNFileManage shareManage];
    NSString *noteName = [mabage createNoteName];
    XCTAssertTrue(noteName.length,@"file name error");
//    NSLog(@"file name %@",noteName);
}

@end
