//
//  Onboarding.swift
//  Restaurant App
//
//  Created by Luismi on 3/4/24.
//

import SwiftUI

struct Onboarding: View {
    
    @StateObject private var viewModel = ViewModel()
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var isLoggedIn = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack{
                    NavigationLink (destination: Home(), isActive: $isLoggedIn) {
                    }
                    Text("First Name *")
                        .onboardingText()
                    TextField("First Name", text: $firstName)
                    Text("Last Name *")
                        .onboardingText()
                    TextField("Last Name", text: $lastName)
                    Text("Email *")
                        .onboardingText()
                    TextField("Email", text: $email)
                }
                .textFieldStyle(.roundedBorder)
                .disableAutocorrection(true)
                .padding()
                
                Button("Register") {
                    if viewModel.validateUserInput(firstName: firstName, lastName: lastName, email: email) {
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                        firstName = ""
                        lastName = ""
                        email = ""
                        isLoggedIn = true
                    }
                }
                .buttonStyle(buttonYellow())
            }
            .onAppear(){if UserDefaults.standard.bool(forKey: kIsLoggedIn) {isLoggedIn = true}  }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    Onboarding()
}
