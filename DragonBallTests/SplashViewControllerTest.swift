//
//  SplashViewControllerTest.swift
//  SplashViewControllerTest
//
//  Created by Pedro on 27/10/23.
//

import XCTest
@testable import DragonBalliOSAvanzado

class SplashViewControllerTests: XCTestCase {
    
    var splashViewController: SplashViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Splash", bundle: nil)
        splashViewController = storyboard.instantiateViewController(withIdentifier: "SplashViewController") as? SplashViewController
        splashViewController.loadView()
    }
    
    override func tearDown() {
        splashViewController = nil
        super.tearDown()
    }
    
    func testViewAppears() {
        XCTAssertNotNil(splashViewController.view)
    }
}
