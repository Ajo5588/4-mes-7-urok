//
//  ItemCell.swift
//  4 mes 7 urok
//
//  Created by Ажо Алмасбеков on 12/1/23.
//

import Foundation
import UIKit
import SnapKit

protocol ItemClick: AnyObject {
    func favouriteTap(indexPath: IndexPath)
}

class ItemCell: UICollectionViewCell {
    
    static var reuseID = "item_cell"
    
    weak var delegate: ItemClick?
    
    var indexPath: IndexPath?
    
    private lazy var titleLabel : UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return view
    }()
    
    private lazy var favouriteImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "heart.fill")
        view.tintColor = UIColor.systemRed
        view.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(favouriteTap))
        view.addGestureRecognizer(tap)
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubViews() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
        }
        addSubview(favouriteImageView)
        favouriteImageView.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-20)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(45)
        }
    }
    func fill(item: ItemInfo) {
        titleLabel.text = item.title
    }
    
    @objc func favouriteTap() {
        delegate?.favouriteTap(indexPath: indexPath!)
    }
}

