//
//  View.swift
//  ScrollToTop-FloatingButton
//
//  Created by Ramzy on 07/05/2021.
//

import SwiftUI

extension View {
    func getSafeArea() -> UIEdgeInsets {
        return UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
