//
//  ContentView.swift
//  WeSplit
//
//  Created by Richard Nkanga on 20/06/2022.
//

import SwiftUI

struct ContentView: View {
    @State var checkAmount: Double = 0.0
    @State var numberOfPeople = 2
    @State var tipPercentage = 20
    @FocusState var amountIsFocused: Bool

    
     let tipPercentages = [0, 10, 15, 20, 25]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)

        
        let tipValue =  checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
        }
    
    var tippedValue: Double {
        let a = Double(numberOfPeople + 2)
        let b = checkAmount
        let c = totalPerPerson
                     
        let amountTipped = c * a - b
            

        return amountTipped
        
    }
        
        
        var totalAmount: Double {
          let toBePaid = checkAmount + tippedValue
            
            return toBePaid
        }

    
        
    
    var body: some View {
        
        NavigationView {
            Form {
                
                Section {
                    TextField("The cost of the bill is \(checkAmount)", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD" ))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker(selection: $numberOfPeople, label: Text("Number of People")) {
                         
                        ForEach(2..<100){
                            Text("\($0) people")
                        }
                    
                   
                        }
                   
                    }
                
                Section {
                    Picker(selection: $tipPercentage, label: Text("Tip Percentage")) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                            
                        }
                    .pickerStyle(.segmented)
                    }header: {
                        Text("How much would you like to tip ")
                    }
                
                Section {
                   Text(tippedValue, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                }header: {
                    Text("a \(tipPercentage, format: .percent) tip is  ")
                }
  
                    
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD" ))
                }header: {
                    Text("\(numberOfPeople + 2) of you will contribute \(totalPerPerson,  format: .currency(code: Locale.current.currencyCode ?? "USD" )) each")
                }
                
               
                
                Section {
                   Text(totalAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                }header: {
                    Text("The the total amount ")
                }
    
            }
            .navigationTitle("Tip Calculator")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    
                    Spacer()
                    
                    Button("Done") {
                        amountIsFocused = false
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
    

}



