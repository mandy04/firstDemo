//
//  bookTableViewCell.swift
//  wNews
//
//  Created by llbt on 15/6/12.
//  Copyright (c) 2015年 llbt. All rights reserved.
//

import UIKit

class bookTableViewCell: UITableViewCell {
    
    var  _bookImageView : UIImageView!
    var  _bookTitleLabel : UILabel!
    var  _bookPrice : UILabel!
    var  _bookInfo : UILabel!
    var  _separatorLine : UIImageView!
    
    var bModel:bookModel!
    
    override init?(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createBookCell()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createBookCell(){
        _bookImageView = UIImageView(frame:CGRectMake(5,5,60,60))
        _bookTitleLabel = UILabel(frame:CGRectMake(80, 5, 300, 20))
        _bookTitleLabel.backgroundColor = UIColor.clearColor()
        _bookTitleLabel.font = UIFont.systemFontOfSize(18)
        _bookPrice = UILabel(frame: CGRectMake(80, 25, 300, 20))
        _bookPrice.backgroundColor = UIColor.clearColor()
        _bookInfo = UILabel(frame: CGRectMake(80, 45, 300, 20))
        _bookInfo.backgroundColor = UIColor.clearColor()
        _separatorLine = UIImageView(frame: CGRectMake(5, 67, 365, 1))
        _separatorLine.backgroundColor = UIColor.lightGrayColor()

        self.contentView.addSubview(_bookInfo)
        self.contentView.addSubview(_bookPrice)
        self.contentView.addSubview(_bookTitleLabel)
        self.contentView.addSubview(_bookImageView)
        self.contentView.addSubview(_separatorLine)

        
    }
    
    func loadData(){
        //属性传值  设置第一张图
        _bookImageView.image = UIImage(named:self.bModel.bookImage)
        _bookTitleLabel.text = self.bModel.booktitle
        _bookPrice.text = self.bModel.bookPrice
        _bookInfo.text = self.bModel.bookInfo
        
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
