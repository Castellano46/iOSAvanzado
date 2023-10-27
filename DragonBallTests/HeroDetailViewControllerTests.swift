//
//  HeroDetailViewControllerTests.swift
//  HeroDetailViewControllerTests
//
//  Created by Pedro on 27/10/23.
//

import XCTest
@testable import DragonBalliOSAvanzado

class HeroDetailViewControllerTests: XCTestCase {

    var heroDetailViewController: HeroDetailViewController!

    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "HeroDetail", bundle: nil)
        heroDetailViewController = storyboard.instantiateViewController(withIdentifier: "HeroDetailViewController") as? HeroDetailViewController
        heroDetailViewController.loadView()
    }

    override func tearDown() {
        heroDetailViewController = nil
        super.tearDown()
    }

    func testViewAppears() {
        XCTAssertNotNil(heroDetailViewController.view)
    }

}
