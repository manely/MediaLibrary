//
//  Person.swift
//  MediaLibrary
//
//  Created by Mani Hamedani on 5/16/18.
//  Copyright © 2018 Manely. All rights reserved.
//

import Foundation

struct Person {
    var name: String = ""
    var age: Int8 = 18
    var books: [Book] = []
    
    func indexOf(book: Book) -> Int? {
        return self.books.index(where: { b in b.title == book.title })
    }
    
}

