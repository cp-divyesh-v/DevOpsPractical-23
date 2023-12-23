//
//  DevOpsDevOpsPractical23App.swift
//  DevOpsPractical23
//
//  Created by Divyesh on 23/12/23.
//

import SwiftUI
import Swinject

@main
struct DevOpsDevOpsPractical23App: App {

    let container = Container()

    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: container.resolve(HomeViewModel.self)!)
        }
    }

    init() {
        container.register(WebService.self) { _ in WebService() }
        container.register(HomeViewModel.self) { resolver in
            HomeViewModel(webService: resolver.resolve(WebService.self)!)
        }
    }
}
