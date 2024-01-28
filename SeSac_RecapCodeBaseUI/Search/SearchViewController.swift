//
//  SearchViewController.swift
//  SeSac_RecapCodeBaseUI
//
//  Created by youngjoo on 1/28/24.
//

import UIKit
import SnapKit
import Then

class SearchViewController: UIViewController {

    let naviTitle = UILabel()
    
    let searchBar = UISearchBar()
    let recentSearchLabel = UILabel()
    let allRemoveBtn = UIButton()
    
    let searchListTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
        configureView()
        configureConstraints()
    }
    
}

extension SearchViewController: ViewProtocol {
    
    func configureHierarchy() {
        [
            searchBar,
            recentSearchLabel,
            allRemoveBtn,
            searchListTableView,
        ].forEach { view.addSubview($0) }
    }
    
    func configureView() {
        view.backgroundColor = .black
        naviTitle.configureLabel(text: "뭐시기님의 새싹쇼핑", textColor: .white, backgroundColor: .clear, font: .boldSystemFont(ofSize: 20), textAlignment: .center)
        self.navigationItem.titleView = naviTitle
        
        searchBar.searchBarStyle = .minimal
        searchBar.searchTextField.backgroundColor = .systemGray5
        searchBar.placeholder = "브랜드, 상품, 프로필, 태그 등"
        
        recentSearchLabel.configureLabel(text: "최근 검색", textColor: .white, backgroundColor: .clear, font: .boldSystemFont(ofSize: 15), textAlignment: .natural)
        
        allRemoveBtn.configureBtn(image: nil, title: "모두 지우기", backgroundColor: .clear, textColor: .pointColor, font: .boldSystemFont(ofSize: 15), cornerRadius: 0)

        searchListTableView.dataSource = self
        searchListTableView.delegate = self
        searchListTableView.backgroundColor = .clear
        searchListTableView.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.identifier)
    }
    
    func configureConstraints() {
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
        
        recentSearchLabel.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(12)
            make.leading.equalTo(16)
        }
        
        allRemoveBtn.snp.makeConstraints { make in
            make.centerY.equalTo(recentSearchLabel).offset(-2)
            make.trailing.equalTo(-16)
        }
        
        searchListTableView.snp.makeConstraints { make in
            make.top.equalTo(recentSearchLabel.snp.bottom).offset(12)
            make.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchListTableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier, for: indexPath) as! SearchTableViewCell
        
        cell.titleLabel.text = "안녕"
        return cell
    }
    
    
}

#Preview {
    SearchViewController()
}
