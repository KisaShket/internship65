//
//  AuthErrorExtension.swift
//  65-2internship
//
//  Created by Kisa Shket on 13.02.2021.
//  Copyright © 2021 Kisa Shket. All rights reserved.
//

import Foundation

extension AuthError : LocalizedError {
    var errorDescription: String?{
        switch self {
    
        case .userAuthError:
            return NSLocalizedString(
                "Unable authorize, please try again later.", comment: "")
        }
    }
}
