//
//  UITVApp.swift
//  UITV
//
//  Created by Colin on 11/7/22.
//

import SwiftUI

@main
struct UITVApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(gateway:Gateway())
        }
    }
}
