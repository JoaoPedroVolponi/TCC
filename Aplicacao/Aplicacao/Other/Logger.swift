//
//  Logger.swift
//  Aplicacao
//
//  Created by João PedroVolponi on 01/11/23.
//

import Foundation

class Logger {
    
    static func log(_ message: String, file: String = #file, line: Int = #line, function: String = #function) {
        print("Message: \(message)")
        print("File: \(file)")
        print("Line: \(line)")
        print("Function: \(function)")
    }
}
