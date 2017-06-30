//
//  DateExtensions.swift
//  SwifterSwift
//
//  Created by Omar Albeik on 8/5/16.
//  Copyright © 2016 Omar Albeik. All rights reserved.
//

import Foundation


public extension NSDate {
    
    /// SwifterSwift: Day name format.
    ///
    /// - threeLetters: 3 letter day abbreviation of day name.
    /// - oneLetter: 1 letter day abbreviation of day name.
    /// - full: Full day name.
    @objc public enum DayNameStyle: Int {
        case threeLetters
        case oneLetter
        case full
    }
    
    /// SwifterSwift: Month name format.
    ///
    /// - threeLetters: 3 letter month abbreviation of month name.
    /// - oneLetter: 1 letter month abbreviation of month name.
    /// - full: Full month name.
    @objc public enum MonthNameStyle: Int {
        case threeLetters
        case oneLetter
        case full
    }
    
}


// MARK: - Properties
public extension NSDate {
    
    /// SwifterSwift: User’s current calendar.
    public var calendar: Calendar {
        return Calendar.current
    }
    
    /// SwifterSwift: Era.
    public var era: Int {
        return calendar.component(.era, from: self as Date)
    }
    
    /// SwifterSwift: Year.
    public var year: Int {
        get {
            return calendar.component(.year, from: self as Date)
        }
    }
    
    /// SwifterSwift: Quarter.
    public var quarter: Int {
        return calendar.component(.quarter, from: self as Date)
    }
    
    /// SwifterSwift: Month.
    public var month: Int {
        get {
            return calendar.component(.month, from: self as Date)
        }
    }
    
    /// SwifterSwift: Week of year.
    public var weekOfYear: Int {
        return calendar.component(.weekOfYear, from: self as Date)
    }
    
    /// SwifterSwift: Week of month.
    public var weekOfMonth: Int {
        return calendar.component(.weekOfMonth, from: self as Date)
    }
    
    /// SwifterSwift: Weekday.
    public var weekday: Int {
        get {
            return calendar.component(.weekday, from: self as Date)
        }
    }
    
    /// SwifterSwift: Day.
    public var day: Int {
        get {
            return calendar.component(.day, from: self as Date)
        }
    }
    
    /// SwifterSwift: Hour.
    public var hour: Int {
        get {
            return calendar.component(.hour, from: self as Date)
        }
    }
    
    /// SwifterSwift: Minutes.
    public var minute: Int {
        get {
            return calendar.component(.minute, from: self as Date)
        }
    }
    
    /// SwifterSwift: Seconds.
    public var second: Int {
        get {
            return calendar.component(.second, from: self as Date)
        }
    }
    
    /// SwifterSwift: Nanoseconds.
    public var nanosecond: Int {
        get {
            return calendar.component(.nanosecond, from: self as Date)
        }
    }
    
    /// SwifterSwift: Milliseconds.
    public var millisecond: Int {
        get {
            return calendar.component(.nanosecond, from: self as Date) / 1000000
        }
    }
    
    /// SwifterSwift: Check if date is in future.
    public var isInFuture: Bool {
        return (self as Date) > Date()
    }
    
    /// SwifterSwift: Check if date is in past.
    public var isInPast: Bool {
        return (self as Date) < Date()
    }
    
    /// SwifterSwift: Check if date is in today.
    public var isInToday: Bool {
        return calendar.isDateInToday(self as Date)
    }
    
    /// SwifterSwift: Check if date is within yesterday.
    public var isInYesterday: Bool {
        return calendar.isDateInYesterday(self as Date)
    }
    
    /// SwifterSwift: Check if date is within tomorrow.
    public var isInTomorrow: Bool {
        return calendar.isDateInTomorrow(self as Date)
    }
    
    /// SwifterSwift: Check if date is within a weekend period.
    public var isInWeekend: Bool {
        return calendar.isDateInWeekend(self as Date)
    }
    
    /// SwifterSwift: ISO8601 string of format (yyyy-MM-dd'T'HH:mm:ss.SSS) from date.
    public var iso8601String: String {
        // https://github.com/justinmakaila/NSDate-ISO-8601/blob/master/NSDateISO8601.swift
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        
        return dateFormatter.string(from: self as Date).appending("Z")
    }
    
    /// SwifterSwift: Nearest five minutes to date.
    public var nearestFiveMinutes: Date {
        var components = Calendar.current.dateComponents([.year, .month , .day , .hour , .minute], from: self as Date)
        let min = components.minute!
        components.minute! = min % 5 < 3 ? min - min % 5 : min + 5 - (min % 5)
        components.second = 0
        return Calendar.current.date(from: components)!
    }
    
    /// SwifterSwift: Nearest ten minutes to date.
    public var nearestTenMinutes: Date {
        var components = Calendar.current.dateComponents([.year, .month , .day , .hour , .minute], from: self as Date)
        let min = components.minute!
        components.minute? = min % 10 < 6 ? min - min % 10 : min + 10 - (min % 10)
        components.second = 0
        return Calendar.current.date(from: components)!
    }
    
    /// SwifterSwift: Nearest quarter hour to date.
    public var nearestQuarterHour: Date {
        var components = Calendar.current.dateComponents([.year, .month , .day , .hour , .minute], from: self as Date)
        let min = components.minute!
        components.minute! = min % 15 < 8 ? min - min % 15 : min + 15 - (min % 15)
        components.second = 0
        return Calendar.current.date(from: components)!
    }
    
    /// SwifterSwift: Nearest half hour to date.
    public var nearestHalfHour: Date {
        var components = Calendar.current.dateComponents([.year, .month , .day , .hour , .minute], from: self as Date)
        let min = components.minute!
        components.minute! = min % 30 < 15 ? min - min % 30 : min + 30 - (min % 30)
        components.second = 0
        return Calendar.current.date(from: components)!
    }
    
    /// SwifterSwift: Time zone used by system.
    public var timeZone: TimeZone {
        return calendar.timeZone
    }
    
    /// SwifterSwift: UNIX timestamp from date.
    public var unixTimestamp: Double {
        return timeIntervalSince1970
    }
    
    /// SwifterSwift: Day name from date.
    ///
    /// - Parameter Style: style of day name (default is DayNameStyle.full).
    /// - Returns: day name string (example: W, Wed, Wednesday).
    public func dayName(ofStyle style: DayNameStyle = .full) -> String {
        // http://www.codingexplorer.com/swiftly-getting-human-readable-date-nsdateformatter/
        let dateFormatter = DateFormatter()
        var format: String {
            switch style {
            case .oneLetter:
                return "EEEEE"
            case .threeLetters:
                return "EEE"
            case .full:
                return "EEEE"
            }
        }
        dateFormatter.setLocalizedDateFormatFromTemplate(format)
        return dateFormatter.string(from: self as Date)
    }
    
    /// SwifterSwift: Month name from date.
    ///
    /// - Parameter Style: style of month name (default is MonthNameStyle.full).
    /// - Returns: month name string (example: D, Dec, December).
    public func monthName(ofStyle style: MonthNameStyle = .full) -> String {
        // http://www.codingexplorer.com/swiftly-getting-human-readable-date-nsdateformatter/
        let dateFormatter = DateFormatter()
        var format: String {
            switch style {
            case .oneLetter:
                return "MMMMM"
            case .threeLetters:
                return "MMM"
            case .full:
                return "MMMM"
            }
        }
        dateFormatter.setLocalizedDateFormatFromTemplate(format)
        return dateFormatter.string(from: self as Date)
    }
}

// MARK: - Initializers
public extension NSDate {
    
    /// SwifterSwift: Create a new date form calendar components.
    ///
    /// - Parameters:
    ///   - calendar: Calendar (default is current).
    ///   - timeZone: TimeZone (default is current).
    ///   - era: Era (default is current era).
    ///   - year: Year (default is current year).
    ///   - month: Month (default is current month).
    ///   - day: Day (default is today).
    ///   - hour: Hour (default is current hour).
    ///   - minute: Minute (default is current minute).
    ///   - second: Second (default is current second).
    ///   - nanosecond: Nanosecond (default is current nanosecond).
    public func dateWith(
        calendar: Calendar? = Calendar.current,
        timeZone: TimeZone? = TimeZone.current,
        era: Int? = Date().era,
        year: Int? = Date().year,
        month: Int? = Date().month,
        day: Int? = Date().day,
        hour: Int? = Date().hour,
        minute: Int? = Date().minute,
        second: Int? = Date().second,
        nanosecond: Int? = Date().nanosecond) -> NSDate?
    {
        var components = DateComponents()
        components.calendar = calendar
        components.timeZone = timeZone
        components.era = era
        components.year = year
        components.month = month
        components.day = day
        components.hour = hour
        components.minute = minute
        components.second = second
        components.nanosecond = nanosecond
        
        if let date = calendar?.date(from: components) {
            return date as NSDate
        } else {
            return nil
        }
    }
    
    /// SwifterSwift: Create new date object from UNIX timestamp.
    ///
    /// - Parameter unixTimestamp: UNIX timestamp.
    public convenience init(unixTimestamp: Double) {
        self.init(timeIntervalSince1970: unixTimestamp)
    }
    
}
