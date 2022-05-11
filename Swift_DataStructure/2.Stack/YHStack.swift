//
//  YHStack.swift
//  Swift_DataStructure
//
//  Created by 袁昊 on 2022/4/25.
//

import Foundation


class YHStack<T>{
    
    private var arr : Array<T>  = []
    private var currentPoint : Int // 指向栈顶
    
    init() {
        self.currentPoint = -1
    }
    
    func isEmpty() -> Bool {
        return self.currentPoint == -1
    }
    
    func push(value:T)  {
        currentPoint += 1
        if self.arr.count >= currentPoint+1 {
            self.arr[currentPoint] = value
        }else{
            self.arr.append(value)
        }
        
    }
    
    func pop() -> T {
        guard self.currentPoint >= 0 else {
            print("栈中已经没有值了,超出了范围")
            assert(self.currentPoint >= 0)
            return 0 as! T
        }
        
        let res = self.arr[currentPoint]
        currentPoint -= 1
        return res
    }
    
    func clear()  {
        self.arr = []
        self.currentPoint = -1
    }
    
    func addWithArr(arr:[T])  {
        for item in arr {
            self.push(value: item)
        }
    }
    
    
    func printAll()  {
        if currentPoint == -1 {
            print("空空")
            return
        }
        for index in 0...currentPoint{
            print("第\(index)个的value = \(self.arr[index])")
        }
    }
}

