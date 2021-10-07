//
//  BackButton.swift
//  WasedaTime-Framework
//
//  Created by Takumi Otsuka on 7/10/21.
//

import SwiftUI

struct BackButton: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "arrow.left")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 20)
        }
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
