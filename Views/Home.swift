//
//  Home.swift
//  Restaurant App
//
//  Created by Luismi on 3/5/24.
//

import SwiftUI

struct Home: View {
    var body: some View {
        
        NavigationView {
            TabView {
                Menu()
                    .tabItem {
                        Label("Menu", systemImage: "list.dash")
                        
                    }
                
                UserProfile()
                    .tabItem {
                        Label("Profile", systemImage: "person.crop.circle.fill")

                    }
            }
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    Home().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
}

