//
//  adTableViewCell.swift
//  wNews
//
//  Created by llbt on 15/6/12.
//  Copyright (c) 2015年 llbt. All rights reserved.
//

import UIKit

class adTableViewCell: UITableViewCell,UIScrollViewDelegate {
    
    var _scrollView : UIScrollView!
    var _adTitleLabel : UILabel!//广告标题
    var _adImage : UIImageView!
    var _adArray = Array<adModel>()//广告数据源
    var _pageControl : UIPageControl!
    var _tipView : UIView!//阴影部分
    
    var wwidth = UIScreen.mainScreen().bounds.width
    var hheight = UIScreen.mainScreen().bounds.height

    
    override init?(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createAdCellWithArray(array:Array<adModel>) {

        _adArray = array
        
        //判断数据是否是最新
        if( _adArray != array)
        {
            //如果不是最新的数据，用最新的数据刷上去
            _adArray = array as Array
        }
        println(wwidth)// 当前屏幕宽度375.0f
        println(hheight)// 屏幕高度667.0f
        
        _scrollView = UIScrollView(frame: CGRectMake(0, 20, wwidth, 160))
        _scrollView.backgroundColor = UIColor.clearColor()
        _scrollView.delegate = self
        _scrollView.showsHorizontalScrollIndicator = false
        _scrollView.showsVerticalScrollIndicator = true
        _scrollView.pagingEnabled = true
        var width : CGFloat = _scrollView!.frame.size.width * CGFloat(_adArray.count)
        var height : CGFloat = _scrollView!.frame.size.height
        _scrollView!.contentSize = CGSizeMake(width, height)
        
        var x : CGFloat = 0.0

        for model:adModel in _adArray {
            
            //创建新图片
            var scrollFrame = _scrollView!.frame
            _adImage = UIImageView(image: UIImage(named: model.adimage))
            _adImage.frame = CGRect(x: x, y: 0.0,width: scrollFrame.size.width, height: scrollFrame.size.height)
            _scrollView!.addSubview(_adImage)
            self.contentView.addSubview(_scrollView)
            
            _tipView = UIView(frame:CGRectMake(0,150,_scrollView.frame.width,30))
            _tipView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
            
            _pageControl = UIPageControl(frame:CGRectMake(230,5,100,20))
            //设置页面控制器上广告的数据条数 4
            _pageControl.numberOfPages = _adArray.count
            _pageControl.currentPage = 0
            self.contentView.addSubview(_tipView)
            _tipView.addSubview(_pageControl)
            
            //把标题从模型上拿出来
             var model_label :adModel = _adArray[0] as adModel
            _adTitleLabel = UILabel(frame:CGRectMake(10, 5, 150, 20))
            _adTitleLabel.text = model_label.adTitle
            _adTitleLabel.textColor = UIColor.whiteColor()
            _tipView.addSubview(_adTitleLabel)
            
            x += _scrollView.frame.width;
      }
    
    }
    
    
    func scrollViewDidEndDecelerating(scrollView : UIScrollView)
    {
        var OffsetX = scrollView.contentOffset.x
        var Width = scrollView.frame.size.width
        var page = OffsetX / Width
        _pageControl.currentPage = Int(page)
        
        var model:adModel = _adArray[_pageControl.currentPage] as adModel
        _adTitleLabel.text=model.adTitle;
        
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
