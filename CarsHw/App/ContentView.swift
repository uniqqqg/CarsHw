//
//  ContentView.swift
//  CarsHw
//
//  Created by Захар Литвинчук on 09.10.2025.
//

import SwiftUI

struct ContentView: View {
	
	var body: some View {
		TabView {
			NavigationStack {
				CarsListView()
			}
			.tag(0)
			.tabItem {
				Image(systemName: "car.fill")
				Text("Гараж")
			}
		}
	}
}

#Preview {
	ContentView()
}
