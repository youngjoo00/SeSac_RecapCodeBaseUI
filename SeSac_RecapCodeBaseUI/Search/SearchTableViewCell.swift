//
//  SearchTableViewCell.swift
//  SeSac_RecapCodeBaseUI
//
//  Created by youngjoo on 1/29/24.
//

import UIKit
import SnapKit
import Then

class SearchTableViewCell: UITableViewCell {

    let searchImageView = UIImageView()
    let titleLabel = UILabel()
    let removeBtn = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureHierarchy()
        configureView()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SearchTableViewCell: ViewProtocol {
    func configureHierarchy() {
        
        [
            searchImageView,
            titleLabel,
            removeBtn,
        ].forEach { contentView.addSubview($0) }
    }
    
    func configureView() {
        contentView.backgroundColor = .black
        searchImageView.configureImageView(image: UIImage(systemName: "magnifyingglass"), cornerRadius: 0)
        searchImageView.tintColor = .white
        
        titleLabel.configureLabel(text: "", textColor: .white, backgroundColor: .clear, font: .systemFont(ofSize: 14), textAlignment: .natural)
        removeBtn.setImage(UIImage(systemName: "xmark"), for: .normal)
        removeBtn.tintColor = .systemGray5
    }
    
    func configureConstraints() {
        searchImageView.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.leading.equalTo(16)
            make.size.equalTo(30)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.leading.equalTo(searchImageView.snp.trailing).offset(20)
            make.trailing.greaterThanOrEqualTo(removeBtn).inset(-16)
        }
        
        removeBtn.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.trailing.equalTo(-16)
            make.size.equalTo(30)
        }
    }
    
    
}

#Preview {
    SearchTableViewCell()
}
