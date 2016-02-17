//
//  ViewController.swift
//  Cel2Far
//
//  Created by Ankit Mishra on 17/02/16.
//  Copyright © 2016 Ankit Mishra. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let tempArr = ["Convert Celcius to Fahrenheit"];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK:- Table VIew Data Source and Delegate
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tempArr.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:ConverterCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! ConverterCell
        cell.textLbl.text = tempArr[indexPath.row]
        return cell
    }
    
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Converters"
    }
    

}

