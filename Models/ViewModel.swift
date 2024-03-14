//
//  ViewModel.swift
//  Restaurant App
//
//  Created by Luismi on 3/5/24.
//

import Foundation
import Combine

public let kFirstName = "First Name key"
public let kLastName = "Last Name key"
public let kEmail = "Email key"
public let kIsLoggedIn = "kIsLoggedIn"

class ViewModel: ObservableObject {
    @Published var firstName = UserDefaults.standard.string(forKey: kFirstName) ?? ""
    @Published var lastName = UserDefaults.standard.string(forKey: kLastName) ?? ""
    @Published var email = UserDefaults.standard.string(forKey: kEmail) ?? ""
    
    
    @Published var errorMessage = ""
    @Published var errorMessageShow = false
    
    func validateUserInput(firstName: String, lastName: String, email: String) -> Bool {
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else {
            errorMessage = "All fields are required"
            errorMessageShow = true
            return false
        }
        guard (1...20).contains(firstName.count) && (1...20).contains(lastName.count) && (1...20).contains(email.count) else {
            errorMessage = "Field requires less than  20 characters"
            errorMessageShow = true
            return false
        }
        
        guard firstName.count >= 3 else {
            errorMessage = "Name must have more than 3 carachters"
            errorMessageShow = true
            return false
        }
        guard email.contains("@") else {
            errorMessage = "Invalid email address"
            errorMessageShow = true
            return false
        }
        guard email.contains(".") else {
            errorMessage = "Invalid email address"
            errorMessageShow = true
            return false
        }
        errorMessage = ""
        errorMessageShow = false
        return true
    }
}

