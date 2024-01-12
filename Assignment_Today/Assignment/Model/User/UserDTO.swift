//
//  UserDTO.swift
//  Assignment
//
//  Created by Priya Gandhi on 2024-01-11.
//

import UIKit

struct UserInfo : Codable
{
    var fName : String
    var lName : String
    var streetName : String
    var streetNumber : String
    var poBox : String
    var city : String
    var state : String
    var zipcode : String
    var country : String
    var email : String
    var profile : String
    var password : String
    var confirmPasword : String

    
    func toDict() -> [String : Any]{
        return [
            "fName":self.fName ,
            "lName": self.lName ,
            "streetName":self.streetName ,
            "streetNumber": self.streetNumber ,
            "poBox" : self.poBox ,
            "city":self.city ,
            "state":self.state ,
            "zipcode":self.zipcode ,
            "country":self.country ,
            "email":self.email ,
            "profile" : self.profile ,
            "password" : self.password ,
            "confirmPasword" : self.confirmPasword ,

        ]
    }


}

struct UserDetail : Codable{
var title : String
var subTitle : String
}
