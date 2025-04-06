//
//  NomadCountries.swift
//  NomadUtilities
//
//  Created by Justin Ackermann on 3/4/25.
//

import Foundation

public enum Country: String, CaseIterable {
    case Austria
    case Australia
    case Belarus
    case Belgium
    case Brazil
    case Canada
    case China
    case Egypt
    case Finland
    case France
    case Georgia
    case Germany
    case India
    case Indonesia
    case Iraq
    case Israel
    case Italy
    case Japan
    case Mexico
    case Nepal
    case Netherlands
    case NewZealand
    case PapuaNewGuinea
    case Poland
    case Portugal
    case Russia
    case Singapore
    case Slovakia
    case Slovenia
    case SouthAfrica
    case SouthKorea
    case Spain
    case Sweden
    case Switzerland
    case Taiwan
    case Thailand
    case Turkey
    case UnitedKingdom
    case UnitedStates
    case Uzbekistan
    
    /// Initializer to create `Country` from a country code
    public init?(countryCode: String) {
        if let match = Country.allCases.first(where: { $0.countryCode == countryCode.uppercased() }) {
            self = match
        } else {
            return nil
        }
    }
    
    /// Initializer to create `Country` from a phone code
    public init?(phoneCode: String) {
        if let match = Country.allCases.first(where: { $0.phoneCode == phoneCode }) {
            self = match
        } else {
            return nil
        }
    }
    
    public var countryName: String {
        switch self {
        case .Austria:         return "Austria"
        case .Australia:       return "Australia"
        case .Belarus:         return "Belarus"
        case .Belgium:         return "Belgium"
        case .Brazil:          return "Brazil"
        case .Canada:          return "Canada"
        case .China:           return "China"
        case .Egypt:           return "Egypt"
        case .Finland:         return "Finland"
        case .France:          return "France"
        case .Georgia:         return "Georgia"
        case .Germany:         return "Germany"
        case .India:           return "India"
        case .Indonesia:       return "Indonesia"
        case .Iraq:            return "Iraq"
        case .Israel:          return "Israel"
        case .Italy:           return "Italy"
        case .Japan:           return "Japan"
        case .Mexico:          return "Mexico"
        case .Nepal:           return "Nepal"
        case .Netherlands:     return "Netherlands"
        case .NewZealand:      return "New Zealand"
        case .PapuaNewGuinea:  return "Papua New Guinea"
        case .Poland:          return "Poland"
        case .Portugal:        return "Portugal"
        case .Russia:          return "Russia"
        case .Singapore:       return "Singapore"
        case .Slovakia:        return "Slovakia"
        case .Slovenia:        return "Slovenia"
        case .SouthAfrica:     return "South Africa"
        case .SouthKorea:      return "South Korea"
        case .Spain:           return "Spain"
        case .Sweden:          return "Sweden"
        case .Switzerland:     return "Switzerland"
        case .Taiwan:          return "Taiwan"
        case .Thailand:        return "Thailand"
        case .Turkey:          return "Turkey"
        case .UnitedKingdom:   return "United Kingdom"
        case .UnitedStates:    return "United States"
        case .Uzbekistan:      return "Uzbekistan"
        }
    }
    
    public var countryCode: String {
        switch self {
        case .Austria:         return "AT"
        case .Australia:       return "AU"
        case .Belarus:         return "BY"
        case .Belgium:         return "BE"
        case .Brazil:          return "BR"
        case .Canada:          return "CA"
        case .China:           return "CN"
        case .Egypt:           return "EG"
        case .Finland:         return "FI"
        case .France:          return "FR"
        case .Georgia:         return "GE"
        case .Germany:         return "DE"
        case .India:           return "IN"
        case .Indonesia:       return "ID"
        case .Iraq:            return "IQ"
        case .Israel:          return "IL"
        case .Italy:           return "IT"
        case .Japan:           return "JP"
        case .Mexico:          return "MX"
        case .Nepal:           return "NP"
        case .Netherlands:     return "NL"
        case .NewZealand:      return "NZ"
        case .PapuaNewGuinea:  return "PG"
        case .Poland:          return "PL"
        case .Portugal:        return "PT"
        case .Russia:          return "RU"
        case .Singapore:       return "SG"
        case .Slovakia:        return "SK"
        case .Slovenia:        return "SI"
        case .SouthAfrica:     return "ZA"
        case .SouthKorea:      return "KR"
        case .Spain:           return "ES"
        case .Sweden:          return "SE"
        case .Switzerland:     return "CH"
        case .Taiwan:          return "TW"
        case .Thailand:        return "TH"
        case .Turkey:          return "TR"
        case .UnitedKingdom:   return "UK"
        case .UnitedStates:    return "US"
        case .Uzbekistan:      return "UZ"
        }
    }
    
    public var phoneCode: String {
        switch self {
        case .Austria:         return "+43"
        case .Australia:       return "+61"
        case .Belarus:         return "+375"
        case .Belgium:         return "+32"
        case .Brazil:          return "+55"
        case .Canada:          return "+1"
        case .China:           return "+86"
        case .Egypt:           return "+20"
        case .Finland:         return "+358"
        case .France:          return "+33"
        case .Georgia:         return "+995"
        case .Germany:         return "+49"
        case .India:           return "+91"
        case .Indonesia:       return "+62"
        case .Iraq:            return "+964"
        case .Israel:          return "+972"
        case .Italy:           return "+39"
        case .Japan:           return "+81"
        case .Mexico:          return "+52"
        case .Nepal:           return "+977"
        case .Netherlands:     return "+31"
        case .NewZealand:      return "+64"
        case .PapuaNewGuinea:  return "+675"
        case .Poland:          return "+48"
        case .Portugal:        return "+351"
        case .Russia:          return "+7"
        case .Singapore:       return "+65"
        case .Slovakia:        return "+421"
        case .Slovenia:        return "+386"
        case .SouthAfrica:     return "+27"
        case .SouthKorea:      return "+82"
        case .Spain:           return "+34"
        case .Sweden:          return "+46"
        case .Switzerland:     return "+41"
        case .Taiwan:          return "+886"
        case .Thailand:        return "+66"
        case .Turkey:          return "+90"
        case .UnitedKingdom:   return "+44"
        case .UnitedStates:    return "+1"
        case .Uzbekistan:      return "+998"
        }
    }
    
    public var phoneFormat: String {
        switch self {
        case .Austria:         return "XXX XX XX XX"
        case .Australia:       return "XXXX XXX XXX"
        case .Belarus:         return "(XX) XXX-XX-XX"
        case .Belgium:         return "XXX XX XX XX"
        case .Brazil:          return "(XX) XXXXX-XXXX"
        case .Canada:          return "(XXX) XXX-XXXX"
        case .China:           return "XXX-XXXX-XXXX"
        case .Egypt:           return "XX XXXX XXXX"
        case .Finland:         return "XX XXX XXXX"
        case .France:          return "X XX XX XX XX"
        case .Georgia:         return "XXX XX XX XX"
        case .Germany:         return "XXXX XXXXXXX"
        case .India:           return "XXXXX-XXXXX"
        case .Indonesia:       return "XXX-XXXX-XXXX"
        case .Iraq:            return "XXX XXX XXXX"
        case .Israel:          return "XX-XXX-XXXX"
        case .Italy:           return "XXX XXX XXXX"
        case .Japan:           return "XXX-XXXX-XXXX"
        case .Mexico:          return "XXX XXX XXXX"
        case .Nepal:           return "XXXX-XXXXXX"
        case .Netherlands:     return "XX XXX XXXX"
        case .NewZealand:      return "XXX-XXX-XXXX"
        case .PapuaNewGuinea:  return "XXX XX XXX"
        case .Poland:          return "XXX-XXX-XXX"
        case .Portugal:        return "XXX XXX XXX"
        case .Russia:          return "(XXX) XXX-XX-XX"
        case .Singapore:       return "XXXX XXXX"
        case .Slovakia:        return "XXX XXX XXX"
        case .Slovenia:        return "XX XXX XXXX"
        case .SouthAfrica:     return "XX XXX XXXX"
        case .SouthKorea:      return "XXX-XXXX-XXXX"
        case .Spain:           return "XXX XXX XXX"
        case .Sweden:          return "XX-XXX XXXX"
        case .Switzerland:     return "XX XXX XXXX"
        case .Taiwan:          return "XXX-XXXX-XXXX"
        case .Thailand:        return "XX-XXX-XXXX"
        case .Turkey:          return "XXX XXX XXXX"
        case .UnitedKingdom:   return "XXXX XXX XXXX"
        case .UnitedStates:    return "(XXX) XXX-XXXX"
        case .Uzbekistan:      return "XX XXX XX XX"
        }
    }
}
