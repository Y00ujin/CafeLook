//
//  AreaCollectionViewCell.swift
//  CafeLook
//
//  Created by 김유진 on 2022/07/05.
//

import UIKit

final class AreaCollectionViewCell: UICollectionViewCell {
    // MARK: - Properties
    static let reuseId = "\(AreaCollectionViewCell.self)"
        
    private let size = UIScreen.main.bounds
    
    lazy var cellBackgroundView = UIView().then{
        $0.backgroundColor = UIColor(red: 227/255, green: 221/255, blue: 218/255, alpha: 1)
        $0.layer.cornerRadius = size.height/29/2
    }
    
    lazy var areaNameLabel = UILabel().then{
        $0.textColor = UIColor(red: 109/255, green: 109/255, blue: 109/255, alpha: 1)
        $0.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 10)
    }
    
    // MARK: - LifeCycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    private func setView(){
        addView()
        addLocation()
    }
    
    private func addView(){
        self.addSubview(cellBackgroundView)
        cellBackgroundView.addSubview(areaNameLabel)
    }
    
    private func addLocation(){
        cellBackgroundView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        areaNameLabel.snp.makeConstraints{
            $0.center.equalToSuperview()
        }
    }
}
