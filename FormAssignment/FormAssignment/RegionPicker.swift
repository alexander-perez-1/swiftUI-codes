//
//  RegionPicker.swift
//  FormAssignment
//
//  Created by Alexander Perez on 2023/11/18.
//

import Foundation
import SwiftUI


struct CountryPicker : View {
    //let countryid = Locale.Region.isoRegions
    @Binding var someone : Person
    //@State var selectedCountry : Int = 1
    
    
    var body: some View {
        
        
        List(NSLocale.isoCountryCodes, id: \.self){ countryCodes in
            
            HStack{
                Text(Locale.current.localizedString(
                    forRegionCode: countryCodes) ?? "TW")
                Spacer()
                Text(countryCodes)
            }
            .onTapGesture {
                someone.country = Locale.current.localizedString(forRegionCode: countryCodes) ?? "TW"
            }
        }
    }
    
}
