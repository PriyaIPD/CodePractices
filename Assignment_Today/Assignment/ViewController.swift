//
//  ViewController.swift
//  Assignment
//
//  Created by Priya Gandhi on 2024-01-11.
//

import UIKit
import CountryPicker

class ViewController: UIViewController {

    @IBOutlet weak var txtFname : UITextField!
    @IBOutlet weak var txtLname : UITextField!
    @IBOutlet weak var txtStreetName : UITextField!
    @IBOutlet weak var txtStreetNumber : UITextField!
    @IBOutlet weak var txtPOBox : UITextField!
    @IBOutlet weak var txtCity : UITextField!
    @IBOutlet weak var txtState : UITextField!
    @IBOutlet weak var txtZipcode : UITextField!
    @IBOutlet weak var txtCountry : UITextField!
    @IBOutlet weak var txtEmail : UITextField!
    @IBOutlet weak var txtProfile : UITextField!
    @IBOutlet weak var txtPassword : UITextField!
    @IBOutlet weak var txtConfirmPassword : UITextField!

  //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDefaultValues()
    }
        
    //MARK: - Setup
    func setupDefaultValues(){
        txtCountry.text = "Canada"
    }
    
    func saveInformation(completion: (Bool)-> Void){
            do {
                // Validation for email, password, and agency ID
                _ = try Validation.validateField(fName: txtFname.text ?? "", type: .Fname)
                _ = try Validation.validateField(fName: txtLname.text ?? "", type: .Lname)
                _ = try Validation.validateField(fName: txtStreetName.text ?? "", type: .StreetName)
                _ = try Validation.validateField(fName: txtStreetNumber.text ?? "", type: .StreetNumber)
                _ = try Validation.validateField(fName: txtPOBox.text ?? "", type: .PoBox)
                _ = try Validation.validateField(fName: txtCity.text ?? "", type: .City)
                _ = try Validation.validateField(fName: txtState.text ?? "", type: .State)
                _ = try Validation.validateField(fName: txtZipcode.text ?? "", type: .Zipcode)
                _ = try Validation.validateField(fName: txtEmail.text ?? "", type: .Email)
                _ = try Validation.validateEmail(email: txtEmail.text ?? "")
                _ = try Validation.validateField(fName: txtPassword.text ?? "", type: .Password)
                _ = try Validation.validateField(fName: txtConfirmPassword.text ?? "", type: .ConfirmPassword)
                _ = try Validation.validatePasswordAreEqual(newpassword: txtPassword.text ?? "", confirmPassword: txtConfirmPassword.text ?? "")
                let userInfo =   UserInfo(fName: self.txtFname.text ?? "", lName: self.txtLname.text ?? "", streetName: self.txtStreetName.text ?? "", streetNumber: self.txtStreetNumber.text ?? "", poBox: self.txtPOBox.text ?? "", city: self.txtCity.text ?? "", state: self.txtState.text ?? "", zipcode: self.txtZipcode.text ?? "", country: self.txtCountry.text ?? "", email: self.txtEmail.text ?? "", profile:  "business", password: self.txtPassword.text ?? "", confirmPasword: self.txtConfirmPassword.text ?? "")
                   
                   PreferenceManager.shared.userDataDict = userInfo.toDict() as NSDictionary
                completion(true)
                
            }catch{
                completion(false)
                // Show alert for any error in validation
                self.presentAlert(withTitle: "Warning", message: error.localizedDescription)
        }
        
        completion(false)
       
    }
    
    func pushData(_ strMessage : String){
        self.alert(title: "Message", message: strMessage, actionTitle: "Ok") {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "UserDetailVC") as! UserDetailVC
            self.navigationController?.pushViewController(vc, animated: true)
    }
    }
    
    // Method to present a list view with specified title and data
    func presentListView(title: String, dataArr : [String]){
        let listVC : ListView = ListView(nibName :"ListView",bundle : nil)
        listVC.modalPresentationStyle = .overCurrentContext
        self.addOverlay(controller: self)
        listVC.delegate = self //setting up the delagate to come back
        listVC.titleStr = title // setting the title
        listVC.dataArr = dataArr // setting the list array
        self.present(listVC, animated: true, completion: nil)
    }
    
    
    //MARK: - UIButton Actions
    
    @IBAction func profilePressed(_ sender : UIButton){
        self.presentListView(title: "Profile Type", dataArr: ["Employee", "Employer", "Director", "Doctor", "Engineer", "Retired"])
    }
    
    @IBAction func countryPressed(_ sender : Any){
        let countryPicker = CountryPickerViewController()
        countryPicker.selectedCountry = "CA"
        countryPicker.delegate = self
        self.present(countryPicker, animated: true)
    }
    
    @IBAction func addPressed(sender : UIButton){
        saveInformation { Success in
            if Success {
                pushData("Records Added")
            }
        }
}
    
    @IBAction func modifyPressed(sender : UIButton){
            saveInformation { Success in
                if Success {
                    pushData("Records Modified")
                }
            }
    }
    
    @IBAction func deletePressed(sender : UIButton){
        PreferenceManager.shared.clear()
        txtCity.setDefaultvalues()
        txtFname.setDefaultvalues()
        txtLname.setDefaultvalues()
        txtStreetNumber.setDefaultvalues()
        txtPOBox.setDefaultvalues()
        txtEmail.setDefaultvalues()
        txtState.setDefaultvalues()
        txtZipcode.setDefaultvalues()
        txtPassword.setDefaultvalues()
        txtConfirmPassword.setDefaultvalues()
        txtStreetName.setDefaultvalues()
    }
    
    
    @IBAction func submitPressed(sender : UIButton)
    {
        saveInformation { Success in
            if Success {
                pushData("Records Added")
            }
        }
    }


}

extension ViewController : CountryPickerDelegate{
    func countryPicker(didSelect country: CountryPicker.Country) {
        print(country.localizedName)
        txtCountry.text = country.localizedName

    }
}

extension ViewController : DidDismissViewControllerDelegate{
    func didSelectValueWithType(value: String, type: String) {
        txtProfile.text = value
        self.removeOverlay(controller: self)
    }
}
