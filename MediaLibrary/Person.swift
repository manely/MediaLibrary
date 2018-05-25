//
//  Person.swift
//  MediaLibrary
//
//  Created by Mani Hamedani on 5/16/18.
//  Copyright © 2018 Manely. All rights reserved.
//

import Foundation

struct Person: Equatable {
    var name: String = ""
    var age: Int8 = 18
    var books: [Book] = []
    
    func indexOf(book: Book) -> Int? {
        return self.books.index(where: { b in b.title == book.title })
    }
    
    mutating func addBook(_ book: inout Book) {
        self.books.append(book)
        book.person = self
    }
    
    mutating func removeBook(_ book: inout Book) throws {
        if let index = self.indexOf(book: book) {
            self.books.remove(at: index)
            book.person = nil
        }
        else {
            throw LibraryError.CheckInError.bookNotCheckedOut
        }
    }
    
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name && lhs.age == rhs.age
    }
}

extension Person {
    init(name: String, age: Int8) {
        self.init(name: name, age: age, books: [])
    }
}
