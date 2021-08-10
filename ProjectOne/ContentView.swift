//
//  ContentView.swift
//  ProjectOne
//
//  Created by Caio Bartholomeu on 05/08/21.
//

import SwiftUI

struct ContentView: View {
    @State var tapCount = 0
    @State private var name = ""
    let students = ["Caio", "Leticia", "Igor"]
    @State private var selectedSTudent = "Leticia"
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0

        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }
    
    var body: some View {
        NavigationView{
            Form {
                Group{
                    Text("Hello, world!")
                    Button("Tap Count \(tapCount)"){
                        self.tapCount += 1
                    }
                }

                Section{
                    Text("Name")
                    TextField("Enter your name", text: $name)
                    Text("My nama is \(name)")
                    
                }
                
                Section{
                    Text("WeSplit")
                    TextField("Amount", text: $checkAmount).keyboardType(.decimalPad)
                    
                    
                    Picker("Number of people", selection: $numberOfPeople){
                        ForEach(0 ..< 100){
                            Text("\($0) people")
                        }
                    }
                    Section(header: Text("How much tip do you want to leave?")) {
                        Picker("Tip percentage", selection: $tipPercentage) {
                            ForEach(0 ..< tipPercentages.count) {
                                Text("\(self.tipPercentages[$0])%")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    Text("$\(totalPerPerson)")
                }
            }
            .navigationBarTitle("SwiftUI", displayMode:.inline)
        }
        
        //not navigation
        Picker("Select your student", selection: $selectedSTudent){
            ForEach(0 ..< students.count){
                Text(self.students[$0])
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
