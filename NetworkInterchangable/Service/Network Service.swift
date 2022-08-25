//
//  Network Service.swift
//  NetworkInterchangable
//
//  Created by Melih Yuvacı on 25.08.2022.
//

import Foundation

protocol NetworkService {
    func download(_ resource:String) async throws -> [User]
    var type: String {get}
}
