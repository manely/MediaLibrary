//
//  Library.swift
//  MediaLibrary
//
//  Created by Mani Hamedani on 5/16/18.
//  Copyright © 2018 Manely. All rights reserved.
//

import Foundation

enum LibraryError: Error {
    case unregisteredBook
    case unregisteredPerson
    
    enum CheckInError: Error {
        case bookNotCheckedOut
    }
}

class Library {
    var name: String = ""
    var listOfPeople: [Person] = [Person]()
    var listOfBooks: [Book] = [Book]()
    
    var people: [Person] {
        return listOfPeople
    }
    
    var books: [Book] {
        return listOfBooks
    }
    
    init(name: String) {
        self.name = name
    }
    
    func addBook(_ book: Book) {
        //        guard !listOfBooks.contains(where: { b in
        //            b.title == book.title
        //        })
        //        else {
        //            return
        //        }
        listOfBooks.append(book)
    }
    
    func addPerson(_ person: Person) {
        listOfPeople.append(person)
    }
    
    func removePerson(_ person: Person) {
        if let index = listOfPeople.index(where: { $0 == person }) {
            listOfPeople.remove(at: index)
        }
    }
    
    func removeBook(_ book: Book) {
        if let index = listOfBooks.index(where: { $0 == book }) {
            listOfBooks.remove(at: index)
        }
    }

    func addBook(from container: [Book]) {
        self.listOfBooks.append(contentsOf: container)
    }
    
    func addPerson(from container: [Person]) {
        self.listOfPeople.append(contentsOf: container)
    }
    
    func checkOut(_ book: inout Book, to person: inout Person) throws {
        if self.contains(book: book) {
            if self.contains(person: person) {
                person.addBook(&book)
            }
            else {
                throw LibraryError.unregisteredPerson
            }
        }
        else {
            throw LibraryError.unregisteredBook
        }
    }
    
    func checkIn(_ book: inout Book) throws -> Person {
        if book.person == nil {
            // book is not checked out before; unable to checkIn
            throw LibraryError.CheckInError.bookNotCheckedOut
        }
        if self.contains(book: book) {
            let index = self.indexOf(person: book.person!)
            var person = listOfPeople[index!]
            try person.removeBook(&book)
            return person
        }
        throw LibraryError.unregisteredBook
    }
    
    func availableBooks() -> [Book] {
        return listOfBooks.filter { $0.person == nil }
    }
    
    func unAvailableBooks() -> [Book] {
        return listOfBooks.filter { $0.person != nil }
    }
    
    func contains(book: Book) -> Bool {
        return listOfBooks.contains(where: { $0 == book })
    }
    
    func contains(person: Person) -> Bool {
        return listOfPeople.contains(where: { $0 == person })
    }
    
    private func indexOf(book: Book) -> Int? {
        return listOfBooks.index { $0 == book }
    }
    
    private func indexOf(person: Person) -> Int? {
        return listOfPeople.index { $0 == person }
    }
}
