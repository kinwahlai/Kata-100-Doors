//
//  OneHundredDoorsTests.m
//  OneHundredDoorsTests
//
//  Created by developer on 1/13/14.
//  Copyright (c) 2014 KinWah. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface OneHundredDoorsTests : XCTestCase
{

}
@end

@implementation OneHundredDoorsTests
NSMutableArray * createDoors(int capacity)
{
    NSMutableArray *doors = [NSMutableArray arrayWithCapacity:capacity];
    for (int i = 0; i < capacity; i++) {
        doors[i] = @"closed";
    }
    return doors;
}

void toggleDoor(NSMutableArray *doors, int doorIdx)
{
    if ([doors[doorIdx] isEqualToString:@"closed"]) {
        doors[doorIdx] = @"open";
    } else {
        doors[doorIdx] = @"closed";
    }
}

void passThroughDoors(NSMutableArray *doors,int pass)
{
    for (int i = 1; i <= doors.count; i ++) {
        if (i % pass == 0) {
            toggleDoor(doors, i-1);
        }
    }
}

void printDoorsState(NSMutableArray *doors)
{
    NSString *log;
    for (int i = 1; i <= doors.count; i++) {
        log = [NSString stringWithFormat:@"Door %d is %@",i,doors[i-1]];
        NSLog(log);
    }
}


// #################################
- (void)setUp
{
    [super setUp];
    
}

- (void)tearDown
{
    
    [super tearDown];
}

- (void)testAllDoorsAreClosedInitially
{
    NSMutableArray *doors = createDoors(1);
    XCTAssert(doors.count == 1, @"");
    printDoorsState(doors);
    for (NSString *door in doors) {
        XCTAssertEqual(@"closed", door, @"");
    }
}

- (void)testAllDoorsAreOpenAfter1stPass
{
    NSMutableArray *doors = createDoors(1);
    passThroughDoors(doors, 1);
    printDoorsState(doors);
    for (NSString *door in doors) {
        XCTAssertEqual(@"open", door, @"");
    }
}

- (void)testDoorsMod2AreOpenAfter2stPass
{
    int numOfPass = 2;
    int capacity = 2;
    NSMutableArray *doors = createDoors(capacity);
    for (int i = 1; i <= numOfPass; i++) {
        passThroughDoors(doors, i);
    }
    printDoorsState(doors);
    XCTAssertEqual(@"open", doors[0], @"");
    XCTAssertEqual(@"closed", doors[1], @"");
}

- (void)testDoorsAfter3Pass
{
    int numOfPass = 3;
    int capacity = 6;
    NSMutableArray *doors = createDoors(capacity);
    for (int i = 1; i <= numOfPass; i++) {
        passThroughDoors(doors, i);
    }
    printDoorsState(doors);
    XCTAssertEqual(@"open", doors[0], @"");
    XCTAssertEqual(@"closed", doors[1], @"");
    XCTAssertEqual(@"closed", doors[2], @"");
    XCTAssertEqual(@"closed", doors[3], @"");
    XCTAssertEqual(@"open", doors[4], @"");
}




@end
