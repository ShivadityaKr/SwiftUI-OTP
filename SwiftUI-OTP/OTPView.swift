//
//  OTPView.swift
//  RealState
//
//  Created by Shivaditya Kr on 22/02/24.
//

import SwiftUI
import IQKeyboardManager

struct AppOtpView: View {
    @Binding var otpText: String
    var tap: ((String)-> Void)?
    var body: some View {
        VStack {
            OtpView(otpText: $otpText,activeIndicatorColor: .orange, inactiveIndicatorColor: .black,  length: 4, doSomething: { value in
                IQKeyboardManager.shared().resignFirstResponder()
                tap?(value)
            })
            .padding()
        }
    }
}

#Preview {
    AppOtpView(otpText: .constant(""))
}

public struct OtpView:View {
    @Binding var otpText: String
    private var activeIndicatorColor: Color = .orange
    private var inactiveIndicatorColor: Color = .black
    private let doSomething: (String) -> Void
    private let length: Int
    
    @FocusState private var isKeyboardShowing: Bool
    
    public init(otpText: Binding<String> ,activeIndicatorColor:Color,inactiveIndicatorColor:Color, length:Int, doSomething: @escaping (String) -> Void) {
        self._otpText = otpText
        self.activeIndicatorColor = activeIndicatorColor
        self.inactiveIndicatorColor = inactiveIndicatorColor
        self.length = length
        self.doSomething = doSomething
    }
    
    public var body: some View {
        HStack(spacing: 0){
            ForEach(0...length-1, id: \.self) { index in
                OTPTextBox(index)
            }
        }.background(content: {
            TextField("", text: $otpText.limit(4))
                .keyboardType(.numberPad)
                .textContentType(.oneTimeCode)
                .frame(width: 1, height: 1)
                .opacity(0.001)
                .blendMode(.screen)
                .focused($isKeyboardShowing)
                .onChange(of: otpText) { newValue in
                    if newValue.count == length {
                        doSomething(newValue)
                    }
                }
                .onAppear {
                    DispatchQueue.main.async {
                        isKeyboardShowing = true
                    }
                }
        })
        .contentShape(Rectangle())
        .onTapGesture {
            isKeyboardShowing = true
        }
    }
    
    @ViewBuilder
    func OTPTextBox(_ index: Int) -> some View {
        ZStack{
            if otpText.count > index {
                let startIndex = otpText.startIndex
                let charIndex = otpText.index(startIndex, offsetBy: index)
                let charToString = String(otpText[charIndex])
                Text(charToString)
            } else {
                Text(" ")
            }
        }
        .frame(width: 52, height: 52)
        .background {
            let status = (isKeyboardShowing && otpText.count == index)
            RoundedRectangle(cornerRadius: 6, style: .continuous)
                .stroke(status ? activeIndicatorColor : inactiveIndicatorColor)
                .animation(.easeInOut(duration: 0.2), value: status)
            
        }
        .padding()
    }
}

extension Binding where Value == String {
    func limit(_ length: Int)->Self {
        if self.wrappedValue.count > length {
            DispatchQueue.main.async {
                self.wrappedValue = String(self.wrappedValue.prefix(length))
            }
        }
        return self
    }
}

