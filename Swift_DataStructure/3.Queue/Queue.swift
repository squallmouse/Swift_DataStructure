//
//  Queue.swift
//  Swift_DataStructure
//
//  Created by 袁昊 on 2022/4/25.
//

import Foundation


//FIFO
class Queue<T:Comparable> {
    // TwoWayLinkedList :
//    headNode.nextNode 指向队头元素
//    tailNode.nextNode 指向队尾元素
    var queue : TwoWayLinkedList<T>
    
    
    init() {
        self.queue = TwoWayLinkedList.init()
    }
    
    func size() -> Int {
        return self.queue.count
    }
    
    func clear()  {
        self.queue.clear()
    }
    
    func isEmpty() -> Bool {
        self.queue.isEmpty()
    }
    

    /// 入队,在队尾添加元素
    /// - Parameter value: <#value description#>
    func enQueue(value:T)  {
        self.queue.append(value: value)
    }


    /// 出队,从队头出队
    /// - Returns: 值 , nil 说明为空队列
    func deQueue() -> T? {
        return self.queue.removeAt(index: 0)
    }
    
    
    /// 获取队列的头元素
    /// - Returns: 值
    func front() -> T? {
        if self.queue.count == 0 {
            print("该队列是空队列")
        }
        return self.queue.indxOfNode(index: 0)?.value
    }
    
    func printAll()  {
        self.queue.printAll()
    }
}

