//
//  main.swift
//  2.Stack
//
//  Created by 袁昊 on 2022/4/25.
//

import Foundation

print("Hello, World!")


let stack = YHStack<Int>.init()

stack.addWithArr(arr: [0,1,2,3,4,5,6,7,8,9])
stack.pop()
stack.pop()
stack.clear()
stack.push(value: 100)
stack.printAll()



