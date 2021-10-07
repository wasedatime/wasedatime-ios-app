//
//  FeedsView.swift
//  WasedaTime-Framework
//
//  Created by Takumi Otsuka on 7/10/21.
//

import SwiftUI

struct FeedsView: View {
    
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            
            Glassmorphism()
            
            ZStack(alignment: .topLeading) {
                BackButton()
                    .padding(.horizontal)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            
            Text("Feeds")
                .foregroundColor(.white)
        }
        .navigationBarHidden(true)
    }
}

// MARK: - PREVIEW
struct FeedsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FeedsView()
        }
    }
}
