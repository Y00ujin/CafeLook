//
//  CafeTableViewCell.swift
//  CafeLook
//
//  Created by 김유진 on 2022/07/05.
//

import UIKit

class CafeTableViewCell: UITableViewCell {
    // MARK: - Properties
    static let reuseId = "\(CafeTableViewCell.self)"
        
    private let size = UIScreen.main.bounds
    
    lazy var cellBackgroundView = UIView().then{
        $0.layer.borderColor = UIColor(red: 227/255, green: 221/255, blue: 218/255, alpha: 1).cgColor
        $0.layer.borderWidth = 2
        $0.layer.cornerRadius = size.height/29/2
        $0.layer.shadowColor = UIColor.lightGray.cgColor
        $0.layer.shadowOffset = CGSize(width: 0, height: 4)
        $0.layer.cornerRadius = 13
    }
    
    private lazy var labelContainerView = UIView()
    
    lazy var cafeNameLabel = UILabel().then{
        $0.text = "Cafe Name"
        $0.textColor = UIColor(red: 118/255, green: 96/255, blue: 87/255, alpha: 1)
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 15)
    }
    
    lazy var cafeLocationLabel = UILabel().then{
        $0.text = "Cafe Location"
        $0.font = UIFont(name: "AppleSDGothicNeo-Thin", size: 10)
    }
    
    // MARK: - LifeCycles
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: size.width/20.416, left: size.width/10.416, bottom: 0, right: size.width/10.416))
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
        contentView.addSubview(cellBackgroundView)
        cellBackgroundView.addSubview(labelContainerView)
        [cafeNameLabel, cafeLocationLabel].forEach{ labelContainerView.addSubview($0) }
    }
    
    private func addLocation(){
        cellBackgroundView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        labelContainerView.snp.makeConstraints {
            $0.height.equalToSuperview().dividedBy(2)
            $0.left.equalToSuperview().offset(size.width/15)
            $0.width.equalToSuperview().dividedBy(1.4)
            $0.centerY.equalToSuperview()
        }
        
        cafeNameLabel.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        cafeLocationLabel.snp.makeConstraints{
            $0.left.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}
