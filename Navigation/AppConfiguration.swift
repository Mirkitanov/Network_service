//
//  AppConfiguration.swift
//  Navigation
//
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//



import Foundation

enum AppConfiguration: String {
    
    case people = "http://swapi.dev/api/people/8/"
    case planets = "http://swapi.dev/api/planets/5/"
    case starships = "http://swapi.dev/api/starships/3/"
    
    static func random() -> AppConfiguration {
        var appConfiguration: AppConfiguration
        
        let randomItem = Int.random(in: 0...2)
        switch randomItem {
        case 0:
            appConfiguration = .people
        case 1:
            appConfiguration = .planets
        default:
            appConfiguration = .starships
        }

        return appConfiguration
    }
    
}
