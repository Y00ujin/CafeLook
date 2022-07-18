//
//  ViewController.swift
//  CafeLook
//
//  Created by 김유진 on 2022/07/04
//

import UIKit
import Then
import SnapKit

final class MainViewController: UIViewController {
    // MARK: - Properties
    private let size = UIScreen.main.bounds
    
    private let areaNameArray = ["서울", "부산", "대구", "인천", "광주", "울산", "세종", "대전"]
    
    private lazy var mainTextImageView = UIImageView().then{
        $0.image = UIImage(named: "CafeLook_MainTextImage")
    }
    
    private lazy var chooseLocationLabel = UILabel().then{
        $0.text = "지역을 선택해보세요!"
        $0.textColor = UIColor(red: 90/255, green: 90/255, blue: 90/255, alpha: 1)
        $0.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 12)
    }
    
    private lazy var areaCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout()).then{
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = size.width/46.875
        $0.collectionViewLayout = layout
        $0.showsHorizontalScrollIndicator = false
        $0.register(AreaCollectionViewCell.self, forCellWithReuseIdentifier: AreaCollectionViewCell.reuseId)
        $0.isScrollEnabled = false
    }
    
    private lazy var cafeTableView = UITableView().then{
        $0.register(CafeTableViewCell.self, forCellReuseIdentifier: CafeTableViewCell.reuseId)
        $0.separatorStyle = .none
    }
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
    }
    
    // MARK: - Helpers
    private func setView(){
        view.backgroundColor = .white
        
        addView()
        addLocation()
        addDelegate()
    }
    
    private func addView(){
        [mainTextImageView, chooseLocationLabel, areaCollectionView, cafeTableView].forEach{ view.addSubview($0) }
    }
    
    private func addLocation(){
        mainTextImageView.snp.makeConstraints{
            $0.left.equalToSuperview().offset(size.width/10.416)
            $0.height.equalToSuperview().dividedBy(10.684)
            $0.width.equalToSuperview().dividedBy(2.232)
            $0.top.equalToSuperview().offset(size.height/6.571)
        }
        
        chooseLocationLabel.snp.makeConstraints{
            $0.top.equalTo(mainTextImageView.snp.bottom).offset(size.height/20.3)
            $0.left.equalTo(mainTextImageView)
        }
        
        areaCollectionView.snp.makeConstraints{
            $0.top.equalTo(chooseLocationLabel.snp.bottom).offset(size.height/101.5)
            $0.left.equalTo(mainTextImageView)
            $0.width.equalToSuperview().dividedBy(1.51)
            $0.height.equalToSuperview().dividedBy(10.49)
        }
        
        cafeTableView.snp.makeConstraints{
            $0.width.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.top.equalTo(areaCollectionView.snp.bottom).offset(size.height/20.76)
        }
    }
    
    private func addDelegate(){
        cafeTableView.delegate = self
        cafeTableView.dataSource = self
        areaCollectionView.delegate = self
        areaCollectionView.dataSource = self
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AreaCollectionViewCell.reuseId, for: indexPath) as! AreaCollectionViewCell
        
        cell.areaNameLabel.text = areaNameArray[indexPath.row]
        
        if ![0, 2, 5, 7].contains(indexPath.row) {
            cell.cellBackgroundView.backgroundColor = UIColor(red: 243/255, green: 241/255, blue: 240/255, alpha: 1)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout  collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: size.width/6.696, height: size.height/29)
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CafeTableViewCell.reuseId, for: indexPath) as! CafeTableViewCell
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return size.height/8.5
    }
}
