//
//  DeQueue.swift
//  Swift_DataStructure
//
//  Created by 袁昊 on 2022/4/25.
//

import Foundation

// 双端队列 头尾都可以 出队 入队
class DeQueue<T:Comparable>: Queue<T> {
    // 只是多个几个方法
    
    
    /// 从队头入队
    /// - Parameter value: value
    func enQueueFront(value:T)  {
        self.queue.insertNodeAt(index: 0, value: value)
    }
    
    
    /// 从队尾出队
    /// - Returns: 值
    func deQueueRear() -> T? {
        return self.queue.removeAt(index: self.queue.count-1)
    }
    
    
    /// 获取队尾元素值
    /// - Returns: 值
    func rear() -> T? {
        if (self.size() == 0) {
            print("队列为空")
        }
        return self.queue.indxOfNode(index: self.queue.count-1)?.value
    }
}
