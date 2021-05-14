//
//  AboutUsDetailView.swift
//  WasedaTime-Framework
//
//  Created by Takumi Otsuka on 14/5/21.
//

import SwiftUI

struct AboutUsDetailView: View {
    
    @EnvironmentObject var model: AboutUsCarouselViewModel
    var animation: Namespace.ID
    
    var body: some View {
        ZStack {
            VStack {
                Text("")
                    .font(.caption)
                    .foregroundColor(Color.white.opacity(0.85))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .padding(.top, 10)
                HStack {
                    Text(model.selectedCard.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 250, alignment: .leading)
                        .padding()
                        .matchedGeometryEffect(id: "Title-\(model.selectedCard.id)", in: animation)
                    Spacer(minLength: 0)
                }
                
                // Detail Text Content ...
                // Showing content some dealy for better animation ...
                
                if model.showContent {
                    ScrollView(.vertical, showsIndicators: false) {
                        Text(model.content)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding()
                    }
                }
                
                Spacer(minLength: 0)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                model.selectedCard.cardColor
                    .cornerRadius(25.0)
                    .matchedGeometryEffect(id: "bgcolor-\(model.selectedCard.id)", in: animation)
                    .ignoresSafeArea(.all, edges: .bottom)
            )
            // Close Button ...
            VStack {
                Spacer()
                if model.showContent {
                    Button(action: CloseView , label: {
                        Image(systemName: "arrow.down")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.blue)
                            .padding()
                            .background(Color.white.opacity(0.6))
                            .clipShape(Circle())
                            .padding(5)
                            .background(Color.white.opacity(0.7))
                            .clipShape(Circle())
                            .shadow(radius: 3)
                    })
                    .padding(.bottom)
                }
            }
        }
    }
    func CloseView() {
        withAnimation(.spring()) {
            model.showCard.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                withAnimation(.easeIn) {
                    model.showContent = false
                }
            }
        }
    }
}

struct AboutUsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AboutUsContentView()
    }
}
