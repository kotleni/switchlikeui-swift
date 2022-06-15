//
//  ContentView.swift
//  SwitchUI
//
//  Created by Victor Varenik on 15.06.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TopBar()
            AppsBar()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            MenuBar()
            BottomBar()
        }
    }
}

struct TopBar: View {
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
            Text("21:52")
            Image(systemName: "battery.100")
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
    var body: some View {
        ScrollView (.horizontal, showsIndicators: false) {
             HStack {
                 Image("game_gta")
                     .hoverRectAnimation()
                 Image("game_genshin")
                     .hoverRectAnimation()
                 Image("game_csgo")
                     .hoverRectAnimation()
                 Image("game_none")
                     .renderingMode(.template)
                     .foregroundColor(Color("MenuItem"))
                 Image("game_none")
                     .renderingMode(.template)
                     .foregroundColor(Color("MenuItem"))
                 Image("game_none")
                     .renderingMode(.template)
                     .foregroundColor(Color("MenuItem"))
                 Image("game_none")
                     .renderingMode(.template)
                     .foregroundColor(Color("MenuItem"))
                 Image("game_none")
                     .renderingMode(.template)
                     .foregroundColor(Color("MenuItem"))
                 Image("game_none")
                     .renderingMode(.template)
                     .foregroundColor(Color("MenuItem"))
                 Spacer()
                     .frame(width: 40)
             }
        }
        .frame(height: 160)
        .padding(.leading, 40)
    }
}

struct MenuBar: View {
    var body: some View {
        HStack {
            Circle()
                .fill(Color("MenuItem"))
                .frame(width: 50, height: 50)
                .overlay(Image(systemName: "message")
                    .resizable()
                    .scaledToFill()
                    .foregroundColor(Color("MenuIcon"))
                    .padding(16))
                .hoverCircleAnimation()
            Circle()
                .fill(Color("MenuItem"))
                .frame(width: 50, height: 50)
                .overlay(Image(systemName: "bag")
                    .resizable()
                    .scaledToFill()
                    .foregroundColor(Color("MenuIcon"))
                    .padding(16))
                .hoverCircleAnimation()
            Circle()
                .fill(Color("MenuItem"))
                .frame(width: 50, height: 50)
                .overlay(Image(systemName: "photo")
                    .resizable()
                    .scaledToFill()
                    .foregroundColor(Color("MenuIcon"))
                    .padding(16))
                .hoverCircleAnimation()
            Circle()
                .fill(Color("MenuItem"))
                .frame(width: 50, height: 50)
                .overlay(Image(systemName: "gamecontroller")
                    .resizable()
                    .scaledToFill()
                    .foregroundColor(Color("MenuIcon"))
                    .padding(16))
                .hoverCircleAnimation()
            Circle()
                .fill(Color("MenuItem"))
                .frame(width: 50, height: 50)
                .overlay(Image(systemName: "gear")
                    .resizable()
                    .scaledToFill()
                    .foregroundColor(Color("MenuIcon"))
                    .padding(16))
                .hoverCircleAnimation()
            Circle()
                .fill(Color("MenuItem"))
                .frame(width: 50, height: 50)
                .overlay(Image(systemName: "power")
                    .resizable()
                    .scaledToFill()
                    .foregroundColor(Color("MenuIcon"))
                    .padding(16))
                .hoverCircleAnimation()
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
