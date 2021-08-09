//
//  ContentView.swift
//  Cribbage Counter WatchKit Extension
//
//  Created by Husayn Esmail on 2021-08-05.
//

import SwiftUI

// Creating an observable object so that data can be passed around efficiently.
class Counters: ObservableObject {
    struct blueAndRed {
        var blueScore: Int!
        var redScore: Int!
    }
    @Published var scores = blueAndRed()
    init() {
        scores.blueScore = 0
        scores.redScore = 0
    }
    static var shared = Counters()
}

struct o21PointView: View {
    @ObservedObject var scores = Counters.shared;
    @State var resetRequest: Bool = false;
    var body: some View {
        return Group  {
            if scores.scores.redScore == 121 {
                RedWinsView()
            } else if scores.scores.blueScore == 121 {
                BlueWinsView()
            } else {
                VStack {
                    HStack {
                        // display score labels
                        Text("Red")
                            .foregroundColor(.red)
                            .padding(20)
                        Text("Blue")
                            .padding(20)
                            .foregroundColor(.blue)
                    }
                    HStack {
                        // decrease score for red
                        Button(action: {if scores.scores.redScore != 0 {scores.scores.redScore -= 1}}, label: {
                            Text("-")
                                .font(.system(size: 23))
                        })
                        .background(Color.red)
                        .cornerRadius(20)
                        // increase score for red
                        Button(action: {if scores.scores.redScore != 121 {scores.scores.redScore += 1}}, label: {
                            Text("+")
                                .font(.system(size: 23))
                        })
                        .background(Color.red)
                        .cornerRadius(20)
                            // decrease score for blue
                        Button(action: {if scores.scores.blueScore != 0 {scores.scores.blueScore -= 1}}, label: {
                            Text("-")
                                .font(.system(size: 23))
                        })
                        .background(Color.blue)
                        .cornerRadius(20)
                        // increase score for blue
                        Button(action: {if scores.scores.blueScore != 121 {scores.scores.blueScore += 1}}, label: {
                            Text("+")
                                .font(.system(size: 23))
                        })
                        .background(Color.blue)
                        .cornerRadius(20)
                    }
                    // display scores
                    HStack {
                        Text("\(scores.scores.blueScore)")
                            .offset(x:54, y: 0)
                        Text("\(scores.scores.redScore)")
                            .offset(x:-54, y: 0)
                    }
                    NavigationLink(destination: ResetConfirmationView(), isActive: $resetRequest){
                        Button(action: {resetRequest = true}, label: {
                            Text("Reset")
                        })
                    }
                }
            }
        }
}
 

    

    
// Reset confirmation view for ContentView screen
struct ResetView: View {
    var body: some View {
        Text("Are you sure you want to reset?")
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        o21PointView()
    }
}
}