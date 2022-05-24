//
//  main.swift
//  BinarySearchTree
//
//  Created by 袁昊 on 2022/5/6.
//

import Foundation

print("Hello, World! Binary search tree!!")


let arr = [7,4,2,1,3,5,9,8,11,10,12]
let bst = BinarySearchTree<Int>.init()

for item in arr {
    bst.add(val: item)
}

bst.preorderTraversal()

