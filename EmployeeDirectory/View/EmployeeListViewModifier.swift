//
//  EmployeeListViewModifier.swift
//  EmployeeDirectory
//
//  Created by Adam Khan on 19/12/2022.
//

import SwiftUI

internal struct textModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .bold()
            .font(.title)
    }
}

extension View {
    func textModifications() -> some View {
        self.modifier(textModifier())
    }
}
