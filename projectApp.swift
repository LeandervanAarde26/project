//
//  projectApp.swift
//  project
//
//  Created by Leander Van Aarde on 2022/09/07.
//

import SwiftUI
@main 
struct projectApp: App {
    var cars = Network()
    var body: some Scene {
        WindowGroup {
            NavigationView(){
                
                SplashView()
                    .environmentObject(cars)
                    .navigationBarTitle("")
                    .navigationBarHidden(true)

            }
        }
    }
}
