//
//  ViewController.swift
//  tableViewMiniApp
//
//  Created by Jonah Whitney on 2/28/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var text = ""
    var currentOwnerDetails: [[String]] = []
    let indexArray = ["🟥R", "⬜️W"]
    
    let cellID = "cellID"

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textView.text = text
        // print(currentOwnerDetails) - testing that array was passed from TableViewController
        
        // setting up table view
        tableView.dataSource = self
        tableView.delegate = self
        tableView.sectionIndexColor = UIColor.white
        tableView.sectionIndexBackgroundColor = UIColor.black
        tableView.sectionIndexTrackingBackgroundColor = UIColor.darkGray
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentOwnerDetails[section].count - 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellID")
        if (cell == nil) {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cellID")
        }
        cell?.textLabel?.text = currentOwnerDetails[indexPath.section][indexPath.row + 1]
        
        return cell!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return currentOwnerDetails.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return currentOwnerDetails[section][0]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return indexArray
    }


}

