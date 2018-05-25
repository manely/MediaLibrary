//
//  Book.swift
//  MediaLibrary
//
//  Created by Mani Hamedani on 5/16/18.
//  Copyright © 2018 Manely. All rights reserved.
//

import Foundation

struct Book {
    var title: String = ""
    var author: String = ""
    var person: Person? = nil
}

extension Book {
    init(title: String, author: String) {
        self.init(title: title, author: author, person: nil)
    }
}
