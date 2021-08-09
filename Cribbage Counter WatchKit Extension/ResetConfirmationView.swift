//
//  ResetConfirmationView.swift
//  Cribbage Counter WatchKit Extension
//
//  Created by Husayn Esmail on 2021-08-08.
//

import SwiftUI

struct ResetConfirmationView: View {
    @ObservedObject var scores = Counters.shared
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack{
            Text("Are you sure you want to reset?")
                .multilineTextAlignment(.center)
            HStack{
                Button(action: {scores.scores.blueScore = 0; scores.scores.redScore = 0; presentationMode.wrappedValue.dismiss()}, label: {
                    Text("Yes")
                })
                .cornerRadius(20)
                Button(action: {presentationMode.wrappedValue.dismiss()}, label: {
                    Text("No")
                })
                .background(Color.red)
                .cornerRadius(20)
            }
        }
    }
}

struct ResetConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        ResetConfirmationView()
    }
}
