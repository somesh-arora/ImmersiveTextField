//
//  DefaultImmersiveTextFieldViewModel.swift
//  ImmersiveTextField
//
//  Created by Somesh Arora on 9/12/23.
//

import Foundation
import Combine
import SwiftUI

public final class DefaultImmersiveTextFieldViewModel: ImmersiveTextFieldViewModel {
    
    @Published
    public var text: Binding<String>
    
    public var headerText: String
    
    public init(text: Binding<String>, headerText: String) {
        self.text = text
        self.headerText = headerText
    }
}
