//
//  Text2HexTests.swift
//  Text2HexTests
//
//  Created by Менетиос on 17.12.2021.
//

import XCTest
@testable import Text2Hex

class Text2HexTests: XCTestCase {

    func testEmptyString() {
        let string = ""
        let hex = ""
      
       try XCTAssertEqual(convertToHex(str: string), hex)
       
    }
    
    func testZero() {
        let hex = "0"
        XCTAssertEqual(convertToHex(number: 0), hex)
    }
   
    func testNumberLessThan16() {
        let hex = "F"
      XCTAssertEqual(convertToHex(number: 15), hex)
    }
    
    func testNumberMoreThan16() {
        let hex = "11"
       XCTAssertEqual(convertToHex(number: 17), hex)
    }
    
    
    func testAString() {
        let string = "A"
        let hex = "41"
        try XCTAssertEqual(convertToHex(str: string), hex)
    }
    
    func testHelloString() {
        let string = "hello"
        let hex = "68656C6C6F"
        try XCTAssertEqual(convertToHex(str: string), hex)
    }
    
    func testSpaceString() {
        let string = "   "
        let hex = "202020"
        try XCTAssertEqual(convertToHex(str: string), hex)
    }
    


}
