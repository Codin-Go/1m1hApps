//
//  ContentView.swift
//  SpaceGo3
//
//  Created by Min Lim on 2022/06/08.
// Split Go

import SwiftUI

struct ContentView: View {

    @State private var amount: Double = 0.0
    @FocusState private var focusDone: Bool
    @State private var selectedPeople = 1
    @State private var selectedTip = 20
    let selectedTips = [0, 10, 15, 20, 25]
    var perPersonAmount: Double {
        let eachAmount: Double = amount * (1 + Double(selectedTip) / 100) / (Double(selectedPeople) + 1)

        return eachAmount
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Hello, world!")
                        .padding()
                } header: {
                    Text ("Description")
                }
                
                Section {
                    TextField("Enter Amount", value: $amount, format: .currency(code: "USD"))
                        .padding()
                        .keyboardType(.decimalPad)
                        .focused($focusDone)
                } header: {
                    Text ("Step 1. Enter Amount")
                }
                
                Section {
                    Picker ("How many People", selection: $selectedPeople) {
                        ForEach (1..<5) {
                            Text ("\($0)")
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text ("Step 2. How many Person?")
                }

                Section {
                    Picker ("Tip Percentage", selection: $selectedTip ) {
                        ForEach (selectedTips, id: \.self) {
                            Text ($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text ("Step 3. Tip percentages?")
                }
                
                Section {
                    Text (perPersonAmount, format: .currency(code: "USD"))
                } header: {
                    Text ("Final. Per Person Amount")
                }

            }
            .navigationTitle("1m1hApp #100 Split Go")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup (placement: .keyboard){
                    Spacer()
                    Button ("Done") {
                        focusDone = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
