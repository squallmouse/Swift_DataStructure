//
//  TestTwoWayList.swift
//  TestTwoWayList
//
//  Created by 袁昊 on 2022/4/25.
//

import XCTest

//@testable import

class TestTwoWayList: XCTestCase {

    var list :TwoWayLinkedList<Int> = TwoWayLinkedList<Int>.init();
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
//         list = TwoWayLinkedList<Int>.init();
        XCTAssert(list.isEmpty())
        list.addWithArr(arr: [0,1,2,3,4,5,6,7,8,9])
        list.printAll()
        XCTAssert(list.count == 10)
        
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    
    // MARK: -  测试
    func testIndexOf() {
        let res1 = list.indexOf(value: 0)
        XCTAssert(res1 == 0)
        
        let res2 = list.indexOf(value: 3)
        XCTAssert(res2 == 3)
        
        let res3 = list.indexOf(value: 9)
        XCTAssert(res3 == 9)
    }
    
    func testClear()  {
        list.clear()
        XCTAssert(list.count == 0)
    }

    func testIndexOfNode() {
        XCTAssert(list.indxOfNode(index: 0)?.value == 0)
        XCTAssert(list.indxOfNode(index: 4)?.value == 4)
        XCTAssert(list.indxOfNode(index: 9)?.value == 9)
//        XCTAssert(list.indxOfNode(index: 10)?.value == 0)
        
    }
    
    func testInsertNodeAt0()  {
        var size = list.count
        list.insertNodeAt(index: 0, value: -1)
        XCTAssert(size+1 == list.count)
        XCTAssert(list.getValueAt(index: 0) == -1)
        
    }
    func testInsertNodeAt4()  {
        list.insertNodeAt(index: 4, value: -1)
        XCTAssert(list.getValueAt(index: 4) == -1)
    }
    func testInsertNodeAt9()  {
        list.insertNodeAt(index: 9, value: -1)
        XCTAssert(list.getValueAt(index: 9) == -1)
    }
    func testInsertNodeAt10()  {
        list.insertNodeAt(index: 10, value: -1)
        XCTAssert(list.getValueAt(index: 10) == -1)
    }
    
    func testSetValueAt() {
        list.setValueAt(index: 0, value: 100)
        XCTAssert(list.getValueAt(index: 0) == 100)
    }
    
    func testRemoveAt0()   {
        XCTAssert(list.removeAt(index: 0) == 0)
        XCTAssert(list.getValueAt(index: 0) == 1)
        list.insertNodeAt(index: 0, value: 0)
        XCTAssert(list.removeAt(index: list.count-1) == 9)
        XCTAssert(list.getValueAt(index: list.count-1) == 8)
    }
}
