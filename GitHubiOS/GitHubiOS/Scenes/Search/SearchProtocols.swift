//
//  SearchProtocols.swift
//  GitHubiOS
//
//  Created by Erick Kaique Da Silva on 03/03/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

protocol SearchViewControllerProtocol: class {
    func showDetail(_ user: User, repositores: [Repositores])
    func errorView(_ error: String)
}

protocol SearchPresenterProtocol {
    var controller: SearchViewControllerProtocol? { get set }
    func validateData(_ string: String?)
}

protocol SearchViewControllerRouter {
    func routerSearch(_ user: User, repositores: [Repositores])
}
