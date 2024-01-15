//
//  UserDetailVC.swift
//  Assignment
//
//  Created by Priya Gandhi on 2024-01-11.
//

import UIKit

class UserDetailVC: UIViewController {
    @IBOutlet weak var tblDetail : UITableView!
    var vm = UserViewModel()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblDetail.registerCustomCells(identifier: ProfileDetailTVC.identifier)
        vm.userDetail =  vm.setupData()
    }
    
    //MARK: - UIButton Actions
    @IBAction func confirmAction(sender : UIButton){
        showHUD(progressLabel: "")
        let param : [String : Any] = ["firstName" :vm.userInfo?.firstName ?? "",
                                      "lastName": vm.userInfo?.lastName ?? "",
                                      "streetName": vm.userInfo?.streetName ?? "",
                                      "streetNumber": vm.userInfo?.streetNumber ?? "",
                                      "poBox": vm.userInfo?.poBox ?? "",
                                      "city": vm.userInfo?.city ?? "",
                                      "country": vm.userInfo?.country ?? "",
                                      "email": vm.userInfo?.email ?? "",
                                      "password": vm.userInfo?.password ?? ""]
            
            
            vm.loginUser1(param: param) { userDetail, isSuccess in
                if isSuccess {
                    DispatchQueue.main.async{
                        self.dismissHUD(isAnimated: true)
                        self.alert(title: "Message", message: "User registered successfully", actionTitle: "Ok") {
                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SuccessVC") as! SuccessVC
                            self.navigationController?.pushViewController(vc, animated: true)
                        }

                    }
                }else{
                    DispatchQueue.main.async{
                        self.dismissHUD(isAnimated: true)
                        self.presentAlert(withTitle: "Warning", message: "Something went wrong")

                    }
            }
            
        }
        
         
    }
    
    @IBAction func backAction(sender : UIButton){
        self.navigationController?.popViewController(animated: true)
    }
}

extension UserDetailVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vm.userDetail.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileDetailTVC.identifier) as! ProfileDetailTVC
        //setup content view
        cell.setData(vm.userDetail[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40.0
    }
    
    
}
