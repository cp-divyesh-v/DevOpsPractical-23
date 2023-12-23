//
//  HomeViewModelTestCase.swift
//  DevOpsPractical23
//
//  Created by Divyesh on 23/12/23.
//

import XCTest
@testable import DevOpsPractical23

final class HomeViewModelTestCase: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func testGetCollageList() {
        // Given
        let expectation = XCTestExpectation(description: "API Request")
        
        // Create a MockWebService instance with the desired result
        let mockWebService = MockWebService()
        mockWebService.expectation = expectation
        mockWebService.result = .success(MockResponse.mockResponse("University")!)
        
        // Explicitly type-cast mockWebService to WebServiceProtocol
        let viewModel = HomeViewModel(webService: mockWebService as WebServiceProtocol)
        
        // When
        viewModel.getCollageList("India")

        // Then
        XCTAssertEqual(viewModel.university.count, 1)
        XCTAssertEqual(viewModel.university.first?.name, "University of Petroleum and Energy Studies")
        XCTAssertEqual(viewModel.university.first?.country, "India")
    }
}
