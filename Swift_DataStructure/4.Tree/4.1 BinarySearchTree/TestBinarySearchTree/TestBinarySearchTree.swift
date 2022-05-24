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
    
    func arrassert(arr:Array<Int>)  {
        for index in 0..<arr.count {
            XCTAssert(bst.bstArr[index] == arr[index])
        }
    }
    
    /// 前序遍历测试
    /// 7,4,2,1,3,5,9,8,11,10,12
    func testPreorderTraversal() {
        bst.preorderTraversal()
        let resarr = [7,4,2,1,3,5,9,8,11,10,12]
        arrassert(arr: resarr)
        //
//        let b2 = BinarySearchTree<Int>.init()
//        let r2 = [35, 59, 62, 76, 37, 80, 87, 44, 73, 25, 2, 49, 12, 9, 22]
//        for item in r2 {
//            b2.add(val: item)
//        }
//        b2.preorderTraversal()
//        let r3 = [35, 25, 2, 12, 9, 22, 59, 37, 44, 49, 62, 76, 73, 80, 87]
//        for index in 0..<r3.count {
//            XCTAssert(b2.bstArr[index] == r3[index])
//        }
    }
    func testPreorderTraversalNormal()  {
        bst.preorderTraversalNormal()
        let resarr = [7,4,2,1,3,5,9,8,11,10,12]
        arrassert(arr: resarr)
        
//        let b2 = BinarySearchTree<Int>.init()
//        let r2 = [35, 59, 62, 76, 37, 80, 87, 44, 73, 25, 2, 49, 12, 9, 22]
//        for item in r2 {
//            b2.add(val: item)
//        }
//        b2.preorderTraversalNormal()
//        let r3 = [35, 25, 2, 12, 9, 22, 59, 37, 44, 49, 62, 76, 73, 80, 87]
//        for index in 0..<r3.count {
//            XCTAssert(b2.bstArr[index] == r3[index])
//        }
    }
    
    /// 中序遍历
    /// 1,2,3,4,5,7,8,9,10,11,12
    func testInorderTraversal()  {
        bst.inorderTraversal()
        let resarr = [1,2,3,4,5,7,8,9,10,11,12]
        arrassert(arr: resarr)
    }
    func testInorderTraversalNormal() {
        bst.inorderTraversal()
        let resarr = [1,2,3,4,5,7,8,9,10,11,12]
        arrassert(arr: resarr)
    }
    
    /// 后续遍历
    /// 1,3,2,5,4,8,10,12,11,9,7
    func testPostorderTraversal() -> Void {
        bst.postorderTraversal()
        let resarr = [1,3,2,5,4,8,10,12,11,9,7]
        arrassert(arr: resarr)
    }
    
    func testPostorderTraversalNormal(){
        bst.postorderTraversalNormal()
        let resarr = [1,3,2,5,4,8,10,12,11,9,7]
        arrassert(arr: resarr)
        
        let b2 = BinarySearchTree<Int>.init()
        let r2 = [35, 59, 62, 76, 37, 80, 87, 44, 73, 25, 2, 49, 12, 9, 22]
        for item in r2 {
            b2.add(val: item)
        }
        b2.postorderTraversalNormal()
        let r3 = [9, 22, 12, 2, 25, 49, 44, 37, 73, 87, 80, 76, 62, 59, 35]
        for index in 0..<r3.count {
            XCTAssert(b2.bstArr[index] == r3[index])
        }
    }
    
    ///层序遍历
    ///7、4、9、2、5、8、11、1、3、10、12
    func testLevelOrderTraversal() -> Void {
        bst.levelOrderTraversal()
        let resarr = [7,4,9,2,5,8,11,1,3,10,12]
        arrassert(arr: resarr)
    }
    // 高度
    func testHeight() {
        let h = bst.height(node: bst.rootNode)
        XCTAssert(h == 4)
    }
    
    func testHeightNormal() {
        let h = bst.heightNormal(node: bst.rootNode)
        XCTAssert(h == 4)
    }
    
    func testIsComplete() {
        let arr2 = [7,4,2,1,3,5,9,8,11]
        let bst2 = BinarySearchTree<Int>.init()
        
        for item in arr2 {
            bst2.add(val: item)
        }
        
        let res = bst2.isComplete()
        XCTAssert(res == true)
    }

}
