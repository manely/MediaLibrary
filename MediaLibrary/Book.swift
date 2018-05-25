//
//  Book.swift
//  MediaLibrary
//
//  Created by Mani Hamedani on 5/16/18.
//  Copyright © 2018 Manely. All rights reserved.
//

import Foundation

struct Book: Equatable {
    
    var title: String = ""
    var author: String = ""
    var person: Person? = nil
    
    static func == (lhs: Book, rhs: Book) -> Bool {
        return lhs.title == rhs.title && lhs.author == rhs.author
    }
    
}

extension Book {
    init(title: String, author: String) {
        self.init(title: title, author: author, person: nil)
    }
}
