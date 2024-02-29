//
//  TableViewController.swift
//  tableViewMiniApp
//
//  Created by Jonah Whitney on 2/28/24.
//

import UIKit

class TableViewController: UITableViewController {
    
    let lockerOwners = ["Owner 1", "Owner 2", "Owner 3", "Owner 4", "Owner 5", "Owner 6", "Owner 7", "Owner 8", "Owner 9", "Owner 10"]
    let ownerDetails = [["Reds", "Red 1", "Red 2", "Red 3", "Red 4", "Red 5", "Red 6", "Red 7", "Red 8", "Red 9", "Red 10"], ["Whites", "White 1", "White 2", "White 3", "White 4", "White 5", "White 6", "White 7", "White 8", "White 9", "White 10"]]
    var currentItem = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return lockerOwners.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID")

        // Configure the cell...
        // generates locker number by using locker owners index in the locker owner array
        cell?.textLabel?.text = "#\(lockerOwners.index(indexPath.row, offsetBy: 1)) \(lockerOwners[indexPath.row])"

        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentItem = lockerOwners[indexPath.row]
        performSegue(withIdentifier: "showDetail", sender: nil)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Lockers"
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let viewController = segue.destination as? ViewController {
            viewController.text = currentItem
            viewController.currentOwnerDetails = ownerDetails
        }
        
        
    }
    

}
