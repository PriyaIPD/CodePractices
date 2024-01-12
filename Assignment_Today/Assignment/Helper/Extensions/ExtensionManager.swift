//
//  ExtensionManager.swift
//  Assignment
//
//  Created by Priya Gandhi on 2024-01-11.
//

import UIKit

class ExtensionManager: NSObject {

}
//MARK:- Color, Border, CornerRadius Extension
@IBDesignable extension UIView {
    @IBInspectable var borderColor: UIColor? {
        set {
            layer.borderColor = newValue?.cgColor
        }
        get {
            guard let color = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: color)
        }
    }
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
            clipsToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }
}


extension String {
    // Validation for find if email is valid
    func isValidEmail() -> Bool {
        // here, `try!` will always succeed because the pattern is valid
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
}

extension UIViewController {
    
    // present alert on UIViewController this function only hide the alert
    func presentAlert(withTitle title: String, message : String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { action in
            print("You've pressed OK Button")
        }
        alertController.addAction(OKAction)
        // Present Alert on Controller
        self.present(alertController, animated: true, completion: nil)
    }
    
    func alert(title: String?, message: String?, actionTitle: String = "Close", completion: @escaping () -> Void ){
        
        DispatchQueue.main.async {
            guard let controller = UIApplication.topViewController() else{
                return
            }
            let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
            
            let okAction = UIAlertAction.init(title: actionTitle, style: .cancel) { (action) in
                completion()
            }
            alert.addAction(okAction)
            controller.present(alert, animated: true, completion: nil)
        }
        
    }
    
    func addOverlay(controller:UIViewController) {
        let overlayView = UIView(frame: view.bounds)
        overlayView.backgroundColor = UIColor.black
        overlayView.alpha = 0.0 // Start with an alpha of 0
        overlayView.tag = 999 // Set a unique tag to identify the overlay view later
        controller.view.addSubview(overlayView)
        
        // Animate the overlay view to fade in
        UIView.animate(withDuration: 0.4) {
            overlayView.alpha = 0.5 // Set the alpha to the desired value
        }
    }
    
    // remove black overlay when popup disappear
    func removeOverlay(controller:UIViewController) {
        if let overlayView = controller.view.subviews.first(where: { $0.tag == 999 }) {
            // Animate the overlay view to fade out
            UIView.animate(withDuration: 0.4, animations: {
                overlayView.alpha = 0.0 // Set the alpha to 0 to fade out
            }, completion: { finished in
                overlayView.removeFromSuperview() // Remove the overlay view from the parent view
            })
        }
    }
}


extension UITableView{
    func registerCustomCells(identifier : String){
        self.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
        self.separatorStyle = .none
    }
    
}

extension UITextField{
    func setDefaultvalues(){
        self.text = ""
    }
}

//MARK: UIApplication Extension:
extension UIApplication {
    //Top View Controller Retrieval
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}
