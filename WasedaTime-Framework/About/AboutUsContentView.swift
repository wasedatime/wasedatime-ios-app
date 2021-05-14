//
//  AboutUsContentView.swift
//  WasedaTime-Framework
//
//  Created by Takumi Otsuka on 14/5/21.
//

import SwiftUI

struct AboutUsContentView: View {
    
    @StateObject var homeModel = AboutUsCarouselViewModel()
    
    var body: some View {
        AboutUsHomeView()
        // Using it as an environment object ...
            .environmentObject(homeModel)
    }
}

struct AboutUsContentView_Previews: PreviewProvider {
    static var previews: some View {
        AboutUsContentView()
    }
}
