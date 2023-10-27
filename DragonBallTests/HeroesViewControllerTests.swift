//
//  HeroesViewControllerTests.swift
//  DragonBalliOSAvanzadoTests
//
//  Created by Pedro on 27/10/23.
//

import XCTest
@testable import DragonBalliOSAvanzado

class HeroesViewControllerTests: XCTestCase {

    var viewController: HeroesViewController!

    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Heroes", bundle: nil)
        viewController = storyboard.instantiateViewController(withIdentifier: "HeroesViewController") as? HeroesViewController
        viewController.loadView()
    }

    override func tearDown() {
        viewController = nil
        super.tearDown()
    }

    func testViewDidLoad() {
        XCTAssertNotNil(viewController.tableView, "tableView should not be nil")
        XCTAssertNotNil(viewController.loadingView, "loadingView should not be nil")
        XCTAssertNotNil(viewController.searchBar, "searchBar should not be nil")
    }

    func testLogoutTapped() {
        viewController.logoutTapped(UIButton())
    }
}
