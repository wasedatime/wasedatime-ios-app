//
//  CampusView.swift
//  WasedaTime-Framework
//
//  Created by Takumi Otsuka on 7/10/21.
//

import SwiftUI

struct CampusView: View {
    
    // MARK: PROPERTIES
    @Environment(\.dismiss) var dismiss
    
    @State var date: Date = Date()
    @State var departure = "Departure"
    @State var arrival = "Arrival"
    @State var onClickedGo: Bool = false
    
    @Binding var showMenu: Bool
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        
        return formatter
    }()
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            
            Glassmorphism()
            
            VStack(spacing: 20) {
                Menu {
                    Button("Waseda University") {
                        departure = "Waseda University"
                    }
                    Button("Nishiswaseda Campus") {
                        departure = "Nishiwaseda Campus"
                    }
                } label: {
                    Text("\(departure)")
                        .font(.system(size: 35, weight: .bold, design: .default))
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                }
                
                Text("From")
                    .font(.system(size: 30, weight: .regular, design: .default))
                HStack {
                    Image(systemName: "arrow.up")
                    Image(systemName: "arrow.down")
                }
                .font(.system(size: 25, weight: .regular, design: .default))
                
                Menu {
                    Button("Waseda University") {
                        arrival = "Waseda University"
                    }
                    Button("Nishiswaseda Campus") {
                        arrival = "Nishiwaseda Campus"
                    }
                } label: {
                    Text("\(arrival)")
                        .font(.system(size: 35, weight: .bold, design: .default))
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                }
                Text("To")
                    .font(.system(size: 30, weight: .regular, design: .default))
                
                HStack {
                    Text("Departure Time")
                        .padding(5)
                    DatePicker("Departure",selection: $date, displayedComponents: [.date, .hourAndMinute])
                        .datePickerStyle(CompactDatePickerStyle())
                        .frame(width: 200, height: 50, alignment: .center)
                        .padding(5)
                        .labelsHidden()
                }
                .font(.system(size: 20, weight: .medium, design: .default))
                
                Button(action: {
                    withAnimation(.easeInOut(duration: 1.0)) {
                        onClickedGo.toggle()
                    }
                }, label: {
                    Image(systemName: "arrow.down.circle")
                        .font(.system(size: 50))
                        .rotationEffect(onClickedGo ? .degrees(180) : .degrees(0))
                })
                    .background(onClickedGo ? Color("Red") : .green)
                    .cornerRadius(35.0)
                    .disabled((departure == "Departure" && arrival == "Arrival") || (departure == "Departure") || (arrival == "Arrival") || (departure == arrival))
            }
            .foregroundColor(.white)
            
            if onClickedGo {
                bottomSheet
                    .transition(AnyTransition.asymmetric(insertion: .opacity.animation(.easeIn), removal: .opacity.animation(.easeOut)))
            }
        }
    }
    
}

// MARK: - PREVIEW
struct CampusView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CampusView(showMenu: .constant(false))
        }
    }
}

extension CampusView {
    private var bottomSheet: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .foregroundColor(.black.opacity(0.7))
            .frame(width: UIScreen.main.bounds.width / 1.1, height: UIScreen.main.bounds.height / 4)
            .ignoresSafeArea(edges: .bottom)
            .overlay(
                VStack(alignment: .center, spacing: 50) {
                    Text("Date and Time \(date)")
                        .font(.title3)
                }
                .foregroundColor(.theme.white2)
                .padding(.horizontal)
                ,alignment: .center
            )
    }
}
