//
//  Validation.swift
//  Assignment
//
//  Created by Priya Gandhi on 2024-01-11.
//

import UIKit

// Declare validation errors
var typeName : FieldType = .Fname

enum FieldType {
    case Fname
    case Lname
    case StreetName
    case StreetNumber
    case PoBox
    case City
    case State
    case Zipcode
    case Email
    case Password
    case ConfirmPassword
}


enum ValidationError: Error {
    
    case inValidEmail
    case smallPassword
    case EqualPassword
    
    
    case NoFirstName
    case NoLastName
    case NoStreetName
    case NoStreetNumber
    case NoPoBox
    case NoCity
    case NoState
    case NoZipcode
    case NoEmail
    case NoPassword
    case NoConfirmPassword





}

// Declare validation messages
extension ValidationError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .NoFirstName:
            return "Please enter your first name"
        case .NoLastName:
            return "Please enter your last name"
        case .NoStreetName:
            return "Please enter your street name"
        case .NoStreetNumber:
            return "Please enter your street number"
        case .NoPoBox:
            return "Please enter your PO Box"
        case .NoCity:
            return "Please enter your City"
        case .NoState:
            return "Please enter your state"
        case .NoZipcode:
            return "Please enter your zipcode"
        case .NoEmail:
            return "Please enter your email"
        case .NoPassword:
            return "Please enter your password"
        case .NoConfirmPassword:
            return "Please enter your password"
        case .smallPassword:
            return "Password must be 8 characters long"
        case .EqualPassword:
            return "Both passwords must be same"
        case .inValidEmail:
            return "Invalid Email"
            
        }
    }
}
    struct Validation {
        
        // Validate Email
        static func validateEmail(email: String) throws -> String {
            if !email.isValidEmail() {
                throw ValidationError.inValidEmail
            }
            return email
        }
        
        
        static func validateField(fName: String, type : FieldType) throws -> String {
            if fName.count == 0 {
                switch type {
                case .Fname:
                    throw ValidationError.NoFirstName
                case .Lname:
                    throw ValidationError.NoLastName
                case .StreetName:
                    throw ValidationError.NoStreetName
                case .StreetNumber:
                    throw ValidationError.NoStreetNumber
                case .PoBox:
                    throw ValidationError.NoPoBox
                case .City:
                    throw ValidationError.NoCity
                case .State:
                    throw ValidationError.NoState
                case .Zipcode:
                    throw ValidationError.NoZipcode
                case .Email:
                    throw ValidationError.NoEmail
                case .Password:
                    throw ValidationError.NoPassword
                case .ConfirmPassword:
                    throw ValidationError.NoConfirmPassword
                    
                }
            }
            return ""
        }
    
        
        
        
        
        
        
        
        
        // Validate Password
        static func validatePassword(password: String) throws -> String {
            if password.count == 0 {
                throw ValidationError.NoPassword
            }
            if password.count < 8 {
                throw ValidationError.smallPassword
            }
            return password
        }
        
        static func validatePasswordAreEqual(newpassword: String, confirmPassword : String) throws -> String {
            if newpassword != confirmPassword {
                throw ValidationError.EqualPassword
            }
            return newpassword
        }
    }
    
    

