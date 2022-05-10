//
//  Person.swift
//  Swift_DataStructure
//
//  Created by 袁昊 on 2022/5/10.
//

import Foundation

class Person:ICompareable,aabbccprotocpl {
    static func < (lhs: Person, rhs: Person) -> Bool {
        return lhs.age < rhs.age
    }
    
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.age == rhs.age
    }
    
    
    
    func abc() {
        print("aabbccccc")
    }
    
    typealias T = Person
    
    
    var age : Int = 0
    var name : String = ""
    
    init(age : Int , name : String) {
        self.age = age
        self.name = name
        
    }
    
    func compareTwoValue(val: Person) -> Int {
        return self.age - val.age
    }
    
    
    
}
