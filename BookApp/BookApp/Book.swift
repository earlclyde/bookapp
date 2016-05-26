//
//  Book.swift
//  BookApp
//
//  Created by Mason Earl on 5/24/16.
//  Copyright © 2016 trianglez. All rights reserved.
//

import Foundation

class Book: Equatable {

private let titleKey = "title"
private let authorKey = "author"

    var title: String
    var author: String

    init(title: String, author: String) {
    
        self.title = title
        self.author = author }
   
    var dictionaryCopy: [String: AnyObject] {
        return [titleKey: title, authorKey: author] }
    init?(dictionary: [String: AnyObject]) {
        guard let title = dictionary[titleKey] as? String,
            author = dictionary[authorKey] as? String else { return nil }
        self.title = title
        self.author = author }}
func ==(lhs: Book, rhs: Book) -> Bool {
    return ObjectIdentifier(lhs) == ObjectIdentifier(rhs) }
