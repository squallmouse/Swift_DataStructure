//
//  TwoWayLinkedList.swift
//  Swift_DataStructure
//
//  Created by 袁昊 on 2022/4/22.
//

import Foundation

class TWNode<T:Comparable> {
    var value : T
    var prevNode : TWNode?
    var nextNode : TWNode?

    init(value: T , prevNode : TWNode? = nil , nextNode : TWNode? = nil){
        self.value = value
        self.prevNode = prevNode
        self.nextNode = nextNode
    }

    deinit{
        print("TWNode -- deinit - \(self.value)")  
    }
    
}



// 从0 开始
// 头节点 和 尾节点的nextNode 指向的就是0 和 最后一位元素
/// <#Description#>
class TwoWayLinkedList<T:Comparable> {
    var count : Int
    var headNode : TWNode<T>
    var tailNode : TWNode<T>

    /// 初始化
    init(){
        self.count = 0
        self.headNode = TWNode.init(value:0 as! T)
        self.tailNode = TWNode.init(value:0 as! T)
    }

    
    /// 判断是否为空
    /// - Returns: 判断整个链表是否为空
    func isEmpty() -> Bool {
        return self.count == 0
    }
    
    
    /// 查找元素在第几位
    /// - Parameter value: 查找的值
    /// - Returns: 返回index, -1 说明没有这个值
    func indexOf(value : T) ->  Int {
        var tempNode : TWNode? = self.headNode.nextNode
        var index = 0
        while let node = tempNode {
            if (node.value == value) {
                return index
            }
            index += 1
            tempNode = tempNode?.nextNode
        }
        return -1
    }
    
    
    /// 清空链表
    func clear() {
        var size = 0
        var node = self.headNode.nextNode
        while let temp = node {
            let nextnode = node?.nextNode
            temp.nextNode = nil
            temp.prevNode = nil
            node = nextnode
            size += 1
        }
        print("释放了\(size)个,链表原有\(self.count)个元素")
        self.count = 0 ;
        self.headNode.nextNode = nil
        self.tailNode.nextNode = nil
    }
    
    
    /// 查找第index 处的元素
    /// - Parameter index: index
    /// - Returns: 返回TWNode
    public func indxOfNode(index:Int) -> TWNode<T>?  {
        guard index < self.count else {
            print("indexOfNode: index 超出范围")
            assert(index < self.count)
            return nil
        }
        if (index < self.count/2) {
            var resNode:TWNode? = self.headNode
            for _ in 0...index {
                resNode = resNode?.nextNode
            }
            return resNode
        }else{
            var resNode:TWNode? = self.tailNode.nextNode
            for _ in index..<self.count-1 {
                resNode = resNode?.prevNode
            }
            return resNode
        }
        
    }
    
    /// 把值插入链表的第index位
    /// - Parameters:
    ///   - index: index
    ///   - value: 值
    func insertNodeAt(index:Int , value:T)  {
        guard index <= self.count else {
            print("插入的位置越界了")
            assert(index <= self.count)
            return
        }
        let insertNode = TWNode.init(value: value)
        
        // 如果是插入在第0位
        if index == 0 {
            let firstNode = self.headNode.nextNode
            insertNode.nextNode = firstNode
            self.headNode.nextNode = insertNode
        }else{
            let prevN = self.indxOfNode(index: index-1)
            let backN : TWNode? = prevN?.nextNode
            prevN?.nextNode = insertNode
            backN?.prevNode = insertNode
            insertNode.prevNode = prevN
            insertNode.nextNode = backN
            
            if (backN == nil){
                // 说明插入到了末尾
                self.tailNode.nextNode = insertNode
            }
        }
        
        self.count += 1
        
    }
    
    
    
    /// 添加元素到最后
    /// - Parameter value: 值
    func append(value:T)  {
        let node = TWNode.init(value: value)
        if self.count == 0 {
            // 说明是一个空的链表
            self.headNode.nextNode = node
            self.tailNode.nextNode = node
        }else{
//            let lastNode = self.indxOfNode(index: self.count-1)
            let lastNode = self.tailNode.nextNode
            lastNode?.nextNode = node
            node.prevNode = lastNode
            self.tailNode.nextNode = node
        }
        self.count += 1
    }

    
    /// 把数组中的值都添加到链表中
    /// - Parameter arr: 数组
    func addWithArr(arr:[T]) {
        for val in arr {
            self.append(value: val)
        }
    }
    
    
    /// 返回制定位数的value
    /// - Parameter index: index
    /// - Returns: value or nil
    func getValueAt(index:Int) -> T? {
        return self.indxOfNode(index: index)?.value
    }
    
    
    /// 设置制定位置的元素值
    /// - Parameters:
    ///   - index: index
    ///   - value: 元素的值
    func setValueAt(index:Int, value:T)  {
        self.indxOfNode(index: index)?.value = value
    }
    
    
    /// 删除第几位元素
    /// - Parameter index: index
    /// - Returns: 删除的元素value
    func removeAt(index:Int) -> T? {
        guard index < self.count else {
            print("removeAt: index 超出范围")
            assert(index < self.count)
            return nil
        }
        let removeNode  = self.indxOfNode(index: index)
        let prevN : TWNode? = removeNode?.prevNode
        let backN : TWNode? = removeNode?.nextNode
        
        if index == 0 {
            self.headNode.nextNode = backN
            backN?.prevNode = nil
        }else{
            prevN?.nextNode = backN
            backN?.prevNode = prevN
            if backN == nil {
                self.tailNode.nextNode = prevN
            }
        }
        
        
        removeNode?.nextNode = nil
        removeNode?.prevNode = nil
        
        self.count -= 1
        return removeNode?.value
    }
    
    
    /// 打印所有值
    func printAll()  {
        var index = 0
        var tempNode = self.headNode.nextNode
        while let temp = tempNode {
            print("第 \(index) 位元素的value = \(temp.value)")
            index += 1
            tempNode = tempNode?.nextNode
        }
    }
}
