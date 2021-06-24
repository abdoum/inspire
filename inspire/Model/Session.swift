//
//  ExperienceSession.swift
//  inspire
//
//  Created by ab on 14/06/2021.
//

import Foundation

struct Session {
    var date : Date
//    var guest : User // FIX: caused circular reference errors with Users
    var mode : ParticipationMode
    let experience : Experience
    var isFull : Bool = false
}

var MOCK_SESSIONS = [
    Session(date: ISO8601DateFormatter().date(from: "2021-04-09T21:21:16Z") ?? Date(), mode: ParticipationMode.solo, experience: MOCK_EXPERIENCES[0], isFull: true),
    Session(date: ISO8601DateFormatter().date(from: "2021-01-27T13:07:47Z") ?? Date(), mode: ParticipationMode.all, experience: MOCK_EXPERIENCES[3], isFull: true),
    Session(date: ISO8601DateFormatter().date(from: "2021-03-03T09:52:14Z") ?? Date(), mode: ParticipationMode.solo, experience: MOCK_EXPERIENCES[2], isFull: true),
    Session(date: ISO8601DateFormatter().date(from: "2021-04-25T14:34:46Z") ?? Date(), mode: ParticipationMode.solo, experience: MOCK_EXPERIENCES[2], isFull: true),
    Session(date: ISO8601DateFormatter().date(from: "2021-02-18T17:44:36Z") ?? Date(), mode: ParticipationMode.all, experience: MOCK_EXPERIENCES[1], isFull: true),
    Session(date: ISO8601DateFormatter().date(from: "2021-03-11T16:50:41Z") ?? Date(), mode: ParticipationMode.solo, experience: MOCK_EXPERIENCES[1], isFull: true),
    Session(date: ISO8601DateFormatter().date(from: "2020-12-28T18:43:49Z") ?? Date(), mode: ParticipationMode.all, experience: MOCK_EXPERIENCES[2], isFull: true),
    Session(date: ISO8601DateFormatter().date(from: "2021-08-04T13:13:21Z") ?? Date(), mode: ParticipationMode.solo, experience: MOCK_EXPERIENCES[4], isFull: true),
    Session(date: ISO8601DateFormatter().date(from: "2021-01-07T17:06:55Z") ?? Date(), mode: ParticipationMode.all, experience: MOCK_EXPERIENCES[2], isFull: false),
    Session(date: ISO8601DateFormatter().date(from: "2021-05-29T14:36:22Z") ?? Date(), mode: ParticipationMode.solo, experience: MOCK_EXPERIENCES[0], isFull: true)
]
