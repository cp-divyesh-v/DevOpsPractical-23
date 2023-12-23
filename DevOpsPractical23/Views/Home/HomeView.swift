//
//  ContentView.swift
//  DevOpsPractical23
//
//  Created by Divyesh on 23/12/23.
//

import SwiftUI

struct HomeView: View {

    @StateObject private var viewModel = HomeViewModel()

    init(viewModel: HomeViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack {
            HStack {
                Text("Select a Country")
                    .font(.headline)
                Spacer()
                Picker("Select a Country", selection: $viewModel.selectedCountryIndex) {
                    ForEach(0..<viewModel.countries.count, id: \.self) { index in
                        Text(viewModel.countries[index])
                            .onAppear {
                                viewModel.getCollageList(viewModel.countries[viewModel.selectedCountryIndex])
                            }
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding()
            }
            .padding()

            List {
                ForEach(viewModel.university, id: \.name) { university in
                    Text(university.name)
                }
            }
            .padding(.trailing)
            .listStyle(.plain)
        }
        .onAppear {
            viewModel.getCollageList(viewModel.countries[viewModel.selectedCountryIndex])
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
    }
}
