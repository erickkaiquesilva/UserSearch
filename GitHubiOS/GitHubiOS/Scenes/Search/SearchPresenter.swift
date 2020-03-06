//
//  SearchPresenter.swift
//  GitHubiOS
//
//  Created by Erick Kaique Da Silva on 03/03/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import Foundation

class SearchPresenter: SearchPresenterProtocol {
    
    var controller: SearchViewControllerProtocol?
    let network: NetworkProtocol = Network()
    
    
    func validateData(_ string: String?) {
        guard let searchData = string, !searchData.isEmpty else {
            controller?.errorView("Para fazer uma pesquisa é necessário preencher o campo de busca")
            return
        }
        request(searchData)
    }
    
    private func request(_ string: String) {
        network.request(endpoind: GithubEndPoint.user(string)) { (result) in
            switch result {
            case .success(let data):
                guard let user = try? JSONDecoder().decode(User.self, from: data) else { return }
                self.request(user)
            case .failure(let error):
                self.controller?.errorView("O usuário pesquisado não existe, confira o login e tente novamente.")
                print(error.localizedDescription)
            }
        }
    }
    
    private func request(_ user: User) {
        network.request(endpoind: GithubEndPoint.repos(user.login)) { (result) in
            switch result {
            case .success(let data):
                guard let repositores = try? JSONDecoder().decode([Repositores].self, from: data) else { return }
                self.controller?.showDetail(user, repositores: repositores)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
