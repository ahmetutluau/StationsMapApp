//
//  ErrorTypes.swift
//  StationsMapApp
//
//  Created by Ahmet Utlu on 15.02.2023.
//

import Foundation

enum ErrorTypes: String, Error {
    case invalidData = "invalid data"
    case invalidUrl = "invalid url"
    case generalError = "an error happened"
}
