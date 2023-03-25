//
//  ContentView.swift
//  DatePickerAralik
//
//  Created by ahmet kardesseven on 24.03.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var startDate = Date()
    
    var body: some View {
        VStack {
                    Text("Başlangıç tarihi: \(startDate)")
                    DatePicker(
                        "",
                        selection: $startDate,
                        in: Date()...,
                        displayedComponents: [.date]
                    )
                    .datePickerStyle(WheelDatePickerStyle())
                    
        }
      
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
