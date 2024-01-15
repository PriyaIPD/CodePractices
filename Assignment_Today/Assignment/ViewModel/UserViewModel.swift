//
//  UserViewModel.swift
//  Assignment
//
//  Created by Priya Gandhi on 2024-01-11.
//

import UIKit

class UserViewModel: NSObject {
    
    var userInfo : user?
    var userDetail : [UserDetail] = []
    
    func loginUser1(param: [String: Any], completion:@escaping([user], Bool)-> Void) {
        guard let url = URL(string: baseURL + login) else{
            return
        }
        let task = URLSession.shared.dataTask(with: url){
            data, response, error in
            let decoder = JSONDecoder()
            
            if let data = data{
                do{
                    let tasks = try decoder.decode([user].self, from: data)
                    PreferenceManager.shared.userID = tasks.first?._id ?? ""
                    completion(tasks, true)
                }catch{
                    print(error, false)
                }
            }
            
        }
        
        task.resume()
    }


    
    func setupData() -> [UserDetail]{
        let userData = PreferenceManager.shared.userDataDict
        
        do {
            let json = try JSONSerialization.data(withJSONObject: userData)
            let decoder = JSONDecoder()
            userInfo = try decoder.decode(user.self, from: json)
            userDetail =
              [UserDetail(title: "First Name", subTitle: userInfo?.firstName ?? ""), UserDetail(title: "Last Name", subTitle: userInfo?.lastName ?? ""), UserDetail(title: "Street Name ", subTitle: userInfo?.streetName ?? ""),
                UserDetail(title: "Street Number ", subTitle: userInfo?.streetNumber ?? ""),
                UserDetail(title: "PO Box ", subTitle: userInfo?.poBox ?? ""),
                UserDetail(title: "City", subTitle: userInfo?.city ?? ""),
                UserDetail(title: "State", subTitle: userInfo?.state ?? ""),
                UserDetail(title: "Zipcode", subTitle: userInfo?.zipCode ?? ""),
                UserDetail(title: "Country", subTitle: userInfo?.country ?? ""),
                UserDetail(title: "Email", subTitle: userInfo?.email ?? "")]
        } catch {
            print(error)
        }
        return userDetail
    }
}
