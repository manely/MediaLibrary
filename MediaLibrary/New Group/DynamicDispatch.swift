//
//  DynamicDispatch.swift
//  MediaLibrary
//
//  Created by Mani Hamedani on 5/21/18.
//  Copyright © 2018 Manely. All rights reserved.
//

import Foundation

// An objective-c protocol, uses dynamic dispatch
@objc protocol testProtocol {
    @objc func method()
}

// A swift protocol, uses static dispatch
protocol staticProtocol {
    func methodStatic()
}

// Implicitly is @objc
class test: NSObject, testProtocol {
    var name = String()
    
    // Dynamically dispatched because declared in an objective-c protocol
    dynamic func method() {
        print("method")
    }
    
    // Dynamically dispatched because defined as @objc in the NSObject extension below
    override func methodStatic() {
         print("method static in test")
    }
}


extension NSObject: staticProtocol {
    // @objc allows for dynamic dispatch
    @objc func methodStatic() {
        print("method static")
    }
}

func testDynamicDispatch() {
    // using AnyObject is the same as id in objective-c
    let t: AnyObject = test()
    
    if t is testProtocol & staticProtocol {
        t.method()
        t.methodStatic()
    }
    
    if t.conforms(to: testProtocol.self) {
        print("t conforms to testProtocol")
    }
    if t.responds(to: #selector(test.method)) {
        print("t responds to method selector")
    }
    
    let x: Int! = nil
    if x == nil {
        print(x)
    }
    let y: Int? = nil
    if y == nil {
        print(y)
    }
}
