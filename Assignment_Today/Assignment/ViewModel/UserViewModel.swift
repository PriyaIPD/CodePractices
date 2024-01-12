//
//  UserViewModel.swift
//  Assignment
//
//  Created by Priya Gandhi on 2024-01-11.
//

import UIKit

class UserViewModel: NSObject {
    
    var userInfo : UserInfo?
    var userDetail : [UserDetail] = []
    
    func setupData() -> [UserDetail]{
        let userData = PreferenceManager.shared.userDataDict
        
        do {
            let json = try JSONSerialization.data(withJSONObject: userData)
            let decoder = JSONDecoder()
            userInfo = try decoder.decode(UserInfo.self, from: json)
            userDetail = 
              [UserDetail(title: "First Name", subTitle: userInfo?.fName ?? ""), UserDetail(title: "Last Name", subTitle: userInfo?.lName ?? ""), UserDetail(title: "Street Name ", subTitle: userInfo?.streetName ?? ""),
                UserDetail(title: "Street Number ", subTitle: userInfo?.streetNumber ?? ""),
                UserDetail(title: "PO Box ", subTitle: userInfo?.poBox ?? ""),
                UserDetail(title: "City", subTitle: userInfo?.city ?? ""),
                UserDetail(title: "State", subTitle: userInfo?.state ?? ""),
                UserDetail(title: "Zipcode", subTitle: userInfo?.zipcode ?? ""),
                UserDetail(title: "Country", subTitle: userInfo?.country ?? ""),
                UserDetail(title: "Email", subTitle: userInfo?.email ?? ""),
                UserDetail(title: "Profile", subTitle: userInfo?.profile ?? "")]
        } catch {
            print(error)
        }
        return userDetail
    }
}
