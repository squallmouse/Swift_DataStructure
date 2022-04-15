//
//  main.swift
//  1.List
//
//  Created by 袁昊 on 2022/3/3.
//

import Foundation

var i = 10;
 
print("-----begin-------\(i)")


let arr = [0,1,2,3,4,5,6,7,8]
let list = LinkedList<Int>.init()
list.addWithArray(arr: arr)

//let node = list.insertNode(index: 9, value: 111)
//print(node?.value ?? 250)
list.removeOf(index: 8)


list.printAllValue()

//list.printAllValue()
