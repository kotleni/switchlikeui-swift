//
//  ContentView.swift
//  SwitchUI
//
//  Created by Victor Varenik on 15.06.2022.
//

import SwiftUI
import IOKit.ps

struct ContentView: View {
    
    @State private var games: [String] = ["game_gta", "game_genshin", "game_csgo"]
    
    var body: some View {
        VStack {
            TopBar()
            AppsBar(games: $games)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            MenuBar()
            BottomBar()
        }
    }
}

struct TopBar: View {
    
    @State private var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .none
        return formatter
    }()
    
    @State private var batteryLevel: Int = {
        guard let blob = IOPSCopyPowerSourcesInfo(),
              let list = IOPSCopyPowerSourcesList(blob.takeRetainedValue()),
              let array = list.takeRetainedValue() as? [Any],
              array.count > 0,
              let dict = array[0] as? NSDictionary else { return 0 }
        let currentCapacity = dict[kIOPSCurrentCapacityKey] as? Double ?? 0
        let maxCapacity = dict[kIOPSMaxCapacityKey] as? Double ?? 0
        return Int(currentCapacity / maxCapacity * 100 / 25) * 25
    }()
    
    var body: some View {
        HStack {
            Spacer()
                .frame(width: 16)
            Image("avatar")
                .resizable()
                .scaledToFill()
                .frame(width: 35, height: 35)
                .clipShape(Circle())
                .shadow(radius: 1.5)
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                .hoverCircleAnimation()
            Spacer()
            Text(dateFormatter.string(from: Date()))
            Image(systemName: "battery.\(batteryLevel)")
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 15)
            Spacer()
                .frame(width: 16)
        }
        .padding(16)
    }
}

struct AppsBar: View {
    
    @Binding var games: [String]
    
    var body: some View {
        ScrollView (.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<10) { index in
                    if index < games.count {
                        Image(games[index])
                            .hoverRectAnimation()
                    } else {
                        Image("game_none")
                            .renderingMode(.template)
                            .foregroundColor(Color("MenuItem"))
                    }
                }
                Spacer()
                    .frame(width: 40)
            }
        }
        .frame(height: 160)
        .padding(.leading, 40)
    }
}

struct MenuBar: View {
    
    @State private var icons: [String] = ["message", "bag", "photo", "gamecontroller", "gear", "power"]
    
    var body: some View {
        HStack {
            ForEach(icons, id: \.self) { icon in
                Circle()
                    .fill(Color("MenuItem"))
                    .frame(width: 50, height: 50)
                    .overlay(Image(systemName: icon)
                        .resizable()
                        .scaledToFill()
                        .foregroundColor(Color("MenuIcon"))
                        .padding(16))
                    .hoverCircleAnimation()
            }
        }
        .padding(.bottom, 16)
    }
}

struct BottomBar: View {
    var body: some View {
        Divider()
            .background(Color(red: 134 / 255, green: 134 / 255, blue: 134 / 255, opacity: 1.0))
            .foregroundColor(Color(red: 134 / 255, green: 134 / 255, blue: 134 / 255, opacity: 1.0))
            .padding(.leading, 16)
            .padding(.trailing, 16)
        HStack {
            Spacer()
                .frame(width: 24)
            Image(systemName: "iphone.landscape")
                .resizable()
                .scaledToFit()
                .frame(width: 25)
            Spacer()
            Image(systemName: "circle.dashed")
            Text("OK")
            Spacer()
                .frame(width: 24)
        }
        .padding(4)
        Spacer()
            .frame(height: 8)
    }
}
