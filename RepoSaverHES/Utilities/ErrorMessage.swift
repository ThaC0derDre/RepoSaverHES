//
//  ErrorMessage.swift
//  RepoSaverHES
//
//  Created by Andres Gutierrez on 11/19/22.
//

import Foundation

enum ErrorMessage: String, Error {
    case invalidURL         = "Bad URL. Please check link and try again"
    case noNetwork          = "Unable to complete request. Please check your internet connection"
    case invalidResponse    = "Invalid response from server. Please try again"
    case invalidData        = "Invaild data from server. Please try again"
    case emptyList          = "No employees found!"
    case fetchLimitExceeded = "Fetch limit exceeded for the hour. Please try again later."
}
