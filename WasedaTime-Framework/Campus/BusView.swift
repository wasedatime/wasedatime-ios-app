//
//  BusView.swift
//  WasedaTime-Framework
//
//  Created by Takumi Otsuka on 14/6/21.
//

import SwiftUI

struct BusView: View {
    @State var showDatePicker: Bool = false
    @State var savedDate: Date? = nil
    @State var date: Date = Date()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Menu {
                    Button(action: {
                        // action
                    }, label: {
                        Text("Waseda University")
                    })
                    Button(action: {
                        // action
                    }, label: {
                        Text("Nishiwaseda Campus")
                    })
                } label: {
                    Label(
                        title: { Text("Departure")
                            .font(.system(size: 50, weight: .bold, design: .default))
                            .foregroundColor(Color("Red")) },
                        icon: { Image(systemName: "") }
                    )
                }
                Text("From")
                    .font(.system(size: 30, weight: .regular, design: .default))
                HStack {
                    Image(systemName: "arrow.up")
                    Image(systemName: "arrow.down")
                }
                .font(.system(size: 25, weight: .regular, design: .default))
                Menu {
                    Button(action: {
                        // action
                    }, label: {
                        Text("Nishiwaseda Campus")
                    })
                    Button(action: {
                        // action
                    }, label: {
                        Text("Waseda University")
                    })
                } label: {
                    Label(
                        title: { Text("Arrival")
                            .font(.system(size: 50, weight: .bold, design: .default))
                            .foregroundColor(Color("Red")) },
                        icon: { Image(systemName: "") }
                    )
                }
                Text("To")
                    .font(.system(size: 30, weight: .regular, design: .default))
//                ZStack {
//                    HStack {
//                        Button(action: {
//                            showDatePicker.toggle()
//                        }, label: {
//                            Text(savedDate?.description ?? "Time of")
//                                .foregroundColor(.red)
//                        })
//                        Text("Departure")
//                    }
//                    .font(.system(size: 30, weight: .regular, design: .default))
//                    if showDatePicker {
//                        DatePickerWithButtons(showDatePicker: $showDatePicker, savedDate: $savedDate, selectedDate: savedDate ?? Date())
//                            .animation(.linear)
//                            .transition(.opacity)
//                    }
//                }
                HStack {
                    Text("Departure Time")
                        .padding(5)
                    DatePicker("",selection: $date)
                        .datePickerStyle(CompactDatePickerStyle())
                        .frame(width: 200, height: 50, alignment: .center)
                        .padding(5)
                }
                .font(.system(size: 20, weight: .medium, design: .default))
                Button(action: {
                    // action
                }, label: {
                    NavigationLink(destination: GoNow()) {
                        Text("Go!")
                            .font(.system(size: 50, weight: .regular, design: .default))
                            .foregroundColor(Color.white)
                            .padding()
                            .background(Color("Red"))
                            .clipShape(Circle())
                    }
                })
            }
            .navigationTitle("Campus")
        }
    }
}

struct BusView_Previews: PreviewProvider {
    static var previews: some View {
        BusView()
    }
}

struct DatePickerWithButtons: View {
    
    @Binding var showDatePicker: Bool
    @Binding var savedDate: Date?
    @State var selectedDate: Date = Date()
    
    var body: some View {
        ZStack {
            
            Color.black.opacity(0.3)
                .edgesIgnoringSafeArea(.all)
            
            
            VStack {
                DatePicker("Test", selection: $selectedDate, displayedComponents: [.date, .hourAndMinute])
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                Divider()
                HStack {
                    
                    Button(action: {
                        showDatePicker = false
                    }, label: {
                        Text("Cancel")
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        savedDate = selectedDate
                        showDatePicker = false
                    }, label: {
                        Text("Save".uppercased())
                            .bold()
                    })
                    
                }
                .padding(.horizontal)

            }
            .padding()
            .background(
                Color.white
                    .cornerRadius(30)
            )

            
        }

    }
}

struct GoNow: View {
    var body: some View {
        Text("Bus Data")
    }
}
