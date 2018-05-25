//
//  LibraryTest.swift
//  MediaLibraryTest
//
//  Created by Mani Hamedani on 5/25/18.
//  Copyright © 2018 Manely. All rights reserved.
//

import XCTest
@testable import MediaLibrary

class LibraryTest: XCTestCase {
    var library: Library = Library(name: "Test")
    
    override func setUp() {
        super.setUp()
        var person1 = Person()
        var book1 = Book()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testAddBook() {
        let booksCount = library.books.count
        let book = Book(title: "C#", author: "Mani Hamedani")
        library.addBook(book)
        XCTAssertEqual(library.books.count, booksCount + 1)
    }
    
    func testAddPerson() {
        let peopleCount = library.people.count
        let person = Person(name: "Mani Hamedani", age: 45)
        library.addPerson(person)
        XCTAssertEqual(library.people.count, peopleCount + 1)
    }
    
    func testRemoveBook() {
        let booksCount = library.books.count
        guard booksCount >= 0 else {
            return
        }
        let book = library.books.first
        library.removeBook(book!)
        XCTAssertEqual(library.books.count, booksCount - 1)
    }

    func testRemovePerson() {
        let peopleCount = library.people.count
        guard peopleCount >= 0 else {
            return
        }
        let person = library.people.first
        library.removePerson(person!)
        XCTAssertEqual(library.people.count, peopleCount - 1)
    }

}
