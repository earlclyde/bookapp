//
//  BookController.swift
//  BookApp
//
//  Created by Mason Earl on 5/24/16.
//  Copyright © 2016 trianglez. All rights reserved.
//

import Foundation

class BookController {

    static let sharedController = BookController()
    var books: [Book]
    private let booksKey = "books"

    init() {
        self.books = []
    loadFromPersistentStorage() }
 
    func addBook(book: Book){
        books.append(book)
        saveToPersistentStorage() }
    
    func removeBook(book: Book){
        if let index = books.indexOf(book){
           books.removeAtIndex(index)
            saveToPersistentStorage() }}
        
        func saveToPersistentStorage() {
            NSUserDefaults.standardUserDefaults().setObject(books.map{$0.dictionaryCopy}, forKey: booksKey)}
        
        func loadFromPersistentStorage() {
            guard let booksDictionaryArray = NSUserDefaults.standardUserDefaults().objectForKey(booksKey) as? [[String: AnyObject]] else { return }
            books = booksDictionaryArray.flatMap{Book(dictionary: $0)}}
        }
    