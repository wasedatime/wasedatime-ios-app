//
//  SearchBarView.swift
//  WasedaTime-Framework
//
//  Created by Takumi Otsuka on 7/10/21.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(
                    searchText.isEmpty ?
                    .theme.white :
                    .theme.gray2
                )
            TextField("Search by Name or Symbol", text: $searchText)
                .foregroundColor(.theme.background)
                .disableAutocorrection(true)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10.0)
                        .foregroundColor(.theme.gray3)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            UIApplication.shared.endEditing()
                            searchText = ""
                        }
                    
                    ,alignment: .trailing
                )
                
        }
        .font(.headline)
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 10.0)
                .fill(Color.theme.white2.opacity(0.2))
                .shadow(color: .theme.gray3.opacity(0.15), radius: 10, x: 0, y: 0)
        )
        .padding(10)
    }
}


struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchText: .constant(""))
    }
}
