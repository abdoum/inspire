//
//  Review.swift
//  inspire
//
//  Created by ab on 14/06/2021.
//

import Foundation

struct Review {
    let id = UUID()
    let comment : String?
    let rate : Int
    let author : User
}

var MOCK_REVIEWS = [
    Review(comment: "Expérience incroyable, vécue en immersion totale avec une personne charismatique m'engageant à rejoindre cette corporation sans délai. Merci encore et à très vite !", rate: 5, author: UserManager.mockAuthors[0]),
    Review(comment: "Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus.", rate: 5, author: UserManager.mockAuthors[2]),
    Review(comment: "Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum.", rate: 4, author: UserManager.mockAuthors[2]),
    Review(comment: "Proin risus. Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend.", rate: 5, author: UserManager.mockAuthors[3]),
    Review(comment: "Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius.", rate: 4, author: UserManager.mockAuthors[4]),
    Review(comment: "Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo.", rate: 4, author: UserManager.mockAuthors[5]),
    Review(comment: "Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.", rate: 4, author: UserManager.mockAuthors[0]),
    Review(comment: "Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat.", rate: 5, author: UserManager.mockAuthors[1]),
    Review(comment: "Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl.", rate: 4, author: UserManager.mockAuthors[2]),
    Review(comment: "Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.", rate: 5, author: UserManager.mockAuthors[3]),
    Review(comment: "In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy.", rate: 1, author: UserManager.mockAuthors[4]),
    Review(comment: "Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo.", rate: 5, author: UserManager.mockAuthors[0]),
    Review(comment: "Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla.", rate: 5, author: UserManager.mockAuthors[1]),
    Review(comment: "Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.", rate: 5, author: UserManager.mockAuthors[2])
]

