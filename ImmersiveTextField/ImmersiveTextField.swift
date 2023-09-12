//
//  ImmersiveTextField.swift
//  ImmersiveTextField
//
//  Created by Somesh Arora on 9/12/23.
//

import SwiftUI
import Foundation

public protocol ImmersiveTextFieldViewModel: ObservableObject {
    var text: Binding<String> { get set }
    var headerText: String { get }
}

public struct ImmersiveTextField<ViewModel: ImmersiveTextFieldViewModel>: View {
    
    @ObservedObject
    var viewModel: ViewModel
    
    public init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    @State private var textFieldActive = false
    @State private var isTapped = false
    
    private var backgroundColor: Color {
        return textFieldActive ? .clear : Color.accentColor.opacity(0.08)
    }
    
    private var placeholderColor: Color {
        return textFieldActive ? Color.accentColor : .gray
    }
    
    private var shadowColor: Color {
        return textFieldActive ? Color.primary.opacity(0.5) : .clear
    }
    
    private var borderColor: Color {
        return textFieldActive ? Color.primary.opacity(0.5) : .clear
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            TextField("", text: viewModel.text) { status in
                // triggered when textField is clicked..
                textFieldActive = status
                if status {
                    withAnimation(.easeIn) {
                        isTapped = true
                    }
                } else {
                    if viewModel.text.wrappedValue.isEmpty {
                        withAnimation(.easeOut) {
                            isTapped = false
                        }
                    }
                }
            } onCommit: {
                // triggered when return button is tapped..
                textFieldActive = false
                if viewModel.text.wrappedValue.isEmpty {
                    withAnimation(.easeOut) {
                        isTapped = false
                    }
                }
            }
            .padding(.top, isTapped ? 15 : 0)
            .background(
                Text(viewModel.headerText)
                    .font(.callout.bold())
                    .scaleEffect(isTapped ? 0.8 : 1.0)
                    .offset(x: isTapped ? -7 : 0, y: isTapped ? -15 : 0)
                    .foregroundColor(placeholderColor),
                alignment: .leading
            )
        }
        .padding(.vertical, 10)
        .padding(.horizontal)
        .background(backgroundColor)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(borderColor, lineWidth: 2)
                .shadow(color: self.shadowColor, radius: 4, x: 0, y: 2)
        )
        .cornerRadius(8)
    }
}

struct ImmersiveTextField_Previews: PreviewProvider {
    static var previews: some View {
        ImmersiveTextField(viewModel: DefaultImmersiveTextFieldViewModel(text: .constant("Hello, World"), headerText: "Header"))
    }
}
