//
//  temperatureData.swift
//  InputTesting
//
//  Created by Alexander Perez on 2023/11/7.
//

import Foundation


class TemperatureClass : ObservableObject{
    
    @Published var insertedValue : Double = 0
    @Published var celsiusValue : Double = 0
    @Published var farenValue : Double = 0
    @Published var isCelsius : Bool = true
    
    func resetTemp(){
        celsiusValue = 0
        farenValue = 0
        insertedValue = 0
        
    }
    func increaseBy1(){
        
        insertedValue += 1
        setValues()
        /*
        if isCelsius == true {
            celsiusValue += 1
            convertValue()
        } else {
            farenValue += 1
            convertValue()
        }*/
    }
    
    func decreaseBy1(){
        insertedValue -= 1
        setValues()
        /*if isCelsius == true {
            celsiusValue -= 1
            convertValue()
        } else {
            farenValue -= 1
            convertValue()
        }*/

    }
    
    func setInverse(){
        insertedValue *= -1
        convertValue()
    }
    
    
    func setValues(){
        if isCelsius == true{
            celsiusValue = insertedValue
        } else {
            farenValue = insertedValue
        }
        convertValue()
    }
    
    
    func convertValue(){
        if isCelsius == true {
            let temp_farenValue = ((9.0/5.0)*celsiusValue + 32)
            farenValue = round(temp_farenValue * 10) / 10
        } else {
            //farenValue = celsiusValue
            let temp_celsiusValue = (farenValue - 32) / 1.8
            celsiusValue = round(temp_celsiusValue * 10) / 10
        }
    }
    
    func toggleCelsius(){
        isCelsius = true
        setValues()
    }
    func toggleFarenheit(){
        isCelsius = false
        setValues()
    }
}
