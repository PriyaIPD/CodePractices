//
//  ProfileDetailTVC.swift
//  Assignment
//
//  Created by Priya Gandhi on 2024-01-11.
//

import UIKit

class ProfileDetailTVC: UITableViewCell {
    static let identifier = "ProfileDetailTVC"

    @IBOutlet weak var lblTitle : UILabel!
    @IBOutlet weak var lblSubTitle : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(_ userdata : UserDetail){
        self.lblTitle.text = userdata.title
        self.lblSubTitle.text = userdata.subTitle
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
