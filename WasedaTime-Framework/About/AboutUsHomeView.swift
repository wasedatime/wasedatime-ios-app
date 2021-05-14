//
//  AboutUsHomeView.swift
//  WasedaTime-Framework
//
//  Created by Takumi Otsuka on 14/5/21.
//

import SwiftUI

// Width ...
var width = UIScreen.main.bounds.width

struct AboutUsHomeView: View {
    
    @EnvironmentObject var model: AboutUsCarouselViewModel
    @Namespace var animation
    
    var body: some View {
        ZStack {
            VStack {
                Text("")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.leading)
                    .padding()
                // Carousel ...
                ZStack {
                    ForEach(model.cards.indices.reversed(), id: \.self) { index in
                        HStack {
                            AboutUsCardView(card: model.cards[index], animation: animation)
                                .frame(width: getWidth(index: index), height: getHeight(index: index))
                                .offset(x: getCardOffset(index: index))
                                .rotationEffect(.init(degrees: getCardRotation(index: index)))
                            Spacer(minLength: 0)
                        }
                        .frame(height: 400)
                        .contentShape(Rectangle())
                        .offset(x: model.cards[index].offset)
                        .gesture(DragGesture(minimumDistance: 0)
                                    .onChanged({ (value) in
                                        onChanged(value: value, index: index)
                                    })
                                    .onEnded({ (value) in
                                        onEnd(value: value, index: index)
                                    }))
                    }
                }
                .padding(.top, 25)
                .padding(.horizontal, 30)
                Button(action: ResetViews, label: {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.blue)
                        .padding()
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(radius: 3)
                })
                .padding(.top, 35)
                
                Spacer()
            }
            // Detail View ...
            if model.showCard{
                AboutUsDetailView(animation: animation)
            }
        }
    }
    
    // Resetting View ...
    func ResetViews() {
        for index in model.cards.indices {
            withAnimation(.spring()) {
                model.cards[index].offset = 0
                model.swipedCard = 0
            }
        }
    }
    
    func onChanged(value: DragGesture.Value, index: Int) {
        // Only Left Swipe ...
        if value.translation.width < 0 {
            model.cards[index].offset = value.translation.width
        }
    }
    func onEnd(value: DragGesture.Value, index: Int) {
        withAnimation {
            if -value.translation.width > width / 3 {
                model.cards[index].offset = -width
                model.swipedCard += 1
            } else {
                model.cards[index].offset = 0
            }
        }
    }
    
    // Getting Rotation When Card is being Swiped ...
    func getCardRotation(index: Int) -> Double {
        let boxWidth = Double(width / 3)
        let offset = Double(model.cards[index].offset)
        let angle: Double = 5
        return (offset / boxWidth) * angle
    }
    
    // Getting Width and Height for Card ...
    func getWidth(index: Int) -> CGFloat {
        let boxWidth = UIScreen.main.bounds.width - 60 - 60
        // For First 3 Cards ...
//        let cardWidth = index <= 2 ? CGFloat(index) * 30 : 60
        return boxWidth
    }
    func getHeight(index: Int) -> CGFloat {
        let height: CGFloat = 400
        // Again First 3 Cards ...
        let cardHeight = index - model.swipedCard <= 2 ? CGFloat(index - model.swipedCard) * 35 : 70
        return height - cardHeight
    }
    // Getting Offset ...
    func getCardOffset(index: Int) -> CGFloat {
        return index - model.swipedCard <= 2 ? CGFloat(index - model.swipedCard) * 30 : 60
    }
}

struct AboutUsHomeView_Previews: PreviewProvider {
    static var previews: some View {
        AboutUsContentView()
    }
}
