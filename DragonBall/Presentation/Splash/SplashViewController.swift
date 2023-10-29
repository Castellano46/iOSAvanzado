//
//  SplashViewController.swift
//  DragonBalliOSAvanzado
//
//  Created by Pedro on 19/10/23.
//

import UIKit

protocol SplashViewControllerDelegate {
    var viewState: ((SplashViewState) -> Void)? { get set }
    var loginViewModel: LoginViewControllerDelegate { get }
    var heroesViewModel: HeroesViewControllerDelegate { get }

    func onViewAppear()
}

// Posibles estados de la vista Splash
enum SplashViewState {
    case loading(_ isLoading: Bool)
    case navigateToLogin
    case navigateToHeroes
}

class SplashViewController: UIViewController {
    @IBOutlet weak var loading: UIActivityIndicatorView!

    var viewModel: SplashViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        setObservers()
        viewModel?.onViewAppear()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Transición a las vistas, Login o Héroes
        switch segue.identifier {
            case "SPLASH_TO_LOGIN":
                guard let loginViewController = segue.destination as? LoginViewController else { return }
                loginViewController.viewModel = viewModel?.loginViewModel

            case "SPLASH_TO_HEROES":
                guard let heroesViewController = segue.destination as? HeroesViewController else { return }
                heroesViewController.viewModel = viewModel?.heroesViewModel

            default:
                break
        }
    }

    private func setObservers() {
        viewModel?.viewState = { [weak self] state in
            DispatchQueue.main.async {
                switch state {
                    case .loading(let isLoading):
                        self?.loading.isHidden = !isLoading

                    case .navigateToLogin:
                        self?.performSegue(withIdentifier: "SPLASH_TO_LOGIN", sender: nil)

                    case .navigateToHeroes:
                        self?.performSegue(withIdentifier: "SPLASH_TO_HEROES", sender: nil)
                }
            }
        }
    }
}
