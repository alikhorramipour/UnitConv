//
//  ContentView.swift
//  UnitConv
//
//  Created by Ali Khorramipour on 1/2/23.
//

import SwiftUI


struct ContentView: View {
    let fields = ["Temperature", "Length", "Time", "Volume"]
    let temps = ["Celsius", "Fahrenheit", "Kelvin"]
    let lengths = ["Meter", "Kilometer", "Feet", "Yard", "Mile"]
    let times = ["Second", "Minute", "Hour", "Day"]
    let volumes = ["Milliliter", "Liter", "Cup", "Pint", "Gallon"]
    
    @State private var fieldChosen = "Temperature"
    @State private var inputUnit = "Celsius"
    @State private var inputAmount = 0.0
    @State private var outputUnit = "Celsius"
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    Picker("Unit", selection: $fieldChosen){
                        ForEach(fields, id: \.self){
                            Text("\($0)")
                        }
                    }
                }
                Section{
                    switch fieldChosen{
                    case "Temperature":
                        Picker("Temperature", selection: $inputUnit){
                            ForEach(temps, id: \.self){
                                Text("\($0)")
                            }
                        }.pickerStyle(.segmented)
                    case "Length":
                        Picker("Length", selection: $inputUnit){
                            ForEach(lengths, id: \.self){
                                Text("\($0)")
                            }
                        }.pickerStyle(.segmented)
                    case "Time":
                        Picker("Times", selection: $inputUnit){
                            ForEach(times, id: \.self){
                                Text("\($0)")
                            }
                        }.pickerStyle(.segmented)
                    case "Volume":
                        Picker("Volume", selection: $inputUnit){
                            ForEach(volumes, id: \.self){
                                Text("\($0)")
                            }
                        }.pickerStyle(.segmented)
                    default:
                        Text("Pick a unit")
                    }
                    TextField("Amount", value: $inputAmount, format: .number)
                        .keyboardType(.decimalPad)
                } header: {
                    Text("Input")
                }
                Section{
                    switch fieldChosen{
                    case "Temperature":
                        Picker("Temperature", selection: $outputUnit){
                            ForEach(temps, id: \.self){
                                Text("\($0)")
                            }
                        }.pickerStyle(.segmented)
                    case "Length":
                        Picker("Length", selection: $outputUnit){
                            ForEach(lengths, id: \.self){
                                Text("\($0)")
                            }
                        }.pickerStyle(.segmented)
                    case "Time":
                        Picker("Times", selection: $outputUnit){
                            ForEach(times, id: \.self){
                                Text("\($0)")
                            }
                        }.pickerStyle(.segmented)
                    case "Volume":
                        Picker("Volume", selection: $outputUnit){
                            ForEach(volumes, id: \.self){
                                Text("\($0)")
                            }
                        }.pickerStyle(.segmented)
                    default:
                        Text("Pick a unit")
                    }
                    if inputUnit == outputUnit {Text("\((inputAmount).formatted())")}
                    else {
                        switch fieldChosen{
                        case "Temperature":
                            switch inputUnit{
                            case "Celsius":
                                switch outputUnit{
                                case "Fahrenheit":
                                    Text("\((inputAmount*9/5 + 32).formatted())")
                                case "Kelvin":
                                    Text("\((inputAmount+273.15).formatted())")
                                default: Text("Select a unit for both the input and the output")
                                }
                            case "Fahrenheit":
                                switch outputUnit{
                                case "Celsius":
                                    Text("\(((inputAmount-32)*5/9).formatted())")
                                case "Kelvin":
                                    Text("\(((inputAmount-32)*5/9+273.15).formatted())")
                                default: Text("Select a unit for both the input and the output")
                                }
                            case "Kelvin":
                                switch outputUnit{
                                case "Celsius":
                                    Text("\((inputAmount-273.15).formatted())")
                                case "Fahrenheit":
                                    Text("\(((inputAmount-273.15)*9/5+32).formatted())")
                                default: Text("Select a unit for both the input and the output")
                                }
                            default: Text("Select a unit for both the input and the output")
                            }
                        case "Length":
                            switch inputUnit{
                            case "Meter":
                                switch outputUnit{
                                case "Kilometer":
                                    Text("\((inputAmount/1000).formatted())")
                                case "Feet":
                                    Text("\((inputAmount*3.281).formatted())")
                                case "Yard":
                                    Text("\((inputAmount*1.094).formatted())")
                                case "Mile":
                                    Text("\((inputAmount/1609).formatted())")
                                default: Text("Select a unit for both the input and the output")
                                }
                            case "Kilometer":
                                switch outputUnit{
                                case "Meter":
                                    Text("\((inputAmount*1000).formatted())")
                                case "Feet":
                                    Text("\((inputAmount*3281).formatted())")
                                case "Yard":
                                    Text("\((inputAmount*1094).formatted())")
                                case "Mile":
                                    Text("\((inputAmount/1.609).formatted())")
                                default: Text("Select a unit for both the input and the output")
                                }
                            case "Feet":
                                switch outputUnit{
                                case "Meter":
                                    Text("\((inputAmount/3.281).formatted())")
                                case "Kilometer":
                                    Text("\((inputAmount/3281).formatted())")
                                case "Yard":
                                    Text("\((inputAmount/3).formatted())")
                                case "Mile":
                                    Text("\((inputAmount/5280).formatted())")
                                default: Text("Select a unit for both the input and the output")
                                }
                            case "Yard":
                                switch outputUnit{
                                case "Meter":
                                    Text("\((inputAmount/1.094).formatted())")
                                case "Kilometer":
                                    Text("\((inputAmount/1094).formatted())")
                                case "Feet":
                                    Text("\((inputAmount*3).formatted())")
                                case "Mile":
                                    Text("\((inputAmount/1760).formatted())")
                                default: Text("Select a unit for both the input and the output")
                                }
                            case "Mile":
                                switch outputUnit{
                                case "Meter":
                                    Text("\((inputAmount*1609).formatted())")
                                case "Kilometer":
                                    Text("\((inputAmount/1.609).formatted())")
                                case "Feet":
                                    Text("\((inputAmount*5280).formatted())")
                                case "Yard":
                                    Text("\((inputAmount*1760).formatted())")
                                default: Text("Select a unit for both the input and the output")
                                }
                            default: Text("Select a unit for both the input and the output")
                            }
                        case "Time":
                            switch inputUnit{
                            case "Second":
                                switch outputUnit{
                                case "Minute":
                                    Text("\((inputAmount/60).formatted())")
                                case "Hour":
                                    Text("\((inputAmount/3600).formatted())")
                                case "Day":
                                    Text("\((inputAmount/86400).formatted())")
                                default: Text("Select a unit for both the input and the output")
                                }
                            case "Minute":
                                switch outputUnit{
                                case "Second":
                                    Text("\((inputAmount*60).formatted())")
                                case "Hour":
                                    Text("\((inputAmount/60).formatted())")
                                case "Day":
                                    Text("\((inputAmount/3600).formatted())")
                                default: Text("Select a unit for both the input and the output")
                                }
                            case "Hour":
                                switch outputUnit{
                                case "Second":
                                    Text("\((inputAmount*3600).formatted())")
                                case "Minute":
                                    Text("\((inputAmount*60).formatted())")
                                case "Day":
                                    Text("\((inputAmount/24).formatted())")
                                default: Text("Select a unit for both the input and the output")
                                }
                            case "Day":
                                switch outputUnit{
                                case "Second":
                                    Text("\((inputAmount*86400).formatted())")
                                case "Minute":
                                    Text("\((inputAmount/3600).formatted())")
                                case "Hour":
                                    Text("\((inputAmount/60).formatted())")
                                default: Text("Select a unit for both the input and the output")
                                }
                            default: Text("Select a unit for both the input and the output")
                            }
                        case "Volume":
                            switch inputUnit{
                            case "Milliliter":
                                switch outputUnit{
                                case "Liter":
                                    Text("\((inputAmount/1000).formatted())")
                                case "Cup":
                                    Text("\((inputAmount/236.6).formatted())")
                                case "Pint":
                                    Text("\((inputAmount/473.2).formatted())")
                                case "Gallon":
                                    Text("\((inputAmount/3785).formatted())")
                                default: Text("Select a unit for both the input and the output")
                                }
                            case "Liter":
                                switch outputUnit{
                                case "Milliliter":
                                    Text("\((inputAmount*1000).formatted())")
                                case "Cup":
                                    Text("\((inputAmount/0.2366).formatted())")
                                case "Pint":
                                    Text("\((inputAmount/0.4732).formatted())")
                                case "Gallon":
                                    Text("\((inputAmount/3.785).formatted())")
                                default: Text("Select a unit for both the input and the output")
                                }
                            case "Cup":
                                switch outputUnit{
                                case "Milliliter":
                                    Text("\((inputAmount*236.6).formatted())")
                                case "Liter":
                                    Text("\((inputAmount*0.2366).formatted())")
                                case "Pint":
                                    Text("\((inputAmount/2).formatted())")
                                case "Gallon":
                                    Text("\((inputAmount/16).formatted())")
                                default: Text("Select a unit for both the input and the output")
                                }
                            case "Pint":
                                switch outputUnit{
                                case "Milliliter":
                                    Text("\((inputAmount*473.2).formatted())")
                                case "Liter":
                                    Text("\((inputAmount/2.113).formatted())")
                                case "Cup":
                                    Text("\((inputAmount*2).formatted())")
                                case "Gallon":
                                    Text("\((inputAmount/8).formatted())")
                                default: Text("Select a unit for both the input and the output")
                                }
                            case "Gallon":
                                switch outputUnit{
                                case "Milliliter":
                                    Text("\((inputAmount*3785).formatted())")
                                case "Liter":
                                    Text("\((inputAmount/3.785).formatted())")
                                case "Cup":
                                    Text("\((inputAmount*16).formatted())")
                                case "Pint":
                                    Text("\((inputAmount*8).formatted())")
                                default: Text("Select a unit for both the input and the output")
                                }
                                default: Text("Select a unit for both the input and the output")
                            }
                            default: Text("Select a unit for both the input and the output")
                            }
                    }
                } header: {
                    Text("Output")
                }
            }
            .navigationTitle("Unit Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
