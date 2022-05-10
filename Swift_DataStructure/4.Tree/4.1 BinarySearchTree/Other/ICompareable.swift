//
//  ICompareable.swift
//  Swift_DataStructure
//
//  Created by 袁昊 on 2022/5/10.
//

import Foundation

protocol ICompareable:Comparable {
    associatedtype T
    func compareTwoValue(val :T) -> Int;
}

