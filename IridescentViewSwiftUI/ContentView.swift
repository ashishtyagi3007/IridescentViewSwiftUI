//
//  ContentView.swift
//  IridescentViewSwiftUI
//
//  Created by Ashish Tyagi on 04/09/20.
//  Copyright © 2020 Ashish Tyagi. All rights reserved.
//


///===========From where I learned =========================================https://medium.com/better-programming/how-to-create-an-iridescent-view-in-swiftui-c2c9178490d1 ===========================================================


import SwiftUI

struct ContentView: View {
    @State var x : CGFloat = 0
    @State var degree : Double = 0
    let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()

    @State var gradient : [Color] = [Color(#colorLiteral(red: 0.9700688617, green: 0.8329559691, blue: 1, alpha: 1)),
    Color(#colorLiteral(red: 0.8432452348, green: 0.8160916593, blue: 1, alpha: 1)),
    Color(#colorLiteral(red: 0.8097396214, green: 0.945347698, blue: 1, alpha: 1)),
    Color(#colorLiteral(red: 0.8435950414, green: 1, blue: 0.8943966345, alpha: 1))]

    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 40)
                .fill(LinearGradient(gradient: Gradient(colors: gradient),
                                     startPoint:  UnitPoint(x: 0, y: 1),
                                     endPoint: UnitPoint(x: x, y: 0)))
                .frame(width: 300, height: 300)
                
             Text("Colors")
                .foregroundColor(Color(#colorLiteral(red: 0.8435950414, green: 1, blue: 0.8943966345, alpha: 1)).opacity(0.35))
                .font(.system(size: 50))
                .bold()
        }.onReceive(timer) { (_) in
            withAnimation(.linear (duration: 2)) {
                 self.x = self.x == 1 ? 0 : 1
                  self.degree = self.degree == 0 ? 45 : 0
            }
        }
        .rotation3DEffect(Angle(degrees: degree), axis: (x: 0.0, y: 1.0, z: 0.0))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
