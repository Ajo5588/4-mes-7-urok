//
//  ViewController.swift
//  4 mes 7 urok
//
//  Created by Ажо Алмасбеков on 12/1/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var items: [ItemInfo] = [Product(title: "Mercedes"), News(title: "Sale for abonement"), Product(title: "iPhone"), Product(title: "Nike"), News(title: "Мероприятие в центре") ]
    
    private lazy var itemsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(ItemCell.self, forCellWithReuseIdentifier: ItemCell.reuseID)
        view.dataSource = self
        view.delegate = self
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    
    func setupSubviews() {
        view.addSubview(itemsCollectionView)
        itemsCollectionView.snp.makeConstraints { make in
            make.left.right.bottom.top.equalToSuperview()
        }
    }


}

extension ViewController: UICollectionViewDataSource {
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return items.count
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCell.reuseID, for: indexPath) as! ItemCell
    cell.delegate = self
    cell.fill(item: items[indexPath.row])
    cell.indexPath = indexPath
    return cell
}
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: view.frame.width, height: 200)
        }
        
    }

extension ViewController: ItemClick {
    func favouriteTap(indexPath: IndexPath) {
        print(items[indexPath.row].title)
    }
    
    
    
}


