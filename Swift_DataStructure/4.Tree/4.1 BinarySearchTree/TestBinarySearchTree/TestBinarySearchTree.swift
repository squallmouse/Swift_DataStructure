//
//  TestBinarySearchTree.swift
//  TestBinarySearchTree
//
//  Created by 袁昊 on 2022/5/10.
//

import XCTest

class TestBinarySearchTree: XCTestCase {
    let arr = [7,4,2,1,3,5,9,8,11,10,12]
    let bst = BinarySearchTree<Int>.init()
    
        
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        for item in arr {
            bst.add(val: item)
        }
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSize()  {
        print(bst.size())
        XCTAssert(bst.size() == arr.count, "是错误的时候会打印!!!")
    }
    
    /// 前序遍历测试
    /// 7,4,2,1,3,5,9,8,11,10,12
    func testPreorderTraversal() {
        bst.preorderTraversal()
    }
    func testPreorderTraversalNormal()  {
        bst.preorderTraversalNormal()
    }
    
    

}
