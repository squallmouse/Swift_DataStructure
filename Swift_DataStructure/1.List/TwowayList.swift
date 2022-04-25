//
//  TwowayList.swift
//  2.TwowayLinkedList
//
//  Created by 袁昊 on 2020/5/18.
//  Copyright © 2020 袁昊. All rights reserved.
//

import Foundation

class Node<T:Comparable>{
    var value : T
    var prev :Node?
    var next :Node?
    init(value:T) {
        self.value = value
    }
    deinit {
        print("deinit");
    }
    
}
class TwowayList<T:Comparable> {
    var size:Int = 0
      var headNode:Node<T>?//链表的第一个元素
      var tailNode:Node<T>?//链表的最后一个元素
    // MARK:function
    init() {
        
          self.size = 0
          self.headNode = nil
        self.tailNode = nil
      }
    
    /// 判断是否为空
    /// - Returns: 空返回true
    func isEmpty() -> Bool {
        return self.size == 0
    }
    
    /// 查找元素在第几位
    /// - Parameter eleC: 查找的内容
    /// - Returns: 没有返回-1
    func indexOf(val:T) -> Int {
        var count = 0
        var tempNode = self.headNode
        while let tempEle = tempNode {
            if tempEle.value == val {
                return count
            }
            count += 1
            tempNode = tempEle.next
        }
        return -1
    }


    /// 是否存在元素
    /// - Parameter ele: 查找的内容
    /// - Returns: 有就返回true
    func contains(eleC:T) -> Bool {
        return self.indexOf(val: eleC) > -1
    }


    /// 清空链表
    func clear()  {
        self.size = 0
        self.headNode = nil
        self.tailNode = nil
    }
//
//
    /// 把元素插入第几位
    /// - Parameters:
    ///   - index: 第几位
    ///   - ele: node
    func insertNode(index:Int,eleC:T)  {
        if index > self.size {
            print("insertNode index 超出范围")
            return
        }
        var preNode : Node<T>?

        var nextNode : Node<T>?

        let node = Node.init(value: eleC)
        if index == 0 {
            //插入到第一个
            node.next = self.headNode
            self.headNode?.prev = node
            self.headNode = node
        }else{
            preNode = self.indexOfNode(index: index-1)
            nextNode = preNode?.next
            node.next = nextNode
            preNode?.next = node
            node.prev = preNode
//            nextNode?.prev = nil // ??? 这哪里来的?
            nextNode?.prev = node
            if nextNode == nil {
                self.tailNode = node
            }
        }
        self.size += 1

    }

//
    /// 查找指定位数的元素
    /// - Parameter index: 位数
    /// - Returns: node
     func indexOfNode(index:Int) -> Node<T>?{
        if self.size <= index  {
            print("indexOfNode index 超出范围")
            return nil
        }
        var tempNode :Node? = self.headNode
        
        if index <= self.size/2 {
            for _ in 0..<index {
                tempNode = tempNode?.next
            }
        }else{
            tempNode = self.tailNode
            for _ in index..<self.size-1 {
                tempNode = tempNode?.prev
            }
        }
        
        return tempNode
    }

    /// 添加node到最末尾
    /// - Parameter node: 元素
    func append(eleC:T)  {
        let node = Node<T>.init(value: eleC)
        if self.size == 0 {
            self.headNode = node
            self.tailNode = node
        }else{
            let lastNode = self.indexOfNode(index: self.size-1)
            lastNode?.next = node
            node.prev = lastNode
            self.tailNode = node
        }
        self.size += 1
    }


    /// 依次添加数组里的元素到最末尾
    /// - Parameter arr: 数组
    func addWithArr(arr:[T])  {
        for i in 0..<arr.count {
            self.append(eleC: arr[i])
        }
    }


    /// 获取制定位置的元素值
    /// - Parameter index: index
    /// - Returns: 值 超出范围返回nil
    func getEleOfIndex(index:Int) -> T? {
        if index >= self.size {

            return nil
        }
        return self.indexOfNode(index: index)!.value
    }


    /// 设置某个元素的值
    /// - Parameters:
    ///   - index: index
    ///   - eleC: 值
    func setEleOfIndex(index:Int , eleC:T)  {
        if index >= self.size {
            return
        }
        self.indexOfNode(index: index)!.value = eleC
    }


    /// 删除第几个元素
    /// - Parameter index: index
    /// - Returns: 是否删除成功
    func removeIndexOf(index:Int) -> T? {
        if index >= self.size {
            print("超出范围");
            return nil
        }else{
            let removeNode = self.indexOfNode(index: index)
            let prevNode = removeNode?.prev
            let backNode = removeNode?.next
            if index == 0 {
                self.headNode = backNode;
            }else{
                prevNode?.next = backNode
            }
            if backNode == nil{
                self.tailNode = prevNode
            }
            self.size -= 1
            return removeNode?.value
        }
    }


    /// 打印所有的元素值
    func printElements()  {
        var arr : [T] = []
        if self.size == 0 {
            print("list 没有元素")
        }else{
            var node = self.headNode
            for _ in 0..<self.size {
                arr.append(node!.value)
                node = node?.next
            }
         print(arr)
        }
    }
    
}
