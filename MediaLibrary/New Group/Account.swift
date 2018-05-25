//
//  Account.swift
//  MediaLibrary
//
//  Created by Mani Hamedani on 5/19/18.
//  Copyright © 2018 Manely. All rights reserved.
//

import Foundation


class AccountInnerData {
    var id = 0
    var name = ""
    var value: Double = 0.0
    // TODO: currently I have not found any way to set `isShared` property.
    // It must be set when client code calls add(value:) method on Account type.
    var isShared = false
    
    
    init(id: Int, name: String, value: Double) {
        self.id = id
        self.name = name
        self.value = value
    }
}

// This class is written to show how Array type is implemented as a value type in Swift.
struct Account: CustomStringConvertible {
    let data: AccountInnerData
    
    //    var data: AccountInnerData {
    //        get {
    //            return _data
    //        }
    //        set {
    //            _data.isShared = true
    //        }
    //    }
    
    init(id: Int, name: String, value: Double) {
        data = AccountInnerData(id: id, name: name, value: value)
    }
    
    //    init(_ copyFrom: Account) {
    ////        _data = copyFrom.data
    ////        _data.isShared = true
    //    }
    
    var description: String {
        return String(String(data.id) + " " + data.name + " " + String(data.value))
    }
    
    mutating func add(value: Double) {
        if (data.isShared) {
            self.separateFromSharedInstances()
        }
        data.value += value
    }
    
    mutating func separateFromSharedInstances() {
        self = Account(id: self.data.id, name: self.data.name, value: self.data.value)
    }
}

func payAmount(account: Account) {
    var local = account
    print(account)
    local.add(value: 10)
}


func testAccount() {
    let a: Account = Account(id: 1, name: "mani", value: 2.3)
    payAmount(account: a)
    print(a)
}
