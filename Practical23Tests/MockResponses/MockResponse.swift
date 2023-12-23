//
//  MockHomeWebService.swift
//  DevOpsPractical23Tests
//
//  Created by Divyesh on 23/12/23.
//

@testable import DevOpsPractical23
import XCTest

class MockResponse {
    static func mockResponse(_ fileName: String) -> Data? {
        guard let path = Bundle.main.path(forResource: fileName, ofType: "geojson") else {
            fatalError("file not found")
        }
        
        do {
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: path))
            return jsonData
        } catch {
            fatalError("Failed to read University.json file: \(error)")
        }
    }
}
