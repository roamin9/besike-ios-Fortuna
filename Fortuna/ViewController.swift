//
//  ViewController.swift
//  Fortuna
//
//  Created by Johnson Zhou on 10/17/14.
//  Copyright (c) 2014 roamin9.me. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func rootViewTapped(sender: UITapGestureRecognizer) {
        displayRandomQuotes()
    }
    @IBOutlet weak var quotationTextView: UITextView!
    
    var delegate: AppDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        println("viewDidLoad quotationTextView: \(quotationTextView)")
        
        delegate = UIApplication.sharedApplication().delegate as AppDelegate
        quotationTextView.editable = false
        quotationTextView.selectable = false
        displayRandomQuotes()
    }
    
    override func awakeFromNib() {
        // The super method doesn't do anything, but we call it anyway
        super.awakeFromNib()
        
        println("awakeFromNib quotationTextView: \(quotationTextView)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayRandomQuotes() {
        var quotes: [String]
        if arc4random_uniform(2) == 0 {
            quotes = delegate.positiveQuotes
        } else {
            quotes = delegate.negativeQuotes
        }
        let index = Int(arc4random_uniform(UInt32(quotes.count)))
        let quote = quotes[index]
        quotationTextView.text = quote
    }



}

