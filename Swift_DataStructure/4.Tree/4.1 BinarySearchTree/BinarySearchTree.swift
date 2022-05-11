//
//  BinarySearchTree.swift
//  Swift_DataStructure
//
//  Created by 袁昊 on 2022/5/6.
//

import Foundation

/// 比较的方法
protocol BTCompare {
//    associatedtype E:Comparable // 泛型
    
    /// 比较两个数的大小
    /// - Parameters:
    ///   - val1: 第一个数
    ///   - val2: 第一个数
    /// - Returns: <0 , 1<2 ; =0 , 1=2; >0,1>2;
    func compareTwoVal<E:Comparable>(val1 :E , val2 :E) -> Int;
}
 
class TreeNode<T:Comparable>{
    var value : T
    var left : TreeNode?
    var right : TreeNode?
    var parent : TreeNode? // 只有根节点才没有父节点
    
    
    init(val : T, leftNode : TreeNode? = nil, rightNode : TreeNode? = nil , parentNode : TreeNode? = nil ) {
        self.value = val
        self.left = leftNode
        self.right = rightNode
        self.parent = parentNode
    }
    
    deinit {
        print("TreeNode deinit -- value = \(self.value)")
    }
    
}


// 必须要有根节点
class BinarySearchTree<T:Comparable>{
    
    // 一个私有的比较器类 生成的树 左小右大
    private class Compartor:BTCompare{
        func compareTwoVal<E>(val1: E, val2: E) -> Int where E : Comparable {
            if (val1 < val2) {
                return -1
            }else if (val1 > val2){
                return 1
            }else{
                return 0
            }
        }
        
    }
    
    var count : Int
    var rootNode : TreeNode<T>? // 根节点
    var compartor : BTCompare = Compartor.init(); // 默认的比较器; 可以重写比较器类
    var bstArr = Array<T>.init()
    
    init(rootNodeVal : T){
        self.rootNode = TreeNode.init(val: rootNodeVal)
        self.count = 1
    }
    
    init() {
        self.count = 0
    }
}

// MARK: -  二叉搜索树的方法
extension BinarySearchTree{
    /// 元素的数量
    func size() -> Int {
        return self.count
    }
    
    /// 是否为空
    func isEmpty() -> Bool {
        return self.count == 0
    }
    
    /// 清空所有元素
    func clear()  {
        
    }
    
    /// 添加元素 , 如果是已有的元素就覆盖
    func add(val : T)  {
        let newNode = TreeNode.init(val: val)
        // 如果是一个空树
        if self.rootNode == nil {
            self.rootNode = newNode
            self.count += 1
            return
        }
        // 正常添加节点
        var node = self.rootNode
        var parentNode = self.rootNode
        
        while node != nil {
            parentNode = node
            let res = self.compartor.compareTwoVal(val1: val, val2: node!.value)
            if res < 0 {
                node = node?.left
            }else if (res > 0){
                node = node?.right
            }else{
                node?.value = newNode.value
                return
            }
            
        }
        
        // add
        let res = self.compartor.compareTwoVal(val1: val, val2: parentNode!.value)
        newNode.parent = parentNode
        if res < 0 {
            parentNode?.left = newNode
        }else {
            parentNode?.right = newNode
        }
        
        // 数量加1
        self.count += 1
        
    }
    
    /// 删除元素
    func remove(val : T)  {
        
    }
    
    /// 是否包含某元素
    func contains(val :T) -> Bool {
        
        return true;
    }
    
    
    
}



// MARK: -  二叉搜索树的遍历方法
extension BinarySearchTree {
    enum Traversal {
        case preeorder /// 前序遍历
        case inorder /// 中序遍历
        case postorder /// 后序遍历
        case levelOrder /// 层序遍历
    }
    
    
    
/// 前序遍历
    func preorderTraversal() {
        self.bstArr.removeAll()
        if self.rootNode == nil {
            print("这是一个空的  BinarySearchTree ")
            return
        }
        self.preorderTraversal2(node: self.rootNode)
    }
    
    //
    func preorderTraversal2(node:TreeNode<T>?) {
        if (node == nil){
            return
        }
        
        print("\(node!.value)")
        self.bstArr.append(node!.value)
        preorderTraversal2(node: node?.left)
        preorderTraversal2(node: node?.right)
    }
    
    // 前序遍历 非递归
    // 利用栈
    func preorderTraversalNormal()  {
        self.bstArr.removeAll()
        if self.rootNode == nil {
            print("这是一个空的  BinarySearchTree ")
            return
        }
        let stack = YHStack<TreeNode<T>>.init()
        var node:TreeNode<T>? = self.rootNode
        stack.push(value:node! )
        while (!stack.isEmpty()){
            node = stack.pop()
            print("\(node!.value)")
            self.bstArr.append(node!.value)
            if node?.right != nil {
                stack.push(value: node!.right!)
            }
            if node?.left != nil {
                stack.push(value: node!.left!)
            }
        }
        
    }
    
/// 中序遍历
    func inorderTraversal()  {
        self.bstArr.removeAll()
        if self.rootNode == nil {
            print("这是一个空的  BinarySearchTree ")
            return
        }
        inorderTraversal2(node: self.rootNode)
            
    }
    
    func inorderTraversal2(node:TreeNode<T>?) -> Void {
        if node == nil {
            return
        }
        inorderTraversal2(node: node?.left)
        print(node!.value)
        self.bstArr.append(node!.value)
        inorderTraversal2(node: node?.right)
    }
    //中须遍历  非递归
    func inorderTraversalNormal(){
        self.bstArr.removeAll()
        if self.rootNode == nil {
            print("这是一个空的  BinarySearchTree ")
            return
        }

        let stack = YHStack<TreeNode<T>>.init()
        var node : TreeNode<T>? = self.rootNode

        stack.push(value: node!)

        while (!stack.isEmpty()) {
            if (node == nil) {
                node = stack.pop()
                print(node!.value)
                self.bstArr.append(node!.value)
                node = node?.right // ***
            }else{
                if (node!.left != nil) {
                    stack.push(value: node!.left!)
                }
            }
        }
        
    }
    
    
/// 后续遍历
    func postorderTraversal()  {
        self.bstArr.removeAll()
        if self.rootNode == nil {
            print("这是一个空的  BinarySearchTree ")
            return
        }
        postorderTraversal2(node: self.rootNode)
    }
    
    func postorderTraversal2(node:TreeNode<T>?)  {
        if  node == nil {
            return
        }
        postorderTraversal2(node: node?.left)
        postorderTraversal2(node: node?.right)
        print("\(node!.value)")
        self.bstArr.append(node!.value)
    }
    
    // 后序遍历非递归
    func postorderTraversalNormal(){
        self.bstArr.removeAll()
        if self.rootNode == nil {
            print("这是一个空的  BinarySearchTree ")
            return
        }
        // 如果栈顶节点是叶子节点
        //或上一次访问的是栈顶节点的子节点 pop
        let stack = YHStack<TreeNode<T>>.init()
        var node:TreeNode<T>? = self.rootNode!
        var topNode : TreeNode<T>?
        var preTopNode : TreeNode<T>? // 上一次的节点
        stack.push(value: node!)
        
        while (!stack.isEmpty()) {
            topNode = stack.pop()
            if (topNode?.left == nil &&
                topNode?.right == nil) {
                // 说明栈顶元素是叶子节点
                preTopNode = topNode
                print(topNode!.value)
                self.bstArr.append(topNode!.value)
            }else if (preTopNode?.parent === topNode){
                // 上一次是叶子节点
                preTopNode = topNode
                print(topNode!.value)
                self.bstArr.append(topNode!.value)
                
            }else{
                node = topNode!
                stack.push(value: node!)
                if node?.right != nil {
                    stack.push(value: node!.right!)
                }
                if node?.left != nil {
                    stack.push(value: node!.left!)
                }
                
            }
            
        }
    }
    
/// 层序遍历
    func levelOrderTraversal()  {
        self.bstArr.removeAll()
        if self.rootNode == nil {
            print("这是一个空的  BinarySearchTree ")
            return
        }
        
//        let queue = Queue<TreeNode<T>>.init()
        //队列
        var queue = Array<TreeNode<T>>.init()
        var node : TreeNode<T>? = self.rootNode
        queue.append(node!)
        
        while (queue.count != 0) {
            node = queue[0]
            print(node!.value)
            self.bstArr.append(node!.value)
            if (node?.left != nil) {
                queue.append(node!.left!)
            }
            if (node!.right != nil) {
                queue.append(node!.right!)
            }
            queue.remove(at: 0)
            
        }
    }
    
    
}
