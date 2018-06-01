//
//  main.swift
//  MediaLibrary
//
//  Created by Mani Hamedani on 5/16/18.
//  Copyright © 2018 Manely. All rights reserved.
//

import Foundation

#if MyFloat

struct MyFloat {
    var value: Float = 0.0
    
    static func + (lhs: MyFloat, rhs: MyFloat) -> MyFloat {
        return MyFloat(value: lhs.value + rhs.value)
    }
    
    static func += (lhs: inout MyFloat, rhs: MyFloat) -> Void {
        lhs.value += rhs.value
    }
}

struct YourFloat {
    var value: Float = 0.0
    
    static func + (lhs: YourFloat, rhs: YourFloat) -> YourFloat {
        
        var lhs = lhs
        lhs += rhs
        return lhs
    }
    
    static func += (lhs: inout YourFloat, rhs: YourFloat) -> Void {
        lhs.value += rhs.value
    }
}

func testMyFloat() {
    
    printTimeElapsedWhenRunningCode(title: "Using MyFloat") {
        for _ in 0...1000_000_000 {
            let f: MyFloat = MyFloat(value:5.4)
            let g = MyFloat(value: 5.2)
            var h = f + g
            h += f
        }
    }
    
    printTimeElapsedWhenRunningCode(title: "Using YourFloat") {
        for _ in 0...1000_000_000 {
            let f: YourFloat = YourFloat(value:5.4)
            let g = YourFloat(value: 5.2)
            var h = f + g
            h += f
        }
    }
    
    
}

#endif

