//
//  DateUtils.swift
//  Flickr
//
//  Created by Yusuf Ekiz on 16.02.2019.
//  Copyright © 2019 Yusuf Ekiz. All rights reserved.
//

import Foundation

class DateUtils {
    
    static let apiDateFormat = "yyyy-MM-dd HH:mm:ss"
    static let uiDateFormat = "dd-MM-yyyy"
    
    static func convertTimeStampToDateString(timeStamp: String) -> String {
        if let timeStamp = Double(timeStamp) {
            let exactDate = NSDate.init(timeIntervalSince1970: timeStamp)
            let dateFormatt = DateFormatter();
            dateFormatt.dateFormat = "dd-MM-yyyy"
            return dateFormatt.string(from: exactDate as Date)
        }
    
        return ""
    }
    
    static func getDayFromDateString(dateString: String) -> String {
        let dateFormatter = DateFormatter();
        dateFormatter.dateFormat = apiDateFormat
        
        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateFormat = uiDateFormat
            return dateFormatter.string(from: date)
        }
        
        return ""
    }
    
}
