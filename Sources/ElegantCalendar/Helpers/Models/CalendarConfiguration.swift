// Kevin Li - 10:51 PM - 6/6/20

import SwiftUI

/// Any changes to the configuration will reset the calendar based on its new settings
public struct CalendarConfiguration: Equatable {

    public let calendar: Calendar
    public let ascending: Bool
    public let startDate: Date
    public let endDate: Date
    public let accessoryViewEnabled: Bool

    public init(calendar: Calendar = .current, ascending: Bool = true, startDate: Date, endDate: Date, accessoryViewEnabled: Bool = true) {
        self.calendar = calendar
        self.ascending = ascending
        self.startDate = startDate
        self.endDate = endDate
        self.accessoryViewEnabled = accessoryViewEnabled
    }

    var referenceDate: Date {
        ascending ? startDate : endDate
    }

}

extension CalendarConfiguration {

    static let mock = CalendarConfiguration(
        calendar: germanCalendar,
        startDate: .daysFromToday(-365*2),
        endDate: .daysFromToday(365*2),
        accessoryViewEnabled: true
    )
    
    static var germanCalendar: Calendar {
        var calendar = Calendar.current
        calendar.locale = .init(identifier: "en_US")
        return calendar
    }

}

protocol ConfigurationDirectAccess {

    var configuration: CalendarConfiguration { get }

}

extension ConfigurationDirectAccess {

    var calendar: Calendar {
        configuration.calendar
    }

    var startDate: Date {
        configuration.startDate
    }

    var endDate: Date {
        configuration.endDate
    }

    var referenceDate: Date {
        configuration.referenceDate
    }
    
    var accessoryViewEnabled: Bool {
        configuration.accessoryViewEnabled
    }

}
