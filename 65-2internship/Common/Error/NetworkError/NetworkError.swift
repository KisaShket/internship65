//
//  ErrorLocalized.swift
//  65-2internship
//
//  Created by Kisa Shket on 13.02.2021.
//  Copyright © 2021 Kisa Shket. All rights reserved.
//

enum NetworkError: Error {
        case unableToComplete
        case wrongRequest(statusCode: Int)
        case wrongData
        case noUrl
}
