//
//  ListView.swift
//  Assignment
//
//  Created by Priya Gandhi on 2024-01-11.
//

import UIKit
// Protocol for dismiss popup
@objc protocol DidDismissViewControllerDelegate {
    @objc optional func didDismissViewController(type:String)
    @objc optional func didSelectValueWithType(value:String, type: String)

}

class ListView: UIViewController {
    @IBOutlet weak var tblData: UITableView!
    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var viewData: UIView!
    var delegate : DidDismissViewControllerDelegate!

    @IBOutlet weak var height: NSLayoutConstraint!
    var dataArr : [String] = []
    var titleStr : String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblData.registerCustomCells(identifier: "ListTVC")
        self.lblHeader.text = titleStr

        // Do any additional setup after loading the view.
    }

    @IBAction func closeAction(sender: UIButton){
       
        self.dismiss(animated: true, completion: nil)
        self.delegate.didDismissViewController?(type: "")
    }


}


extension ListView : UITableViewDelegate,UITableViewDataSource
{
    // Tells the table view how many rows to display in each section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    // Configures and returns a cell to be displayed for a given index path for Maintenance cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTVC") as! ListTVC

        // set data on cell
        cell.titleLbl.text = dataArr[indexPath.row]
        // Add button tag and Add target fot button when tap on property image or content
       
        return cell
        
    }
    
    // Specified Height For Property Cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }

    // This function is called when user touches on a specific cell/row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dismiss(animated: true, completion: nil)

        let str = dataArr[indexPath.row]
        self.delegate.didSelectValueWithType?(value: str, type: titleStr)
    }
    
    
    
}
