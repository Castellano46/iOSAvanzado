//
//  LoginViewControllerTests.swift
//  LoginViewControllerTests
//
//  Created by Pedro on 27/10/23.
//

import XCTest
@testable import DragonBalliOSAvanzado

class LoginViewControllerTests: XCTestCase {

    var loginViewController: LoginViewController!

    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
        loginViewController.loadView()
    }

    override func tearDown() {
        loginViewController = nil
        super.tearDown()
    }

    func testViewAppears() {
        XCTAssertNotNil(loginViewController.view)
    }

    func testValidLogin() {
        loginViewController.onLoginPressed()
    }

    func testInvalidLogin() {
        loginViewController.onLoginPressed()
    }
}
