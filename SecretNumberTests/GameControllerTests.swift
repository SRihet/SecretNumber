//
//  GameControllerTests.swift
//  SecretNumberTests
//
//  Created by Stéphane Rihet on 28/04/2020.
//  Copyright © 2020 SapinRocher. All rights reserved.
//

import XCTest
@testable import SecretNumber

class GameControllerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let gameController = GameController()
        XCTAssertFalse(gameController.isGameInProgress)
        gameController.startNewGame(withSecretNumber: 40)
        XCTAssertTrue(gameController.isGameInProgress)
        gameController.verifyGuessedValue(20)
        XCTAssertTrue(gameController.isGameInProgress)
        gameController.verifyGuessedValue(60)
        XCTAssertTrue(gameController.isGameInProgress)
        gameController.verifyGuessedValue(40)
        XCTAssertFalse(gameController.isGameInProgress)
    
    }

    func testBoundaries () {
        let gameController = GameController()
        gameController.startNewGame(withSecretNumber: 60)
        XCTAssertEqual(GameController.MIN_VALUE, gameController.lowBoundary)
        XCTAssertEqual(GameController.MAX_VALUE, gameController.highBoundary)
        
        gameController.verifyGuessedValue(30)
        XCTAssertEqual(30, gameController.lowBoundary)
        XCTAssertEqual(GameController.MAX_VALUE, gameController.highBoundary)
        
        gameController.verifyGuessedValue(70)
        XCTAssertEqual(30, gameController.lowBoundary)
        XCTAssertEqual(70, gameController.highBoundary)
        
        gameController.verifyGuessedValue(55)
        XCTAssertEqual(55, gameController.lowBoundary)
        XCTAssertEqual(70, gameController.highBoundary)
        
        gameController.verifyGuessedValue(65)
        XCTAssertEqual(55, gameController.lowBoundary)
        XCTAssertEqual(65, gameController.highBoundary)
        
        gameController.startNewGame()
        XCTAssertEqual(GameController.MIN_VALUE, gameController.lowBoundary)
        XCTAssertEqual(GameController.MAX_VALUE, gameController.highBoundary)
}
}
