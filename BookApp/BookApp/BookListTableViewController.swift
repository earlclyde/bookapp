//
//  BookListTableViewController.swift
//  BookApp
//
//  Created by Mason Earl on 5/24/16.
//  Copyright © 2016 trianglez. All rights reserved.
//

import UIKit

class BookListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return BookController.sharedController.books.count ?? 0
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("bookCell", forIndexPath: indexPath)
        let book = BookController.sharedController.books[indexPath.row]
        cell.textLabel?.text = book.title
        cell.detailTextLabel?.text = book.author

        return cell
    }
 
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let bookToDelete = BookController.sharedController.books[indexPath.row]
            BookController.sharedController.removeBook(bookToDelete)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }    
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toShowEntry" {
            if let detailViewController = segue.destinationViewController as? BookDetailViewController,
                let selectedIndex = tableView.indexPathForSelectedRow?.row {
                let bookEntry = BookController.sharedController.books[selectedIndex]
                detailViewController.book = bookEntry
            }
        }
        
    }

}
