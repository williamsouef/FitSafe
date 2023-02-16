//
//  Modeltests.swift
//  FitSafeTests
//
//  Created by William Souef on 16/02/2023.
//

import XCTest
@testable import FitSafe

final class Modeltests: XCTestCase {

    private var provider : ItemsProvider!
    
    
    
    override  func setUp() {
        provider = .shared
    }
    
    override  func tearDown() {
        provider = nil
    }
    func testItemisEmpty() {
        
        let item = Item.empty(context: provider.viewContext)
        XCTAssertEqual(item.name,"")
        XCTAssertEqual(item.capacity,0)
        XCTAssertEqual(item.newRun,0)
    }
 
    func testItemisNotValid() {
        let item = Item.empty(context: provider.viewContext)
        
    }

    func testItemisValid() {
        
    }
}
