//
//  ContentView.swift
//  SwiftUI-OTP
//
//  Created by Shivaditya Kr on 23/05/24.
//

import SwiftUI

struct ContentView: View {
    @State var otpText = ""
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("OTP Screen")
            AppOtpView(otpText: $otpText) { value in
                print(value)
            }
            .padding(.top, 10)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
