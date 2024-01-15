//
//  UserDTO.swift
//  Assignment
//
//  Created by Priya Gandhi on 2024-01-11.
//

import UIKit

struct user : Codable
{
    var firstName : String
    var lastName : String
    var streetName : String
    var streetNumber : String
    var poBox : String
    var city : String
    var state : String
    var zipCode : String
    var country : String
    var email : String
    var password : String
    var _id : String


    
    func toDict() -> [String : Any]{
        return [
            "firstName":self.firstName ,
            "lastName": self.lastName ,
            "streetName":self.streetName ,
            "streetNumber": self.streetNumber ,
            "poBox" : self.poBox ,
            "city":self.city ,
            "state":self.state ,
            "zipCode":self.zipCode ,
            "country":self.country ,
            "email":self.email ,
            "password" : self.password,
            "_id" : self._id


        ]
    }


}

struct UserDetail : Codable{
var title : String
var subTitle : String
}
