//
//  ContentView.swift
//  SampleApp
//
//  Created by Henrique Marques on 10/02/2024.
//

import MeiliSDK
import SwiftUI

let PTID = "131.17"

struct ContentView: View {
    @State private var selectedTab: Tab = .carRental
    @State private var isPresentingCarRentalView = false
    enum Tab {
        case home
        case carRental
        case fonts
    }

    var body: some View {
//        MeiliView(with: MeiliParams(ptid: "100.9", currentFlow: .results, env: .prod, availParams: AvailParams(pickupLocation: "BCN", dropoffLocation: "MAD", pickupDateTime: "2024-06-19T14:38:34.301Z", dropoffDateTime: "2024-06-28T14:38:34.301Z", driverAge: 30, currencyCode: "EUR", residency: "IE")))

//        MeiliView(with: MeiliParams(ptid: "100.9"))

        TabView(selection: $selectedTab) {
            NavigationStack {
                VStack {
                    HomeView(isPresentingCarRental: $isPresentingCarRentalView)
                    
                    MeiliView(with: MeiliParams(ptid: PTID))
                }
                .navigationBarTitle("Home")
                .navigationDestination(isPresented: $isPresentingCarRentalView, destination: {
                    MeiliView(with: MeiliParams(ptid: PTID))
                })
            }

            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            .tag(Tab.home)

            CarRentalView()
                .navigationBarTitle("Car Rental")
                .tabItem {
                    Image(systemName: "car")
                    Text("Car Rental")
                }
                .tag(Tab.carRental)
            
            FontList()
                .navigationBarTitle("Fonts available")
                .tabItem {
                    Image(systemName: "pencil")
                    Text("Fonts")
                }
                .tag(Tab.fonts)
        }
    }
}

struct HomeView: View {
    @Binding var isPresentingCarRental: Bool

    var body: some View {
        VStack {
            HStack {
                Button(action: {}) {
                    Text("Book a flight")
                }

                Button(action: {
                    isPresentingCarRental = true
                }, label: {
                    HStack {
                        Text("Rent a car")
                            .foregroundStyle(.white)
                        Image(systemName: "car")
                            .foregroundStyle(.white)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.gray)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                    )
                })
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}

struct CarRentalView: View {
    var body: some View {
        MeiliView(with: MeiliParams(ptid: PTID, env: .dev))
    }
}

struct FontList: View {
    var body: some View {
        List {
            ForEach(UIFont.familyNames, id: \.self) { family in
                Section(header: Text(family)) {
                    ForEach(UIFont.fontNames(forFamilyName: family), id: \.self) { font in
                        Text(font)
                            .font(.custom(font, size: 20))
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
