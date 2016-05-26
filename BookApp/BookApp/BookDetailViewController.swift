//
//  BookDetailViewController.swift
//  BookApp
//
//  Created by Mason Earl on 5/24/16.
//  Copyright © 2016 trianglez. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var authorTextField: UITextField!
    
    var book: Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let book = book {
            updateWithBook(book)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func saveButtonTapped(sender: AnyObject) {
        if let book = book {
            guard let title = titleTextField.text, author = authorTextField.text else {
                return
            }
            book.title = title
            book.author = author
            self.authorTextField.resignFirstResponder()
        } else {
            guard let title = titleTextField.text, author = authorTextField.text else {
                return
            }
            let book = Book(title: title, author: author)
            BookController.sharedController.addBook(book)
            self.book = book
        }
        self.navigationController?.popViewControllerAnimated(true)
    }
        func textFieldShouldReturn(textField: UITextField) -> Bool {
            titleTextField.resignFirstResponder()
            return true
    }
    
    func updateWithBook(book: Book) {
       self.navigationItem.title = book.title
        authorTextField.text = book.author
        titleTextField.text = book.title
        }
}