//
//  Library.swift
//  MediaLibrary
//
//  Created by Mani Hamedani on 5/16/18.
//  Copyright © 2018 Manely. All rights reserved.
//

import Foundation

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
        let index = listOfPeople.index { p in
            p.name == person.name
        }
        if (index != nil) {
            listOfPeople.remove(at: index!)
        }
    }
    
    func removeBook(_ book: Book) {
        let index = listOfBooks.index { b in
            b.title == book.title
        }
        if (index != nil) {
            listOfBooks.remove(at: index!)
        }
    }
    
    func checkOut(_ book: Book, to person: Person) {
        let indexOfBook = self.indexOf(book: book)
        let indexOfPerson = self.indexOf(person: person)
        if indexOfBook != nil, indexOfPerson != nil {
            var b = listOfBooks[indexOfBook!]
            var p = listOfPeople[indexOfPerson!]
            b.person = person
            p.books.append(b)
        }
    }
    
    func checkIn(_ book: Book) {
        if book.person == nil {
            // book is not checked out before; unable to checkIn
            return
        }
        if let indexOfBook = self.indexOf(book: book) {
            var b = listOfBooks[indexOfBook]
            
            var p = b.person!
            b.person = nil
            if let indexOfBookInPersonsBooks = p.books.index(where: { b in b.title == book.title }) {
                p.books.remove(at: indexOfBookInPersonsBooks)
            }
        }
        
    }
    
    func availableBooks() -> [Book] {
        return listOfBooks.filter { $0.person == nil }
    }
    
    func unAvailableBooks() -> [Book] {
        return listOfBooks.filter { $0.person != nil }
    }
    
    private func indexOf(book: Book) -> Int? {
        return listOfBooks.index { b in b.title == book.title }
    }
    
    private func indexOf(person: Person) -> Int? {
        return listOfPeople.index { p in p.name == person.name }
    }
}
