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
    var library: Library = Library()
    
    override func setUp() {
        super.setUp()
        var person1 = Person()
        var book1 = Book()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testAddBook() {
        let booksCount = library.listOfBooks.count
        let book = Book(title: "C#", author: "Mani Hamedani")
        library.addBook(book)
        XCTAssertEqual(library.listOfBooks.count, booksCount + 1)
    }
    
    func testAddPerson() {
        let peopleCount = library.listOfPeople.count
        let person = Person(name: "Mani Hamedani", age: 45)
        library.addPerson(person)
        XCTAssertEqual(library.listOfPeople.count, peopleCount + 1)
    }
    
    func testRemoveBook() {
        let booksCount = library.listOfBooks.count
        guard booksCount >= 0 else {
            return
        }
        let book = library.listOfBooks.first
        library.removeBook(book!)
        XCTAssertEqual(library.listOfBooks.count, booksCount - 1)
    }

    func testRemovePerson() {
        let peopleCount = library.listOfPeople.count
        guard peopleCount >= 0 else {
            return
        }
        let person = library.listOfPeople.first
        library.removePerson(person!)
        XCTAssertEqual(library.listOfPeople.count, peopleCount - 1)
    }

}
