//
//  Student.swift
//  Swift_DataStructure
//
//  Created by 袁昊 on 2022/5/10.
//

import Foundation

protocol aabbccprotocpl {
    func abc()
        
    
}

class Student{
    
    var age : Int
    
    var com : aabbccprotocpl?
    
    init(age : Int) {
        self.age = age
    }
    
    func pty()  {
        self.com?.abc()
    }
    
    
}
