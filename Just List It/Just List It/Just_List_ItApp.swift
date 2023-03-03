//
//  Just_List_ItApp.swift
//  Just List It
//
//  Created by Fomagran on 2023/03/01.
//

import SwiftUI

@main
struct Just_List_ItApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject var viewModel = LoginViewModel()

    var body: some Scene {
        WindowGroup {
            LoginView()
                .environmentObject(viewModel)
        }
    }
}
