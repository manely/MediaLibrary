//
//  LibraryTest.swift
//  MediaLibraryTest
//
//  Created by Mani Hamedani on 5/25/18.
//  Copyright © 2018 Manely. All rights reserved.
//

import XCTest
@testable import MediaLibrary

typealias CheckedOutItem = (book: Book, person: Person)

class LibraryTest: XCTestCase {
    var library: Library = Library(name: "Test")
    
    override func setUp() {
        super.setUp()
        self.fillLibrary()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    private func fillLibrary() {
        let person1 = Person(name: "Mani Hamedani", age: 44)
        let person2 = Person(name: "Poopak Shirkhani", age: 40)
        let person3 = Person(name: "Manely Hamedani", age: 14)
        let book1 = Book(title: "Swift Programming Language", author: "Mani Hamedani")
        let book2 = Book(title: "Cocoa Design Patterns", author: "Mani Hamedani")
        let book3 = Book(title: "Cocoa Programming", author: "Mani Hamedani")
        
        self.library.addBook(from: [book1, book2, book3])
        self.library.addPerson(from: [person1, person2, person3])
    }
    
    private func checkOut(bookIndex: Int, personIndex: Int) -> CheckedOutItem {
//        guard 0...2 ~= bookIndex else {
//            return
//        }
        guard case 0...2 = bookIndex, case 0...2 = personIndex else {
            fatalError("bookIndex or personIndex not in range")
        }
        var person = library.people[personIndex]
        var book = library.books[bookIndex]
        XCTAssertNil(book.person)
        XCTAssertEqual(person.books.count, 0)
        
        XCTAssertNoThrow(try library.checkOut(&book, to: &person))
        return (book, person)
    }
    
    func testAddBook() {
        let booksCount = library.books.count
        let book = Book(title: "C#", author: "Mani Hamedani")
        library.addBook(book)
        XCTAssertEqual(library.books.count, booksCount + 1)
        XCTAssertEqual(library.books.last, book)
    }
    
    func testAddPerson() {
        let peopleCount = library.people.count
        let person = Person(name: "Mani Hamedani", age: 45)
        library.addPerson(person)
        XCTAssertEqual(library.people.count, peopleCount + 1)
        XCTAssertEqual(library.people.last, person)
    }
    
    func testRemoveBook() {
        let booksCount = library.books.count
        guard booksCount > 0 else {
            return
        }
        let book = library.books.first
        library.removeBook(book!)
        XCTAssertEqual(library.books.count, booksCount - 1)
    }

    func testRemovePerson() {
        let peopleCount = library.people.count
        guard peopleCount > 0 else {
            return
        }
        let person = library.people.first
        library.removePerson(person!)
        XCTAssertEqual(library.people.count, peopleCount - 1)
    }

    fileprivate func testAvailableBooks(whenAreCheckedOut number: Int) {
    }
    
    func testCheckOut() {
        let (book, person) = self.checkOut(bookIndex: 0, personIndex: 1)
        XCTAssertNotNil(book.person)
        XCTAssertEqual(book.person, person)
        XCTAssertEqual(person.books.count, 1)
        XCTAssertEqual(person.books.last, book)
        testAvailableBooks(whenAreCheckedOut: 1)
    }
    
    func testCheckIn() {
//        var (book, _) = self.checkOut(bookIndex: 1, personIndex: 2)
//        let person = try! library.checkIn(&book)
//        XCTAssertNil(book.person)
//        XCTAssertEqual(person.books.count, 0)
//        XCTAssertEqual(library.availableBooks(), library.books)
    }
    
    func testCheckOutUnRegisteredBook() {
        var book = Book(title: "UnRegistered Book", author: "Unknown Author")
        var person = library.people.first!
        XCTAssertThrowsError(try library.checkOut(&book, to: &person), "Should throw LibraryError.unregisteredBook") { error in
            XCTAssertEqual(error as? LibraryError, LibraryError.unregisteredBook)
        }
    }
    
    func testCheckOutUnRegisteredPerson() {
        var person = Person(name: "UnRegistered Person", age: 0)
        var book = library.books.first!
        XCTAssertThrowsError(try library.checkOut(&book, to: &person), "Should throw LibraryError.unregisteredPerson") { error in
            XCTAssertEqual(error as? LibraryError, LibraryError.unregisteredPerson)
        }
    }
    
    func testCheckInUnRegisteredBook() {
        var book = Book(title: "UnRegistered Book", author: "Unknown Author")
        var person = library.people.first!
        person.addBook(&book)
        XCTAssertThrowsError(try library.checkIn(&book), "Should throw LibraryError.unregisteredBook") { error in
            XCTAssertEqual(error as? LibraryError, LibraryError.unregisteredBook)
        }
    }
    
    func testCheckInBookNotCheckedOut() {
        var book = library.books.first!
        XCTAssertThrowsError(try library.checkIn(&book), "Should throw LibraryError.CheckInError.bookNotCheckedOut") { error in
            XCTAssertEqual(error as? LibraryError.CheckInError, LibraryError.CheckInError.bookNotCheckedOut)
        }
    }
    
}
