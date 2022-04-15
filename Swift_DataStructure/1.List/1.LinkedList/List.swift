//
//  List.swift
//  Swift_DataStructure
//
//  Created by 袁昊 on 2022/4/15.
//

import Foundation


class ListNode<T:Comparable>{
    var value : T
    var nextNode : ListNode?
    
    init(value : T , nextNode : ListNode? = nil) {
        self.value = value
        self.nextNode = nextNode
    }
    
    deinit {
        print("deinit -- value:\(self.value)")
    }
}


/// 链表元素从 0 开始
class LinkedList<T:Comparable>{
    var count : Int
    var headNode : ListNode<T>?
    
    
    /// 链表初始化
    /// - Parameter headNode: 第一个节点
    init(headNode:ListNode<T>? = nil) {
        self.count = 0
        self.headNode = headNode
    }
    
    
    /// 判断链表是否为空
    /// - Returns: 空返回true
    func isEmpty() -> Bool {
        return self.count == 0
    }
    
    
    /// 查找元素在第几位
    /// - Parameter value: 要查找的元素值
    /// - Returns: 没找到返回 -1
    func indexOf(value : T) -> Int {
        var index = -1;
        var tempNode = self.headNode ?? nil
        while let temp = tempNode {
            index += 1
            if temp.value == value {
                return index
            }
            tempNode = temp.nextNode
        }
        return -1
    }
    
    
    /// 元素知否在链表中
    /// - Parameter value: 元素值
    /// - Returns: 存在返回true
    func contains(value:T) -> Bool {
        return self.indexOf(value: value) > -1
    }
    
    
    /// 清空链表
    /// - Returns: void
    func clear() -> Void {
        self.headNode = nil
        self.count = 0
    }
    
    
    /// 在index处插入value
    /// - Parameters:
    ///   - index: 插入位置
    ///   - value: 值
    /// - Returns: 成功返回 true
    func insertNode(index:Int, value:T) -> Bool {
        guard (index <= self.count) else {
            print("插入的node 越界了...")
            assert(index < self.count)
            return false
        }
        var preNode:ListNode<T>? = self.headNode // 前一个node
        var nextNode:ListNode<T>? = nil // 后一个node
        let node = ListNode.init(value: value)
        if (index == 0) {
            nextNode = preNode
            node.nextNode = nextNode
            self.headNode = node
        }else{
//            for _ in 0..<index {
//                preNode = preNode!.nextNode
//            }
            preNode = self.indexOfNode(index: index-1)
            nextNode = preNode?.nextNode
            preNode?.nextNode = node
            node.nextNode = nextNode
        }
        self.count += 1
        return true
    }
    
    
    /// 查找第index位的node
    /// - Parameter index: index
    /// - Returns: ListNode
    func indexOfNode(index:Int) -> ListNode<T>? {
        guard (index < self.count) else {
            print("index 越界了...")
            assert(index > self.count)
            return nil
        }
        var resNode = self.headNode
        for _ in 0..<index {
            resNode = resNode?.nextNode
        }
        return resNode
    }
    
    
    /// 添加到最后
    /// - Parameter value: 值
    func append(value:T) {
        let node = ListNode.init(value: value)
        if (self.count == 0) {
            self.headNode = node
        }else{
            let lastNode = self.indexOfNode(index: self.count-1)
            lastNode?.nextNode = node
        }
        self.count += 1
    }
    
    
    /// 把数组中的元素依次添加到链表中
    /// - Parameter arr: 数组
    func addWithArray(arr:Array<T>)  {
        for index in 0..<arr.count {
            self.append(value: arr[index])
        }
    }
    
    
    /// 返回index处的值
    /// - Parameter index: 第几个
    /// - Returns: 值
    func getValueOfIndex(index:Int) -> T {
        let res = self.indexOfNode(index: index)!.value
        return res
    }
    
    
    /// 设置index处元素的值
    /// - Parameters:
    ///   - index: index
    ///   - value: 值
    func setValueOfIndex(index:Int, value:T) {
        self.indexOfNode(index: index)!.value = value
    }
    
    
    /// 删除第几个元素
    /// - Parameter index: index
    func removeOf(index:Int)  {
        guard (index < self.count) else {
            print("删除元素越界了...")
            assert(index < self.count)
            return
        }
        if (index == 0) {
            self.headNode = self.headNode?.nextNode
        }else{
            let preNode = self.indexOfNode(index: index-1)
            preNode?.nextNode = preNode?.nextNode?.nextNode
        }
        self.count -= 1
    }
    
    
    /// 打印所有的元素值
    func printAllValue()  {
        var tempNode = self.headNode
        var count = -1
        while let temp = tempNode {
            count += 1
            print("\(count) : value = \(temp.value)")
            tempNode = tempNode?.nextNode
        }
    }
    
}
