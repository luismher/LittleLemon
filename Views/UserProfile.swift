//
//  UserProfile.swift
//  Restaurant App
//
//  Created by Luismi on 3/6/24.
//

import SwiftUI

struct UserProfile: View {
    @StateObject private var viewModel = ViewModel()
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State private var isLoggedOut = false
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        NavigationView {
            ScrollView {
                NavigationLink (destination: Onboarding(), isActive: $isLoggedOut) {}
                VStack (spacing: 5) {
                    VStack {
                        Text("Personal Information")
                        HStack{
                            Image("Profile")
                                .resizable()
                                .frame(width: 75, height: 75)
                                .clipShape(Circle())
                                .padding()
                            Button("Change"){}
                                .buttonStyle(buttonGreen())
                            Button ("Remove"){}
                                .buttonStyle(buttonWhite())
                            Spacer()
                        }
                    }
                        Text("First Name")
                            .onboardingText()
                    TextField("First Nasme", text: $viewModel.firstName)
                        Text("Last Name")
                        .onboardingText()
                        TextField("Last Name", text: $viewModel.lastName)
                        Text("Email")
                        .onboardingText()
                        TextField("Email", text: $viewModel.email)
                }
                .textFieldStyle(.roundedBorder)
                .disableAutocorrection(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
                .padding()
                Button("Log Out") {
                    UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                    UserDefaults.standard.set("", forKey: kFirstName)
                    UserDefaults.standard.set("", forKey: kLastName)
                    UserDefaults.standard.set("", forKey: kEmail)
                    self.presentation.wrappedValue.dismiss()
                    isLoggedOut = true
                }
                
                    .buttonStyle(buttonYellow())
            }
        }
    }
}

#Preview {
    UserProfile()
}
