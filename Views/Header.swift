//
//  Header.swift
//  LittleLemon
//
//  Created by Luismi on 3/11/24.
//

import SwiftUI

struct Header: View {
    var body: some View {
        VStack{
            Image("Logo")
                .aspectRatio(contentMode: .fit)
        }
        .padding(.bottom)
        .onAppear()
    }
}

#Preview {
    Header()
}
