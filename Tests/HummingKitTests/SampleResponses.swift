//
//  SampleResponses.swift
//  
//
//  Created by Tony Tang on 5/27/20.
//

import Foundation
import SwiftyJSON

let catalogSongJSON =
    JSON.init(parseJSON:
        """
            {
                "attributes": {
                    "albumName": "Something For the Pain",
                    "artistName": "Michael de Jong",
                    "artwork": {
                        "bgColor": "346687",
                        "height": 2400,
                        "textColor1": "c9fcf0",
                        "textColor2": "b4fbf3",
                        "textColor3": "abdedb",
                        "textColor4": "9bdddd",
                        "url": "https://example.mzstatic.com/image/thumb/Music3/v4/8d/5f/4e/8d5f4e8f-d677-ba24-15f0-f8035047a4cc/source/{w}x{h}bb.jpeg",
                        "width": 2400
                    },
                    "composerName": "Michael de Jong",
                    "discNumber": 1,
                    "durationInMillis": 327693,
                    "genreNames": [
                        "Singer/Songwriter",
                        "Music",
                        "Blues"
                    ],
                    "isrc": "NLH851300057",
                    "name": "Something For the Pain",
                    "playParams": {
                        "id": "900032829",
                        "kind": "song"
                    },
                    "previews": [
                        {
                            "url": "https://example.itunes.apple.com/apple-assets-us-std-000001/Music3/v4/0e/87/8d/0e878d76-734f-39b3-8904-00c1fa873088/mzaf_8986718721308175601.plus.aac.p.m4a"
                        }
                    ],
                    "releaseDate": "2014-07-11",
                    "trackNumber": 7,
                    "url": "https://itunes.apple.com/us/album/something-for-the-pain/900032785?i=900032829"
                },
                "href": "/v1/catalog/us/songs/900032829",
                "id": "900032829",
                "relationships": {
                    "albums": {
                        "data": [
                            {
                                "href": "/v1/catalog/us/albums/900032785",
                                "id": "900032785",
                                "type": "albums"
                            }
                        ],
                        "href": "/v1/catalog/us/songs/900032829/albums"
                    },
                    "artists": {
                        "data": [
                            {
                                "href": "/v1/catalog/us/artists/6671250",
                                "id": "6671250",
                                "type": "artists"
                            }
                        ],
                        "href": "/v1/catalog/us/songs/900032829/artists"
                    }
                },
                "type": "songs"
            }
        """)

let multipleCatalogSongsJSON =
    JSON.init(parseJSON:
        """
            {
                "data": [
                    {
                        "attributes": {
                            "albumName": "Born in the U.S.A.",
                            "artistName": "Bruce Springsteen",
                            "artwork": {
                                "bgColor": "321511",
                                "height": 1500,
                                "textColor1": "faf9f4",
                                "textColor2": "eee2ca",
                                "textColor3": "d2cbc6",
                                "textColor4": "c8b9a5",
                                "url": "https://example.mzstatic.com/image/thumb/Music5/v4/5d/fa/37/5dfa370a-76a1-fba9-1768-23d2d73ab437/source/{w}x{h}bb.jpeg",
                                "width": 1500
                            },
                            "composerName": "Bruce Springsteen",
                            "discNumber": 1,
                            "durationInMillis": 245298,
                            "genreNames": [
                                "Rock",
                                "Music",
                                "Hard Rock",
                                "Arena Rock",
                                "Rock & Roll",
                                "Pop",
                                "Pop/Rock",
                                "Singer/ Songwriter"
                            ],
                            "isrc": "USSM18400416",
                            "name": "Dancing in the Dark",
                            "playParams": {
                                "id": "203709340",
                                "kind": "song"
                            },
                            "previews": [
                                {
                                    "url": "https://example.itunes.apple.com/apple-assets-us-std-000001/AudioPreview71/v4/ab/b3/48/abb34824-1510-708e-57d7-870206be5ba2/mzaf_8515316732595919510.plus.aac.p.m4a"
                                }
                            ],
                            "releaseDate": "1984-05-04",
                            "trackNumber": 11,
                            "url": "https://itunes.apple.com/us/album/dancing-in-the-dark/203708420?i=203709340"
                        },
                        "href": "/v1/catalog/us/songs/203709340",
                        "id": "203709340",
                        "relationships": {
                            "albums": {
                                "data": [
                                    {
                                        "href": "/v1/catalog/us/albums/203708420",
                                        "id": "203708420",
                                        "type": "albums"
                                    }
                                ],
                                "href": "/v1/catalog/us/songs/203709340/albums"
                            },
                            "artists": {
                                "data": [
                                    {
                                        "href": "/v1/catalog/us/artists/178834",
                                        "id": "178834",
                                        "type": "artists"
                                    }
                                ],
                                "href": "/v1/catalog/us/songs/203709340/artists"
                            }
                        },
                        "type": "songs"
                    },
                    {
                        "attributes": {
                            "albumName": "Highway 61 Revisited",
                            "artistName": "Bob Dylan",
                            "artwork": {
                                "bgColor": "ffffff",
                                "height": 600,
                                "textColor1": "0b0605",
                                "textColor2": "150f0b",
                                "textColor3": "3c3837",
                                "textColor4": "443f3c",
                                "url": "https://example.mzstatic.com/image/thumb/Music/v4/d8/3a/17/d83a170a-e69f-303a-1900-b9560eeb4257/source/{w}x{h}bb.jpeg",
                                "width": 600
                            },
                            "composerName": "Bob Dylan",
                            "discNumber": 1,
                            "durationInMillis": 371714,
                            "genreNames": [
                                "Rock",
                                "Music",
                                "Psychedelic",
                                "Singer/Songwriter",
                                "Arena Rock",
                                "Rock & Roll",
                                "Pop",
                                "Pop/Rock",
                                "Singer/ Songwriter",
                                "Folk-Rock",
                                "Blues-Rock",
                                "Soft Rock",
                                "Southern Rock"
                            ],
                            "isrc": "USSM19922509",
                            "name": "Like a Rolling Stone",
                            "playParams": {
                                "id": "201281527",
                                "kind": "song"
                            },
                            "previews": [
                                {
                                    "url": "https://example.itunes.apple.com/apple-assets-us-std-000001/Music/b7/80/77/mzi.paymzilb.aac.p.m4a"
                                }
                            ],
                            "releaseDate": "1965-07-20",
                            "trackNumber": 1,
                            "url": "https://itunes.apple.com/us/album/like-a-rolling-stone/201281514?i=201281527"
                        },
                        "href": "/v1/catalog/us/songs/201281527",
                        "id": "201281527",
                        "relationships": {
                            "albums": {
                                "data": [
                                    {
                                        "href": "/v1/catalog/us/albums/201281514",
                                        "id": "201281514",
                                        "type": "albums"
                                    }
                                ],
                                "href": "/v1/catalog/us/songs/201281527/albums"
                            },
                            "artists": {
                                "data": [
                                    {
                                        "href": "/v1/catalog/us/artists/462006",
                                        "id": "462006",
                                        "type": "artists"
                                    }
                                ],
                                "href": "/v1/catalog/us/songs/201281527/artists"
                            }
                        },
                        "type": "songs"
                    }
                ]
            }
    """)

let librarySongJSON =
    JSON.init(parseJSON:
        """
            {
                "attributes": {
                    "albumName": "Mozart: 7 Minuets, K. 61b",
                    "artistName": "Wiener Mozart Ensemble & Willi Boskovsky",
                    "artwork": {
                        "height": 1200,
                        "url": "https://example.mzstatic.com/image/thumb/Features/6c/83/03/dj.npsbmsfx.jpeg/{w}x{h}bb.jpeg",
                        "width": 1200
                    },
                    "name": "7 Minuets, K. 61b: No. 1 in G",
                    "playParams": {
                        "id": "i.vMXdDW1TKQWRAd",
                        "isLibrary": true,
                        "kind": "song"
                    },
                    "trackNumber": 1
                },
                "href": "/v1/me/library/songs/i.vMXdDW1TKQWRAd",
                "id": "i.vMXdDW1TKQWRAd",
                "type": "library-songs"
            }
        """)

let multipleLibrarySongsJSON =
    JSON.init(parseJSON:
        """
            {
                "data": [
                    {
                        "attributes": {
                            "albumName": "War (Deluxe Edition) [Remastered]",
                            "artistName": "U2",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Music/4b/ca/43/mzi.bxlrvukd.jpeg/{w}x{h}bb.jpeg",
                                "width": 1200
                            },
                            "name": "\"40\"",
                            "playParams": {
                                "id": "i.dlvVYxxTPLaemG",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 10
                        },
                        "href": "/v1/me/library/songs/i.dlvVYxxTPLaemG",
                        "id": "i.dlvVYxxTPLaemG",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "Mozart: 7 Minuets, K. 61b",
                            "artistName": "Wiener Mozart Ensemble & Willi Boskovsky",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/6c/83/03/dj.npsbmsfx.jpeg/{w}x{h}bb.jpeg",
                                "width": 1200
                            },
                            "name": "7 Minuets, K. 61b: No. 1 in G",
                            "playParams": {
                                "id": "i.vMXdDW1TKQWRAd",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 1
                        },
                        "href": "/v1/me/library/songs/i.vMXdDW1TKQWRAd",
                        "id": "i.vMXdDW1TKQWRAd",
                        "type": "library-songs"
                    }
                ]
            }
        """)

let allLibrarySongsJSON =
    JSON.init(parseJSON:
        """
            {
                "data": [
                    {
                        "attributes": {
                            "albumName": "War (Deluxe Edition) [Remastered]",
                            "artistName": "U2",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/2e/72/92/dj.wuyxwvik.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "\"40\"",
                            "playParams": {
                                "id": "i.vMXdDeVhKQWRAd",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 10
                        },
                        "href": "/v1/me/library/songs/i.vMXdDeVhKQWRAd",
                        "id": "i.vMXdDeVhKQWRAd",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "War",
                            "artistName": "U2",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Music/4b/ca/43/mzi.bxlrvukd.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "\"40\"",
                            "playParams": {
                                "id": "i.dlvVYxxTPLaemG",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 10
                        },
                        "href": "/v1/me/library/songs/i.dlvVYxxTPLaemG",
                        "id": "i.dlvVYxxTPLaemG",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "Live from Paris",
                            "artistName": "U2",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/v4/93/03/8f/93038f7b-b71d-8780-63aa-8a696da032fb/V4HttpAssetRepositoryClient-ticket.akkwpdpo.jpg-7240546278253130703.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "\"40\" (Live from Paris)",
                            "playParams": {
                                "id": "i.NJv80OzfEaLK51",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 18
                        },
                        "href": "/v1/me/library/songs/i.NJv80OzfEaLK51",
                        "id": "i.NJv80OzfEaLK51",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "Under a Blood Red Sky (Live)",
                            "artistName": "U2",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Music/f3/91/41/mzi.ntuztlir.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "\"40\" (Live)",
                            "playParams": {
                                "id": "i.06QdKe1FYre61O",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 8
                        },
                        "href": "/v1/me/library/songs/i.06QdKe1FYre61O",
                        "id": "i.06QdKe1FYre61O",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "Boy (Deluxe Edition) [Remastered]",
                            "artistName": "U2",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/51/83/bd/dj.buhjnftd.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "11 O'Clock Tick Tock",
                            "playParams": {
                                "id": "i.9oJZ4MmtVdpgxJ",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 2
                        },
                        "href": "/v1/me/library/songs/i.9oJZ4MmtVdpgxJ",
                        "id": "i.9oJZ4MmtVdpgxJ",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "Boy (Deluxe Edition) [Remastered]",
                            "artistName": "U2",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/51/83/bd/dj.buhjnftd.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "11 O'Clock Tick Tock (Live at the Marquee, London)",
                            "playParams": {
                                "id": "i.vMXdddZIKQWRAd",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 13
                        },
                        "href": "/v1/me/library/songs/i.vMXdddZIKQWRAd",
                        "id": "i.vMXdddZIKQWRAd",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "October (Deluxe Edition) [Remastered]",
                            "artistName": "U2",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/8a/c7/9d/dj.ocvwznqa.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "11 O'Clock Tick Tock (Live at The Paradise Theater, Boston)",
                            "playParams": {
                                "id": "i.vMXdG6LFKQWRAd",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 15
                        },
                        "href": "/v1/me/library/songs/i.vMXdG6LFKQWRAd",
                        "id": "i.vMXdG6LFKQWRAd",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "Under a Blood Red Sky (Live)",
                            "artistName": "U2",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Music/f3/91/41/mzi.ntuztlir.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "11 O'Clock Tick Tock (Live)",
                            "playParams": {
                                "id": "i.aJGoYxvSJpbdVX",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 2
                        },
                        "href": "/v1/me/library/songs/i.aJGoYxvSJpbdVX",
                        "id": "i.aJGoYxvSJpbdVX",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Unforgettable Fire (Remastered) [Deluxe Version]",
                            "artistName": "U2",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Music/ae/ce/91/mzi.rxokuabs.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "11 O'Clock Tick Tock (Long Version)",
                            "playParams": {
                                "id": "i.dlvV6ABHPLaemG",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 11
                        },
                        "href": "/v1/me/library/songs/i.dlvV6ABHPLaemG",
                        "id": "i.dlvV6ABHPLaemG",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "Under a Blood Red Sky (Live)",
                            "artistName": "Wiener Mozart Ensemble & Willi Boskovsky",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/6c/83/03/dj.npsbmsfx.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "16 Minuets K. 176: No. 1 in C",
                            "playParams": {
                                "id": "i.vMXdD7EiKQWRAd",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 21
                        },
                        "href": "/v1/me/library/songs/i.vMXdD7EiKQWRAd",
                        "id": "i.vMXdD7EiKQWRAd",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Complete Mozart Edition: The Dances & Marches, Vol. 1",
                            "artistName": "Wiener Mozart Ensemble & Willi Boskovsky",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/6c/83/03/dj.npsbmsfx.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "16 Minuets K. 176: No. 10 in B-Flat",
                            "playParams": {
                                "id": "i.aJGo6GYtJpbdVX",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 29
                        },
                        "href": "/v1/me/library/songs/i.aJGo6GYtJpbdVX",
                        "id": "i.aJGo6GYtJpbdVX",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Complete Mozart Edition: The Dances & Marches, Vol. 1",
                            "artistName": "Wiener Mozart Ensemble & Willi Boskovsky",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/6c/83/03/dj.npsbmsfx.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "16 Minuets K. 176: No. 11 in F",
                            "playParams": {
                                "id": "i.06QdMQztYre61O",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 30
                        },
                        "href": "/v1/me/library/songs/i.06QdMQztYre61O",
                        "id": "i.06QdMQztYre61O",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Complete Mozart Edition: The Dances & Marches, Vol. 1",
                            "artistName": "Wiener Mozart Ensemble & Willi Boskovsky",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/6c/83/03/dj.npsbmsfx.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "16 Minuets K. 176: No. 12 in D",
                            "playParams": {
                                "id": "i.xrX54X9Sv0VrNA",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 31
                        },
                        "href": "/v1/me/library/songs/i.xrX54X9Sv0VrNA",
                        "id": "i.xrX54X9Sv0VrNA",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Complete Mozart Edition: The Dances & Marches, Vol. 1",
                            "artistName": "Wiener Mozart Ensemble & Willi Boskovsky",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/6c/83/03/dj.npsbmsfx.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "16 Minuets K. 176: No. 13 in G",
                            "playParams": {
                                "id": "i.vMXdY36HKQWRAd",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 32
                        },
                        "href": "/v1/me/library/songs/i.vMXdY36HKQWRAd",
                        "id": "i.vMXdY36HKQWRAd",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Complete Mozart Edition: The Dances & Marches, Vol. 1",
                            "artistName": "Wiener Mozart Ensemble & Willi Boskovsky",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/6c/83/03/dj.npsbmsfx.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "16 Minuets K. 176: No. 14 in C",
                            "playParams": {
                                "id": "i.rXzB3OQtEVP8g3",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 33
                        },
                        "href": "/v1/me/library/songs/i.rXzB3OQtEVP8g3",
                        "id": "i.rXzB3OQtEVP8g3",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Complete Mozart Edition: The Dances & Marches, Vol. 1",
                            "artistName": "Wiener Mozart Ensemble & Willi Boskovsky",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/6c/83/03/dj.npsbmsfx.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "16 Minuets K. 176: No. 15 in F",
                            "playParams": {
                                "id": "i.7PJ05lptXlD68R",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 34
                        },
                        "href": "/v1/me/library/songs/i.7PJ05lptXlD68R",
                        "id": "i.7PJ05lptXlD68R",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Complete Mozart Edition: The Dances & Marches, Vol. 1",
                            "artistName": "Wiener Mozart Ensemble & Willi Boskovsky",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/6c/83/03/dj.npsbmsfx.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "16 Minuets K. 176: No. 16 in D",
                            "playParams": {
                                "id": "i.EYVARkXIB7WZbe",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 35
                        },
                        "href": "/v1/me/library/songs/i.EYVARkXIB7WZbe",
                        "id": "i.EYVARkXIB7WZbe",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Complete Mozart Edition: The Dances & Marches, Vol. 1",
                            "artistName": "Wiener Mozart Ensemble & Willi Boskovsky",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/6c/83/03/dj.npsbmsfx.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "16 Minuets K. 176: No. 2 In G",
                            "playParams": {
                                "id": "i.rXzBGv6TEVP8g3",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 22
                        },
                        "href": "/v1/me/library/songs/i.rXzBGv6TEVP8g3",
                        "id": "i.rXzBGv6TEVP8g3",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Complete Mozart Edition: The Dances & Marches, Vol. 1",
                            "artistName": "Wiener Mozart Ensemble & Willi Boskovsky",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/6c/83/03/dj.npsbmsfx.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "16 Minuets K. 176: No. 3 in E-Flat & No. 4 in B-Flat",
                            "playParams": {
                                "id": "i.7PJ0OYESXlD68R",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 23
                        },
                        "href": "/v1/me/library/songs/i.7PJ0OYESXlD68R",
                        "id": "i.7PJ0OYESXlD68R",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Complete Mozart Edition: The Dances & Marches, Vol. 1",
                            "artistName": "Wiener Mozart Ensemble & Willi Boskovsky",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/6c/83/03/dj.npsbmsfx.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "16 Minuets K. 176: No. 5 in F",
                            "playParams": {
                                "id": "i.EYVANxbHB7WZbe",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 24
                        },
                        "href": "/v1/me/library/songs/i.EYVANxbHB7WZbe",
                        "id": "i.EYVANxbHB7WZbe",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Complete Mozart Edition: The Dances & Marches, Vol. 1",
                            "artistName": "Wiener Mozart Ensemble & Willi Boskovsky",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/6c/83/03/dj.npsbmsfx.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "16 Minuets K. 176: No. 6 in D",
                            "playParams": {
                                "id": "i.B0Vzm6mf9dYXOV",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 25
                        },
                        "href": "/v1/me/library/songs/i.B0Vzm6mf9dYXOV",
                        "id": "i.B0Vzm6mf9dYXOV",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Complete Mozart Edition: The Dances & Marches, Vol. 1",
                            "artistName": "Wiener Mozart Ensemble & Willi Boskovsky",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/6c/83/03/dj.npsbmsfx.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "16 Minuets K. 176: No. 7 in A",
                            "playParams": {
                                "id": "i.dlvVJ87tPLaemG",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 26
                        },
                        "href": "/v1/me/library/songs/i.dlvVJ87tPLaemG",
                        "id": "i.dlvVJ87tPLaemG",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Complete Mozart Edition: The Dances & Marches, Vol. 1",
                            "artistName": "Wiener Mozart Ensemble & Willi Boskovsky",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/6c/83/03/dj.npsbmsfx.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "16 Minuets K. 176: No. 8 in C",
                            "playParams": {
                                "id": "i.NJv8OV4tEaLK51",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 27
                        },
                        "href": "/v1/me/library/songs/i.NJv8OV4tEaLK51",
                        "id": "i.NJv8OV4tEaLK51",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Complete Mozart Edition: The Dances & Marches, Vol. 1",
                            "artistName": "Wiener Mozart Ensemble & Willi Boskovsky",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/6c/83/03/dj.npsbmsfx.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "16 Minuets K. 176: No. 9 in G",
                            "playParams": {
                                "id": "i.9oJZep6HVdpgxJ",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 28
                        },
                        "href": "/v1/me/library/songs/i.9oJZep6HVdpgxJ",
                        "id": "i.9oJZep6HVdpgxJ",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Complete Mozart Edition: The Dances & Marches, Vol. 1",
                            "artistName": "Wiener Mozart Ensemble & Willi Boskovsky",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/6c/83/03/dj.npsbmsfx.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "19 Minuets K. 103: No. 1 in C",
                            "playParams": {
                                "id": "i.vMXdDZqiKQWRAd",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 24
                        },
                        "href": "/v1/me/library/songs/i.vMXdDZqiKQWRAd",
                        "id": "i.vMXdDZqiKQWRAd",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Complete Mozart Edition: The Dances & Marches, Vol. 1",
                            "artistName": "Wiener Mozart Ensemble & Willi Boskovsky",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/6c/83/03/dj.npsbmsfx.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "19 Minuets K. 103: No. 10 in G",
                            "playParams": {
                                "id": "i.NJv8k6XfEaLK51",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 33
                        },
                        "href": "/v1/me/library/songs/i.NJv8k6XfEaLK51",
                        "id": "i.NJv8k6XfEaLK51",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Complete Mozart Edition: The Dances & Marches, Vol. 1",
                            "artistName": "Wiener Mozart Ensemble & Willi Boskovsky",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/6c/83/03/dj.npsbmsfx.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "19 Minuets K. 103: No. 11 in F",
                            "playParams": {
                                "id": "i.9oJZEMNsVdpgxJ",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 34
                        },
                        "href": "/v1/me/library/songs/i.9oJZEMNsVdpgxJ",
                        "id": "i.9oJZEMNsVdpgxJ",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Complete Mozart Edition: The Dances & Marches, Vol. 1",
                            "artistName": "Wiener Mozart Ensemble & Willi Boskovsky",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/6c/83/03/dj.npsbmsfx.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "19 Minuets K. 103: No. 12 in C",
                            "playParams": {
                                "id": "i.aJGoqQqSJpbdVX",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 35
                        },
                        "href": "/v1/me/library/songs/i.aJGoqQqSJpbdVX",
                        "id": "i.aJGoqQqSJpbdVX",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Complete Mozart Edition: The Dances & Marches, Vol. 1",
                            "artistName": "Wiener Mozart Ensemble & Willi Boskovsky",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/6c/83/03/dj.npsbmsfx.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "19 Minuets K. 103: No. 13 in C",
                            "playParams": {
                                "id": "i.06QdzL1tYre61O",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 36
                        },
                        "href": "/v1/me/library/songs/i.06QdzL1tYre61O",
                        "id": "i.06QdzL1tYre61O",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Complete Mozart Edition: The Dances & Marches, Vol. 1",
                            "artistName": "Wiener Mozart Ensemble & Willi Boskovsky",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/6c/83/03/dj.npsbmsfx.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "19 Minuets K. 103: No. 14 in E-Flat",
                            "playParams": {
                                "id": "i.xrX5opYTv0VrNA",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 37
                        },
                        "href": "/v1/me/library/songs/i.xrX5opYTv0VrNA",
                        "id": "i.xrX5opYTv0VrNA",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Complete Mozart Edition: The Dances & Marches, Vol. 1",
                            "artistName": "Wiener Mozart Ensemble & Willi Boskovsky",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/6c/83/03/dj.npsbmsfx.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "19 Minuets K. 103: No. 15 in B-Flat",
                            "playParams": {
                                "id": "i.vMXdDbVIKQWRAd",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 38
                        },
                        "href": "/v1/me/library/songs/i.vMXdDbVIKQWRAd",
                        "id": "i.vMXdDbVIKQWRAd",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Complete Mozart Edition: The Dances & Marches, Vol. 1",
                            "artistName": "Wiener Mozart Ensemble & Willi Boskovsky",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/6c/83/03/dj.npsbmsfx.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "19 Minuets K. 103: No. 16 in G",
                            "playParams": {
                                "id": "i.rXzBGbdfEVP8g3",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 39
                        },
                        "href": "/v1/me/library/songs/i.rXzBGbdfEVP8g3",
                        "id": "i.rXzBGbdfEVP8g3",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Complete Mozart Edition: The Dances & Marches, Vol. 1",
                            "artistName": "Wiener Mozart Ensemble & Willi Boskovsky",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/6c/83/03/dj.npsbmsfx.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "19 Minuets K. 103: No. 17 in E",
                            "playParams": {
                                "id": "i.7PJ0O1otXlD68R",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 40
                        },
                        "href": "/v1/me/library/songs/i.7PJ0O1otXlD68R",
                        "id": "i.7PJ0O1otXlD68R",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Complete Mozart Edition: The Dances & Marches, Vol. 1",
                            "artistName": "Wiener Mozart Ensemble & Willi Boskovsky",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/6c/83/03/dj.npsbmsfx.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "19 Minuets K. 103: No. 18 in A",
                            "playParams": {
                                "id": "i.EYVANEoSB7WZbe",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 41
                        },
                        "href": "/v1/me/library/songs/i.EYVANEoSB7WZbe",
                        "id": "i.EYVANEoSB7WZbe",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Complete Mozart Edition: The Dances & Marches, Vol. 1",
                            "artistName": "Wiener Mozart Ensemble & Willi Boskovsky",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/6c/83/03/dj.npsbmsfx.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "19 Minuets K. 103: No. 19 in C",
                            "playParams": {
                                "id": "i.B0VzmWKf9dYXOV",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 42
                        },
                        "href": "/v1/me/library/songs/i.B0VzmWKf9dYXOV",
                        "id": "i.B0VzmWKf9dYXOV",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Complete Mozart Edition: The Dances & Marches, Vol. 1",
                            "artistName": "Wiener Mozart Ensemble & Willi Boskovsky",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/6c/83/03/dj.npsbmsfx.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "19 Minuets K. 103: No. 2 in G",
                            "playParams": {
                                "id": "i.rXzBG64SEVP8g3",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 25
                        },
                        "href": "/v1/me/library/songs/i.rXzBG64SEVP8g3",
                        "id": "i.rXzBG64SEVP8g3",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Complete Mozart Edition: The Dances & Marches, Vol. 1",
                            "artistName": "Wiener Mozart Ensemble & Willi Boskovsky",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/6c/83/03/dj.npsbmsfx.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "19 Minuets K. 103: No. 3 in D",
                            "playParams": {
                                "id": "i.7PJ0OW2FXlD68R",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 26
                        },
                        "href": "/v1/me/library/songs/i.7PJ0OW2FXlD68R",
                        "id": "i.7PJ0OW2FXlD68R",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Complete Mozart Edition: The Dances & Marches, Vol. 1",
                            "artistName": "Wiener Mozart Ensemble & Willi Boskovsky",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/6c/83/03/dj.npsbmsfx.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "19 Minuets K. 103: No. 4 in F",
                            "playParams": {
                                "id": "i.EYVANppfB7WZbe",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 27
                        },
                        "href": "/v1/me/library/songs/i.EYVANppfB7WZbe",
                        "id": "i.EYVANppfB7WZbe",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Complete Mozart Edition: The Dances & Marches, Vol. 1",
                            "artistName": "Wiener Mozart Ensemble & Willi Boskovsky",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/6c/83/03/dj.npsbmsfx.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "19 Minuets K. 103: No. 5 in C",
                            "playParams": {
                                "id": "i.B0VzmbGt9dYXOV",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 28
                        },
                        "href": "/v1/me/library/songs/i.B0VzmbGt9dYXOV",
                        "id": "i.B0VzmbGt9dYXOV",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Complete Mozart Edition: The Dances & Marches, Vol. 1",
                            "artistName": "Wiener Mozart Ensemble & Willi Boskovsky",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/6c/83/03/dj.npsbmsfx.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "19 Minuets K. 103: No. 6 in G",
                            "playParams": {
                                "id": "i.dlvVJEBFPLaemG",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 29
                        },
                        "href": "/v1/me/library/songs/i.dlvVJEBFPLaemG",
                        "id": "i.dlvVJEBFPLaemG",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Complete Mozart Edition: The Dances & Marches, Vol. 1",
                            "artistName": "Wiener Mozart Ensemble & Willi Boskovsky",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/6c/83/03/dj.npsbmsfx.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "19 Minuets K. 103: No. 7 in D",
                            "playParams": {
                                "id": "i.NJv8k6gUEaLK51",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 30
                        },
                        "href": "/v1/me/library/songs/i.NJv8k6gUEaLK51",
                        "id": "i.NJv8k6gUEaLK51",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Complete Mozart Edition: The Dances & Marches, Vol. 1",
                            "artistName": "Wiener Mozart Ensemble & Willi Boskovsky",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/6c/83/03/dj.npsbmsfx.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "19 Minuets K. 103: No. 8 in F",
                            "playParams": {
                                "id": "i.B0VzmMKT9dYXOV",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 31
                        },
                        "href": "/v1/me/library/songs/i.B0VzmMKT9dYXOV",
                        "id": "i.B0VzmMKT9dYXOV",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Complete Mozart Edition: The Dances & Marches, Vol. 1",
                            "artistName": "Wiener Mozart Ensemble & Willi Boskovsky",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/6c/83/03/dj.npsbmsfx.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "19 Minuets K. 103: No. 9 in D",
                            "playParams": {
                                "id": "i.dlvVJEPSPLaemG",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 32
                        },
                        "href": "/v1/me/library/songs/i.dlvVJEPSPLaemG",
                        "id": "i.dlvVJEPSPLaemG",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "What I Got... - EP",
                            "artistName": "Sublime",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/80/27/7a/dj.jxxajtcz.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "contentRating": "explicit",
                            "name": "40 Oz. to Freedom (Dirty Version)",
                            "playParams": {
                                "id": "i.EYVAbVNSB7WZbe",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 2
                        },
                        "href": "/v1/me/library/songs/i.EYVAbVNSB7WZbe",
                        "id": "i.EYVAbVNSB7WZbe",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Unforgettable Fire (Remastered) [Deluxe Version]",
                            "artistName": "U2",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Music/ae/ce/91/mzi.rxokuabs.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "4th of July",
                            "playParams": {
                                "id": "i.xrX5OeLUv0VrNA",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 6
                        },
                        "href": "/v1/me/library/songs/i.xrX5OeLUv0VrNA",
                        "id": "i.xrX5OeLUv0VrNA",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Unforgettable Fire",
                            "artistName": "U2",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Music/ae/ce/91/mzi.brscgsob.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "4th of July",
                            "playParams": {
                                "id": "i.rXzBa4QFEVP8g3",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 6
                        },
                        "href": "/v1/me/library/songs/i.rXzBa4QFEVP8g3",
                        "id": "i.rXzBa4QFEVP8g3",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Unforgettable Fire (Remastered) [Deluxe Version]",
                            "artistName": "U2",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Music/ae/ce/91/mzi.rxokuabs.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "4th of July (Single Version)",
                            "playParams": {
                                "id": "i.xrX5O99Fv0VrNA",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 15
                        },
                        "href": "/v1/me/library/songs/i.xrX5O99Fv0VrNA",
                        "id": "i.xrX5O99Fv0VrNA",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "Gold: Sublime (Remastered)",
                            "artistName": "Sublime",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/80/27/7a/dj.jxxajtcz.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "54-46 That's My Number / Ball and Chain",
                            "playParams": {
                                "id": "i.NJv8R7QfEaLK51",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 6
                        },
                        "href": "/v1/me/library/songs/i.NJv8R7QfEaLK51",
                        "id": "i.NJv8R7QfEaLK51",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Complete Mozart Edition: The Dances & Marches, Vol. 1",
                            "artistName": "Wiener Mozart Ensemble & Willi Boskovsky",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/6c/83/03/dj.npsbmsfx.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "6 Minuets K. 61h: No. 1 in C",
                            "playParams": {
                                "id": "i.dlvVJYxSPLaemG",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 1
                        },
                        "href": "/v1/me/library/songs/i.dlvVJYxSPLaemG",
                        "id": "i.dlvVJYxSPLaemG",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Complete Mozart Edition: The Dances & Marches, Vol. 1",
                            "artistName": "Wiener Mozart Ensemble & Willi Boskovsky",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/6c/83/03/dj.npsbmsfx.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "6 Minuets K. 61h: No. 2 in A",
                            "playParams": {
                                "id": "i.NJv8kemSEaLK51",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 2
                        },
                        "href": "/v1/me/library/songs/i.NJv8kemSEaLK51",
                        "id": "i.NJv8kemSEaLK51",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Complete Mozart Edition: The Dances & Marches, Vol. 1",
                            "artistName": "Wiener Mozart Ensemble & Willi Boskovsky",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/6c/83/03/dj.npsbmsfx.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "6 Minuets K. 61h: No. 3 in D",
                            "playParams": {
                                "id": "i.9oJZEXmIVdpgxJ",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 3
                        },
                        "href": "/v1/me/library/songs/i.9oJZEXmIVdpgxJ",
                        "id": "i.9oJZEXmIVdpgxJ",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Complete Mozart Edition: The Dances & Marches, Vol. 1",
                            "artistName": "Wiener Mozart Ensemble & Willi Boskovsky",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/6c/83/03/dj.npsbmsfx.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "6 Minuets K. 61h: No. 4 in B-Flat",
                            "playParams": {
                                "id": "i.aJGoq7KHJpbdVX",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 4
                        },
                        "href": "/v1/me/library/songs/i.aJGoq7KHJpbdVX",
                        "id": "i.aJGoq7KHJpbdVX",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Complete Mozart Edition: The Dances & Marches, Vol. 1",
                            "artistName": "Wiener Mozart Ensemble & Willi Boskovsky",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/6c/83/03/dj.npsbmsfx.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "6 Minuets K. 61h: No. 5 in G",
                            "playParams": {
                                "id": "i.06Qdzx2tYre61O",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 5
                        },
                        "href": "/v1/me/library/songs/i.06Qdzx2tYre61O",
                        "id": "i.06Qdzx2tYre61O",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Complete Mozart Edition: The Dances & Marches, Vol. 1",
                            "artistName": "Wiener Mozart Ensemble & Willi Boskovsky",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/6c/83/03/dj.npsbmsfx.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "6 Minuets K. 61h: No. 6 in C",
                            "playParams": {
                                "id": "i.xrX5oZxUv0VrNA",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 6
                        },
                        "href": "/v1/me/library/songs/i.xrX5oZxUv0VrNA",
                        "id": "i.xrX5oZxUv0VrNA",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Complete Mozart Edition: The Dances & Marches, Vol. 1",
                            "artistName": "Wiener Mozart Ensemble & Willi Boskovsky",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/6c/83/03/dj.npsbmsfx.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "7 Minuets, K. 61b: No. 1 in G",
                            "playParams": {
                                "id": "i.vMXdDW1TKQWRAd",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 1
                        },
                        "href": "/v1/me/library/songs/i.vMXdDW1TKQWRAd",
                        "id": "i.vMXdDW1TKQWRAd",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Complete Mozart Edition: The Dances & Marches, Vol. 1",
                            "artistName": "Wiener Mozart Ensemble & Willi Boskovsky",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/6c/83/03/dj.npsbmsfx.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "7 Minuets, K. 61b: No. 2 in D",
                            "playParams": {
                                "id": "i.7PJ0NAatXlD68R",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 2
                        },
                        "href": "/v1/me/library/songs/i.7PJ0NAatXlD68R",
                        "id": "i.7PJ0NAatXlD68R",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Complete Mozart Edition: The Dances & Marches, Vol. 1",
                            "artistName": "Wiener Mozart Ensemble & Willi Boskovsky",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/6c/83/03/dj.npsbmsfx.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "7 Minuets, K. 61b: No. 3 in A",
                            "playParams": {
                                "id": "i.aJGoYL9UJpbdVX",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 3
                        },
                        "href": "/v1/me/library/songs/i.aJGoYL9UJpbdVX",
                        "id": "i.aJGoYL9UJpbdVX",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Complete Mozart Edition: The Dances & Marches, Vol. 1",
                            "artistName": "Wiener Mozart Ensemble & Willi Boskovsky",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/6c/83/03/dj.npsbmsfx.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "7 Minuets, K. 61b: No. 4 in F",
                            "playParams": {
                                "id": "i.xrX5vBotv0VrNA",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 4
                        },
                        "href": "/v1/me/library/songs/i.xrX5vBotv0VrNA",
                        "id": "i.xrX5vBotv0VrNA",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Complete Mozart Edition: The Dances & Marches, Vol. 1",
                            "artistName": "Wiener Mozart Ensemble & Willi Boskovsky",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/6c/83/03/dj.npsbmsfx.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "7 Minuets, K. 61b: No. 5 in C",
                            "playParams": {
                                "id": "i.06QdNRNUYre61O",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 5
                        },
                        "href": "/v1/me/library/songs/i.06QdNRNUYre61O",
                        "id": "i.06QdNRNUYre61O",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Complete Mozart Edition: The Dances & Marches, Vol. 1",
                            "artistName": "Wiener Mozart Ensemble & Willi Boskovsky",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/6c/83/03/dj.npsbmsfx.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "7 Minuets, K. 61b: No. 6 in G",
                            "playParams": {
                                "id": "i.vMXd1l4SKQWRAd",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 6
                        },
                        "href": "/v1/me/library/songs/i.vMXd1l4SKQWRAd",
                        "id": "i.vMXd1l4SKQWRAd",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Complete Mozart Edition: The Dances & Marches, Vol. 1",
                            "artistName": "Wiener Mozart Ensemble & Willi Boskovsky",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/6c/83/03/dj.npsbmsfx.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "7 Minuets, K. 61b: No. 7 In D",
                            "playParams": {
                                "id": "i.dlvVqLZTPLaemG",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 7
                        },
                        "href": "/v1/me/library/songs/i.dlvVqLZTPLaemG",
                        "id": "i.dlvVqLZTPLaemG",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "Jungle",
                            "artistName": "Jungle",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Music/v4/46/b7/43/46b743a5-309f-08e7-d28a-ba30650dbbe7/cover.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "Accelerate",
                            "playParams": {
                                "id": "i.9oJZrYYUVdpgxJ",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 2
                        },
                        "href": "/v1/me/library/songs/i.9oJZrYYUVdpgxJ",
                        "id": "i.9oJZrYYUVdpgxJ",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "Presence (Remastered)",
                            "artistName": "Led Zeppelin",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Music6/v4/bb/58/01/bb58010b-b00e-4776-aca4-8b863b1b8b27/603497926091.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "Achilles Last Stand",
                            "playParams": {
                                "id": "i.7PJ0OgNUXlD68R",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 1
                        },
                        "href": "/v1/me/library/songs/i.7PJ0OgNUXlD68R",
                        "id": "i.7PJ0OgNUXlD68R",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "Achtung Baby",
                            "artistName": "U2",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/17/2b/2d/dj.nkmuycan.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "Acrobat",
                            "playParams": {
                                "id": "i.aJGoQ8KfJpbdVX",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 11
                        },
                        "href": "/v1/me/library/songs/i.aJGoQ8KfJpbdVX",
                        "id": "i.aJGoQ8KfJpbdVX",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "Achtung Baby (Deluxe Edition)",
                            "artistName": "U2",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/9a/3c/f3/dj.bulwfjfn.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "Acrobat",
                            "playParams": {
                                "id": "i.06QdraXfYre61O",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 11
                        },
                        "href": "/v1/me/library/songs/i.06QdraXfYre61O",
                        "id": "i.06QdraXfYre61O",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "Atom Heart Mother",
                            "artistName": "Pink Floyd",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Music6/v4/45/de/90/45de9049-8dc2-689d-bdb4-0d1763228d99/5099968083656_1419x1419_300dpi.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "Alan's Psychedelic Breakfast",
                            "playParams": {
                                "id": "i.rXzBaBqUEVP8g3",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 5
                        },
                        "href": "/v1/me/library/songs/i.rXzBaBqUEVP8g3",
                        "id": "i.rXzBaBqUEVP8g3",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "Achtung Baby (Deluxe Edition)",
                            "artistName": "U2",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/9a/3c/f3/dj.bulwfjfn.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "Alex Descends Into Hell for a Bottle of Milk/Korova 1",
                            "playParams": {
                                "id": "i.9oJZZWETVdpgxJ",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 13
                        },
                        "href": "/v1/me/library/songs/i.9oJZZWETVdpgxJ",
                        "id": "i.9oJZZWETVdpgxJ",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "Rattle and Hum",
                            "artistName": "U2",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features2/v4/f2/b0/81/f2b08184-8fe6-a99f-2e48-ddb12fd48462/dj.rmqathgx.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "All Along the Watchtower (Live)",
                            "playParams": {
                                "id": "i.NJv8pLxfEaLK51",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 5
                        },
                        "href": "/v1/me/library/songs/i.NJv8pLxfEaLK51",
                        "id": "i.NJv8pLxfEaLK51",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "How To Dismantle an Atomic Bomb",
                            "artistName": "U2",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/af/9c/e1/dj.cothgbwe.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "All Because of You",
                            "playParams": {
                                "id": "i.NJv88J4SEaLK51",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 6
                        },
                        "href": "/v1/me/library/songs/i.NJv88J4SEaLK51",
                        "id": "i.NJv88J4SEaLK51",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Best of 1980-1990",
                            "artistName": "U2",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Music/b6/b4/df/mzi.rpwpimbq.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "All I Want Is You",
                            "playParams": {
                                "id": "i.dlvVVxzSPLaemG",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 14
                        },
                        "href": "/v1/me/library/songs/i.dlvVVxzSPLaemG",
                        "id": "i.dlvVVxzSPLaemG",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "Rattle and Hum",
                            "artistName": "U2",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features2/v4/f2/b0/81/f2b08184-8fe6-a99f-2e48-ddb12fd48462/dj.rmqathgx.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "All I Want Is You",
                            "playParams": {
                                "id": "i.06QdKbNFYre61O",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 17
                        },
                        "href": "/v1/me/library/songs/i.06QdKbNFYre61O",
                        "id": "i.06QdKbNFYre61O",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Best of 1980-1990 & B-Sides",
                            "artistName": "U2",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Music2/v4/8d/34/cd/8d34cd9d-5a21-bf8e-4712-bac136f9be65/dj.hypcxuwj.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "All I Want Is You",
                            "playParams": {
                                "id": "i.B0VzWVbf9dYXOV",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 14
                        },
                        "href": "/v1/me/library/songs/i.B0VzWVbf9dYXOV",
                        "id": "i.B0VzWVbf9dYXOV",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "U218 Singles (Deluxe Version)",
                            "artistName": "U2",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/64/ca/7a/dj.aibugkmk.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "All I Want Is You (2005 Live from Milan)",
                            "playParams": {
                                "id": "i.aJGo2YvFJpbdVX",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 5
                        },
                        "href": "/v1/me/library/songs/i.aJGo2YvFJpbdVX",
                        "id": "i.aJGo2YvFJpbdVX",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "In Through the Out Door (Remastered)",
                            "artistName": "Led Zeppelin",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Music/v4/cb/d1/35/cbd135f0-b694-acd3-3255-66d82cea8dd9/603497926084.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "All My Love",
                            "playParams": {
                                "id": "i.EYVAl4bFB7WZbe",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 6
                        },
                        "href": "/v1/me/library/songs/i.EYVAl4bFB7WZbe",
                        "id": "i.EYVAl4bFB7WZbe",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "Rattle and Hum",
                            "artistName": "U2",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features2/v4/f2/b0/81/f2b08184-8fe6-a99f-2e48-ddb12fd48462/dj.rmqathgx.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "Angel of Harlem",
                            "playParams": {
                                "id": "i.B0VzWKNT9dYXOV",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 10
                        },
                        "href": "/v1/me/library/songs/i.B0VzWKNT9dYXOV",
                        "id": "i.B0VzWKNT9dYXOV",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Best of 1980-1990 & B-Sides",
                            "artistName": "U2",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Music2/v4/8d/34/cd/8d34cd9d-5a21-bf8e-4712-bac136f9be65/dj.hypcxuwj.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "Angel of Harlem",
                            "playParams": {
                                "id": "i.B0Vze0Qt9dYXOV",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 13
                        },
                        "href": "/v1/me/library/songs/i.B0Vze0Qt9dYXOV",
                        "id": "i.B0Vze0Qt9dYXOV",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Best of 1980-1990",
                            "artistName": "U2",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Music/b6/b4/df/mzi.rpwpimbq.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "Angel of Harlem",
                            "playParams": {
                                "id": "i.B0VzzLxT9dYXOV",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 13
                        },
                        "href": "/v1/me/library/songs/i.B0VzzLxT9dYXOV",
                        "id": "i.B0VzzLxT9dYXOV",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "War (Deluxe Edition) [Remastered]",
                            "artistName": "U2",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/2e/72/92/dj.wuyxwvik.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "Angels Too Tied to the Ground",
                            "playParams": {
                                "id": "i.7PJ0O6oFXlD68R",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 2
                        },
                        "href": "/v1/me/library/songs/i.7PJ0O6oFXlD68R",
                        "id": "i.7PJ0O6oFXlD68R",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Wall",
                            "artistName": "Pink Floyd",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/v4/b6/3e/ac/b63eacbf-3e3a-f3c1-3f87-e20fedc8f56a/dj.esjczuop.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "Another Brick In the Wall, Pt. 1",
                            "playParams": {
                                "id": "i.9oJZvN5hVdpgxJ",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 3
                        },
                        "href": "/v1/me/library/songs/i.9oJZvN5hVdpgxJ",
                        "id": "i.9oJZvN5hVdpgxJ",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Wall",
                            "artistName": "Pink Floyd",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/v4/b6/3e/ac/b63eacbf-3e3a-f3c1-3f87-e20fedc8f56a/dj.esjczuop.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "Another Brick In the Wall, Pt. 2",
                            "playParams": {
                                "id": "i.06QdKqNfYre61O",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 5
                        },
                        "href": "/v1/me/library/songs/i.06QdKqNfYre61O",
                        "id": "i.06QdKqNfYre61O",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "Delicate Sound of Thunder (Live)",
                            "artistName": "Pink Floyd",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Music6/v4/25/6d/72/256d72ae-bc50-6e13-6c6e-23cbd0f95326/dj.kemsuvxp.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "Another Brick In the Wall, Pt. 2 (Live)",
                            "playParams": {
                                "id": "i.vMXd0BEfKQWRAd",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 6
                        },
                        "href": "/v1/me/library/songs/i.vMXd0BEfKQWRAd",
                        "id": "i.vMXd0BEfKQWRAd",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Wall",
                            "artistName": "Pink Floyd",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/v4/b6/3e/ac/b63eacbf-3e3a-f3c1-3f87-e20fedc8f56a/dj.esjczuop.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "Another Brick In the Wall, Pt. 3",
                            "playParams": {
                                "id": "i.EYVAJKLhB7WZbe",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 12
                        },
                        "href": "/v1/me/library/songs/i.EYVAJKLhB7WZbe",
                        "id": "i.EYVAJKLhB7WZbe",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "Boy (Deluxe Edition) [Remastered]",
                            "artistName": "U2",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/51/83/bd/dj.buhjnftd.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "Another Day",
                            "playParams": {
                                "id": "i.EYVAbmNuB7WZbe",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 10
                        },
                        "href": "/v1/me/library/songs/i.EYVAbmNuB7WZbe",
                        "id": "i.EYVAbmNuB7WZbe",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Platinum Collection (Greatest Hits I, II, & III)",
                            "artistName": "Queen",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/v4/de/17/7d/de177d6b-47e1-3e41-9f36-d66b3b1cc82c/V4HttpAssetRepositoryClient-ticket.ijjzkhnl.jpg-1473851621175341892.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "Another One Bites the Dust",
                            "playParams": {
                                "id": "i.vMXdGxVtKQWRAd",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 2
                        },
                        "href": "/v1/me/library/songs/i.vMXdGxVtKQWRAd",
                        "id": "i.vMXdGxVtKQWRAd",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Platinum Collection (Greatest Hits I, II, & III)",
                            "artistName": "Queen & Wyclef Jean",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/v4/de/17/7d/de177d6b-47e1-3e41-9f36-d66b3b1cc82c/V4HttpAssetRepositoryClient-ticket.ijjzkhnl.jpg-1473851621175341892.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "Another One Bites the Dust (Remix)",
                            "playParams": {
                                "id": "i.xrX55alTv0VrNA",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 14
                        },
                        "href": "/v1/me/library/songs/i.xrX55alTv0VrNA",
                        "id": "i.xrX55alTv0VrNA",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "Boy (Deluxe Edition) [Remastered]",
                            "artistName": "U2",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/51/83/bd/dj.buhjnftd.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "Another Time Another Place",
                            "playParams": {
                                "id": "i.vMXdQGlsKQWRAd",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 9
                        },
                        "href": "/v1/me/library/songs/i.vMXdQGlsKQWRAd",
                        "id": "i.vMXdQGlsKQWRAd",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "Boy",
                            "artistName": "U2",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Music/ba/06/ff/mzi.vqadflly.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "Another Time Another Place",
                            "playParams": {
                                "id": "i.B0VzNZGU9dYXOV",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 9
                        },
                        "href": "/v1/me/library/songs/i.B0VzNZGU9dYXOV",
                        "id": "i.B0VzNZGU9dYXOV",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Dark Side of the Moon",
                            "artistName": "Pink Floyd",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Features/v4/18/3e/85/183e8556-459c-dfa4-2bfc-38f30f5a3606/dj.nobsviqs.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "Any Colour You Like",
                            "playParams": {
                                "id": "i.7PJ019afXlD68R",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 8
                        },
                        "href": "/v1/me/library/songs/i.7PJ019afXlD68R",
                        "id": "i.7PJ019afXlD68R",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "Atom Heart Mother",
                            "artistName": "Pink Floyd",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Music6/v4/45/de/90/45de9049-8dc2-689d-bdb4-0d1763228d99/5099968083656_1419x1419_300dpi.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "Atom Heart Mother",
                            "playParams": {
                                "id": "i.vMXdd96SKQWRAd",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 1
                        },
                        "href": "/v1/me/library/songs/i.vMXdd96SKQWRAd",
                        "id": "i.vMXdd96SKQWRAd",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Unforgettable Fire",
                            "artistName": "U2",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Music/ae/ce/91/mzi.brscgsob.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "Bad",
                            "playParams": {
                                "id": "i.NJv8e3gSEaLK51",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 7
                        },
                        "href": "/v1/me/library/songs/i.NJv8e3gSEaLK51",
                        "id": "i.NJv8e3gSEaLK51",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Unforgettable Fire (Remastered) [Deluxe Version]",
                            "artistName": "U2",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Music/ae/ce/91/mzi.rxokuabs.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "Bad",
                            "playParams": {
                                "id": "i.vMXdQ5EfKQWRAd",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 7
                        },
                        "href": "/v1/me/library/songs/i.vMXdQ5EfKQWRAd",
                        "id": "i.vMXdQ5EfKQWRAd",
                        "type": "library-songs"
                    },
                    {
                        "attributes": {
                            "albumName": "The Best of 1980-1990 & B-Sides",
                            "artistName": "U2",
                            "artwork": {
                                "height": 1200,
                                "url": "https://example.mzstatic.com/image/thumb/Music2/v4/8d/34/cd/8d34cd9d-5a21-bf8e-4712-bac136f9be65/dj.hypcxuwj.jpg/{w}x{h}bb.jpg",
                                "width": 1200
                            },
                            "name": "Bad",
                            "playParams": {
                                "id": "i.xrX5OYYUv0VrNA",
                                "isLibrary": true,
                                "kind": "song"
                            },
                            "trackNumber": 6
                        },
                        "href": "/v1/me/library/songs/i.xrX5OYYUv0VrNA",
                        "id": "i.xrX5OYYUv0VrNA",
                        "type": "library-songs"
                    }
                ],
                "href": "/v1/me/library/songs",
                "next": "/v1/me/library/songs?offset=100"
            }
        """)

let catalogArtistJSON =
    JSON.init(parseJSON:
        """
        {
            "attributes": {
                "genreNames": [
                    "Rock"
                ],
                "name": "Bruce Springsteen",
                "url": "https://itunes.apple.com/us/artist/bruce-springsteen/id178834"
            },
            "href": "/v1/catalog/us/artists/178834",
            "id": "178834",
            "relationships": {
                "albums": {
                    "data": [
                        {
                            "href": "/v1/catalog/us/albums/1112053294",
                            "id": "1112053294",
                            "type": "albums"
                        },
                        {
                            "href": "/v1/catalog/us/albums/1083046086",
                            "id": "1083046086",
                            "type": "albums"
                        },
                        {
                            "href": "/v1/catalog/us/albums/1051321939",
                            "id": "1051321939",
                            "type": "albums"
                        },
                        {
                            "href": "/v1/catalog/us/albums/1062111710",
                            "id": "1062111710",
                            "type": "albums"
                        },
                        {
                            "href": "/v1/catalog/us/albums/1049523853",
                            "id": "1049523853",
                            "type": "albums"
                        },
                        {
                            "href": "/v1/catalog/us/albums/1051327591",
                            "id": "1051327591",
                            "type": "albums"
                        },
                        {
                            "href": "/v1/catalog/us/albums/1025011001",
                            "id": "1025011001",
                            "type": "albums"
                        },
                        {
                            "href": "/v1/catalog/us/albums/1027452033",
                            "id": "1027452033",
                            "type": "albums"
                        },
                        {
                            "href": "/v1/catalog/us/albums/987471714",
                            "id": "987471714",
                            "type": "albums"
                        },
                        {
                            "href": "/v1/catalog/us/albums/955683364",
                            "id": "955683364",
                            "type": "albums"
                        },
                        {
                            "href": "/v1/catalog/us/albums/918626472",
                            "id": "918626472",
                            "type": "albums"
                        },
                        {
                            "href": "/v1/catalog/us/albums/947755049",
                            "id": "947755049",
                            "type": "albums"
                        },
                        {
                            "href": "/v1/catalog/us/albums/924130802",
                            "id": "924130802",
                            "type": "albums"
                        },
                        {
                            "href": "/v1/catalog/us/albums/928280298",
                            "id": "928280298",
                            "type": "albums"
                        },
                        {
                            "href": "/v1/catalog/us/albums/891847015",
                            "id": "891847015",
                            "type": "albums"
                        },
                        {
                            "href": "/v1/catalog/us/albums/843057439",
                            "id": "843057439",
                            "type": "albums"
                        },
                        {
                            "href": "/v1/catalog/us/albums/857968854",
                            "id": "857968854",
                            "type": "albums"
                        },
                        {
                            "href": "/v1/catalog/us/albums/797522110",
                            "id": "797522110",
                            "type": "albums"
                        },
                        {
                            "href": "/v1/catalog/us/albums/791259770",
                            "id": "791259770",
                            "type": "albums"
                        },
                        {
                            "href": "/v1/catalog/us/albums/741055385",
                            "id": "741055385",
                            "type": "albums"
                        },
                        {
                            "href": "/v1/catalog/us/albums/748097215",
                            "id": "748097215",
                            "type": "albums"
                        },
                        {
                            "href": "/v1/catalog/us/albums/860790154",
                            "id": "860790154",
                            "type": "albums"
                        },
                        {
                            "href": "/v1/catalog/us/albums/635191145",
                            "id": "635191145",
                            "type": "albums"
                        },
                        {
                            "href": "/v1/catalog/us/albums/604717239",
                            "id": "604717239",
                            "type": "albums"
                        },
                        {
                            "href": "/v1/catalog/us/albums/507691647",
                            "id": "507691647",
                            "type": "albums"
                        }
                    ],
                    "href": "/v1/catalog/us/artists/178834/albums",
                    "next": "/v1/catalog/us/artists/178834/albums?offset=25"
                }
            },
            "type": "artists"
        }
        """)

let multipleCatalogArtistsJSON =
    JSON.init(parseJSON:
        """
            {
                "data": [
                    {
                        "attributes": {
                            "genreNames": [
                                "Rock"
                            ],
                            "name": "Bruce Springsteen",
                            "url": "https://itunes.apple.com/us/artist/bruce-springsteen/id178834"
                        },
                        "href": "/v1/catalog/us/artists/178834",
                        "id": "178834",
                        "relationships": {
                            "albums": {
                                "data": [
                                    {
                                        "href": "/v1/catalog/us/albums/1112053294",
                                        "id": "1112053294",
                                        "type": "albums"
                                    },
                                    {
                                        "href": "/v1/catalog/us/albums/1083046086",
                                        "id": "1083046086",
                                        "type": "albums"
                                    },
                                    {
                                        "href": "/v1/catalog/us/albums/1051321939",
                                        "id": "1051321939",
                                        "type": "albums"
                                    },
                                    {
                                        "href": "/v1/catalog/us/albums/1062111710",
                                        "id": "1062111710",
                                        "type": "albums"
                                    },
                                    {
                                        "href": "/v1/catalog/us/albums/1049523853",
                                        "id": "1049523853",
                                        "type": "albums"
                                    },
                                    {
                                        "href": "/v1/catalog/us/albums/1051327591",
                                        "id": "1051327591",
                                        "type": "albums"
                                    },
                                    {
                                        "href": "/v1/catalog/us/albums/1025011001",
                                        "id": "1025011001",
                                        "type": "albums"
                                    },
                                    {
                                        "href": "/v1/catalog/us/albums/1027452033",
                                        "id": "1027452033",
                                        "type": "albums"
                                    },
                                    {
                                        "href": "/v1/catalog/us/albums/987471714",
                                        "id": "987471714",
                                        "type": "albums"
                                    },
                                    {
                                        "href": "/v1/catalog/us/albums/955683364",
                                        "id": "955683364",
                                        "type": "albums"
                                    },
                                    {
                                        "href": "/v1/catalog/us/albums/918626472",
                                        "id": "918626472",
                                        "type": "albums"
                                    },
                                    {
                                        "href": "/v1/catalog/us/albums/947755049",
                                        "id": "947755049",
                                        "type": "albums"
                                    },
                                    {
                                        "href": "/v1/catalog/us/albums/924130802",
                                        "id": "924130802",
                                        "type": "albums"
                                    },
                                    {
                                        "href": "/v1/catalog/us/albums/928280298",
                                        "id": "928280298",
                                        "type": "albums"
                                    },
                                    {
                                        "href": "/v1/catalog/us/albums/891847015",
                                        "id": "891847015",
                                        "type": "albums"
                                    },
                                    {
                                        "href": "/v1/catalog/us/albums/843057439",
                                        "id": "843057439",
                                        "type": "albums"
                                    },
                                    {
                                        "href": "/v1/catalog/us/albums/857968854",
                                        "id": "857968854",
                                        "type": "albums"
                                    },
                                    {
                                        "href": "/v1/catalog/us/albums/797522110",
                                        "id": "797522110",
                                        "type": "albums"
                                    },
                                    {
                                        "href": "/v1/catalog/us/albums/791259770",
                                        "id": "791259770",
                                        "type": "albums"
                                    },
                                    {
                                        "href": "/v1/catalog/us/albums/741055385",
                                        "id": "741055385",
                                        "type": "albums"
                                    },
                                    {
                                        "href": "/v1/catalog/us/albums/748097215",
                                        "id": "748097215",
                                        "type": "albums"
                                    },
                                    {
                                        "href": "/v1/catalog/us/albums/860790154",
                                        "id": "860790154",
                                        "type": "albums"
                                    },
                                    {
                                        "href": "/v1/catalog/us/albums/635191145",
                                        "id": "635191145",
                                        "type": "albums"
                                    },
                                    {
                                        "href": "/v1/catalog/us/albums/604717239",
                                        "id": "604717239",
                                        "type": "albums"
                                    },
                                    {
                                        "href": "/v1/catalog/us/albums/507691647",
                                        "id": "507691647",
                                        "type": "albums"
                                    }
                                ],
                                "href": "/v1/catalog/us/artists/178834/albums",
                                "next": "/v1/catalog/us/artists/178834/albums?offset=25"
                            }
                        },
                        "type": "artists"
                    },
                    {
                        "attributes": {
                            "genreNames": [
                                "Rock"
                            ],
                            "name": "Bob Dylan",
                            "url": "https://itunes.apple.com/us/artist/bob-dylan/id462006"
                        },
                        "href": "/v1/catalog/us/artists/462006",
                        "id": "462006",
                        "relationships": {
                            "albums": {
                                "data": [
                                    {
                                        "href": "/v1/catalog/us/albums/1099677284",
                                        "id": "1099677284",
                                        "type": "albums"
                                    },
                                    {
                                        "href": "/v1/catalog/us/albums/1107753504",
                                        "id": "1107753504",
                                        "type": "albums"
                                    },
                                    {
                                        "href": "/v1/catalog/us/albums/1110230347",
                                        "id": "1110230347",
                                        "type": "albums"
                                    },
                                    {
                                        "href": "/v1/catalog/us/albums/1100815026",
                                        "id": "1100815026",
                                        "type": "albums"
                                    },
                                    {
                                        "href": "/v1/catalog/us/albums/1041144003",
                                        "id": "1041144003",
                                        "type": "albums"
                                    },
                                    {
                                        "href": "/v1/catalog/us/albums/1041169203",
                                        "id": "1041169203",
                                        "type": "albums"
                                    },
                                    {
                                        "href": "/v1/catalog/us/albums/1053284864",
                                        "id": "1053284864",
                                        "type": "albums"
                                    },
                                    {
                                        "href": "/v1/catalog/us/albums/1025066054",
                                        "id": "1025066054",
                                        "type": "albums"
                                    },
                                    {
                                        "href": "/v1/catalog/us/albums/945762927",
                                        "id": "945762927",
                                        "type": "albums"
                                    },
                                    {
                                        "href": "/v1/catalog/us/albums/963786366",
                                        "id": "963786366",
                                        "type": "albums"
                                    },
                                    {
                                        "href": "/v1/catalog/us/albums/952097786",
                                        "id": "952097786",
                                        "type": "albums"
                                    },
                                    {
                                        "href": "/v1/catalog/us/albums/949629284",
                                        "id": "949629284",
                                        "type": "albums"
                                    },
                                    {
                                        "href": "/v1/catalog/us/albums/935305035",
                                        "id": "935305035",
                                        "type": "albums"
                                    },
                                    {
                                        "href": "/v1/catalog/us/albums/925180674",
                                        "id": "925180674",
                                        "type": "albums"
                                    },
                                    {
                                        "href": "/v1/catalog/us/albums/924783871",
                                        "id": "924783871",
                                        "type": "albums"
                                    },
                                    {
                                        "href": "/v1/catalog/us/albums/940024611",
                                        "id": "940024611",
                                        "type": "albums"
                                    },
                                    {
                                        "href": "/v1/catalog/us/albums/941888332",
                                        "id": "941888332",
                                        "type": "albums"
                                    },
                                    {
                                        "href": "/v1/catalog/us/albums/934218391",
                                        "id": "934218391",
                                        "type": "albums"
                                    },
                                    {
                                        "href": "/v1/catalog/us/albums/933374405",
                                        "id": "933374405",
                                        "type": "albums"
                                    },
                                    {
                                        "href": "/v1/catalog/us/albums/923147717",
                                        "id": "923147717",
                                        "type": "albums"
                                    },
                                    {
                                        "href": "/v1/catalog/us/albums/919153202",
                                        "id": "919153202",
                                        "type": "albums"
                                    },
                                    {
                                        "href": "/v1/catalog/us/albums/902876924",
                                        "id": "902876924",
                                        "type": "albums"
                                    },
                                    {
                                        "href": "/v1/catalog/us/albums/900485117",
                                        "id": "900485117",
                                        "type": "albums"
                                    },
                                    {
                                        "href": "/v1/catalog/us/albums/890600867",
                                        "id": "890600867",
                                        "type": "albums"
                                    },
                                    {
                                        "href": "/v1/catalog/us/albums/889903193",
                                        "id": "889903193",
                                        "type": "albums"
                                    }
                                ],
                                "href": "/v1/catalog/us/artists/462006/albums",
                                "next": "/v1/catalog/us/artists/462006/albums?offset=25"
                            }
                        },
                        "type": "artists"
                    }
                ]
            }
        """)

let libraryArtistJSON =
    JSON.init(parseJSON:
        """
        {
            "attributes": {
                "name": "Pink Floyd"
            },
            "href": "/v1/me/library/artists/r.QxpxYW2",
            "id": "r.QxpxYW2",
            "type": "library-artists"
        }
    """)

let multipleLibraryArtistsJSON =
    JSON.init(parseJSON:
        """
            {
                "data": [
                    {
                        "attributes": {
                            "name": "Jungle"
                        },
                        "href": "/v1/me/library/artists/r.c6kPr2z",
                        "id": "r.c6kPr2z",
                        "type": "library-artists"
                    },
                    {
                        "attributes": {
                            "name": "Pink Floyd"
                        },
                        "href": "/v1/me/library/artists/r.QxpxYW2",
                        "id": "r.QxpxYW2",
                        "type": "library-artists"
                    }
                ]
            }
        """)

let allLibraryArtistsJSON =
JSON.init(parseJSON:
    """
        {
            "data": [
                {
                    "attributes": {
                        "name": "Beck"
                    },
                    "href": "/v1/me/library/artists/r.weJ8gza",
                    "id": "r.weJ8gza",
                    "type": "library-artists"
                },
                {
                    "attributes": {
                        "name": "Jungle"
                    },
                    "href": "/v1/me/library/artists/r.c6kPr2z",
                    "id": "r.c6kPr2z",
                    "type": "library-artists"
                },
                {
                    "attributes": {
                        "name": "Led Zeppelin"
                    },
                    "href": "/v1/me/library/artists/r.vRiRhpg",
                    "id": "r.vRiRhpg",
                    "type": "library-artists"
                },
                {
                    "attributes": {
                        "name": "OverClocked ReMix"
                    },
                    "href": "/v1/me/library/artists/r.0P3yLPy",
                    "id": "r.0P3yLPy",
                    "type": "library-artists"
                },
                {
                    "attributes": {
                        "name": "Pink Floyd"
                    },
                    "href": "/v1/me/library/artists/r.QxpxYW2",
                    "id": "r.QxpxYW2",
                    "type": "library-artists"
                },
                {
                    "attributes": {
                        "name": "Queen"
                    },
                    "href": "/v1/me/library/artists/r.B3bUrr1",
                    "id": "r.B3bUrr1",
                    "type": "library-artists"
                },
                {
                    "attributes": {
                        "name": "Sublime"
                    },
                    "href": "/v1/me/library/artists/r.j8O2K97",
                    "id": "r.j8O2K97",
                    "type": "library-artists"
                },
                {
                    "attributes": {
                        "name": "U2"
                    },
                    "href": "/v1/me/library/artists/r.SLnW4Pq",
                    "id": "r.SLnW4Pq",
                    "type": "library-artists"
                },
                {
                    "attributes": {
                        "name": "Ukraine National Symphony Orchestra"
                    },
                    "href": "/v1/me/library/artists/r.Mu8ykSa",
                    "id": "r.Mu8ykSa",
                    "type": "library-artists"
                },
                {
                    "attributes": {
                        "name": "Wiener Mozart Ensemble & Willi Boskovsky"
                    },
                    "href": "/v1/me/library/artists/r.ypMRvSt",
                    "id": "r.ypMRvSt",
                    "type": "library-artists"
                }
            ]
        }
    """)

let catalogAlbumJSON =
    JSON.init(parseJSON:
        """
        {
            "attributes": {
                "artistName": "Bruce Springsteen",
                "artwork": {
                    "bgColor": "ffffff",
                    "height": 1500,
                    "textColor1": "0c0b09",
                    "textColor2": "2a2724",
                    "textColor3": "3d3c3a",
                    "textColor4": "555250",
                    "url": "https://example.mzstatic.com/image/thumb/Music3/v4/2d/02/4a/2d024aaa-4547-ca71-7ba1-b8f5e1d98256/source/{w}x{h}bb.jpeg",
                    "width": 1500
                },
                "copyright": "\u{2117} 1975 Bruce Springsteen",
                "editorialNotes": {
                    "short": "Springsteen's third album was the one that broke it all open for him.",
                    "standard": "Springsteen's third album was the one that broke it all open for him, planting his tales of Jersey girls, cars, and nights spent sleeping on the beach firmly in the Top Five. He shot for an unholy hybrid of Orbison, Dylan and Spector \u{2014} and actually reached it. \"Come take my hand,\" he invited in the opening lines. \"We're ridin' out tonight to case the Promised Land.\" Soon after this album, he'd discover the limits of such dreams, but here, it's a wide-open road: Even the tales of petty crime (\"Meeting Across the River\") and teen-gang violence (\"Jungleland\") are invested with all the wit and charm you can handle. Bruce's catalog is filled with one-of-a-kind albums from <i>The Wild, The Innocent and the E Street Shuffle</i> to <i>The Ghost of Tom Joad</i>. Forty years on, <i>Born to Run</i> still sits near the very top of that stack."
                },
                "genreNames": [
                    "Rock",
                    "Music",
                    "Arena Rock",
                    "Rock & Roll",
                    "Pop",
                    "Pop/Rock"
                ],
                "isComplete": true,
                "isMasteredForItunes": true,
                "isSingle": false,
                "name": "Born to Run",
                "playParams": {
                    "id": "310730204",
                    "kind": "album"
                },
                "recordLabel": "Columbia",
                "releaseDate": "1975-08-25",
                "trackCount": 8,
                "url": "https://itunes.apple.com/us/album/born-to-run/310730204"
            },
            "href": "/v1/catalog/us/albums/310730204",
            "id": "310730204",
            "relationships": {
                "artists": {
                    "data": [
                        {
                            "href": "/v1/catalog/us/artists/178834",
                            "id": "178834",
                            "type": "artists"
                        }
                    ],
                    "href": "/v1/catalog/us/albums/310730204/artists"
                },
                "tracks": {
                    "data": [
                        {
                            "attributes": {
                                "artistName": "Bruce Springsteen",
                                "artwork": {
                                    "bgColor": "ffffff",
                                    "height": 1500,
                                    "textColor1": "0c0b09",
                                    "textColor2": "2a2724",
                                    "textColor3": "3d3c3a",
                                    "textColor4": "555250",
                                    "url": "https://example.mzstatic.com/image/thumb/Music3/v4/2d/02/4a/2d024aaa-4547-ca71-7ba1-b8f5e1d98256/source/{w}x{h}bb.jpeg",
                                    "width": 1500
                                },
                                "composerName": "Bruce Springsteen",
                                "discNumber": 1,
                                "durationInMillis": 289186,
                                "genreNames": [
                                    "Rock",
                                    "Music",
                                    "Arena Rock",
                                    "Rock & Roll",
                                    "Pop",
                                    "Pop/Rock"
                                ],
                                "isrc": "USSM19904335",
                                "name": "Thunder Road",
                                "playParams": {
                                    "id": "310730206",
                                    "kind": "song"
                                },
                                "previews": [
                                    {
                                        "url": "https://example.itunes.apple.com/apple-assets-us-std-000001/Music4/v4/a2/4f/a7/a24fa727-36e4-c870-973b-00704c80187a/mzaf_7083782255622091857.plus.aac.p.m4a"
                                    }
                                ],
                                "releaseDate": "1975-08-25",
                                "trackNumber": 1,
                                "url": "https://itunes.apple.com/us/album/thunder-road/310730204?i=310730206"
                            },
                            "href": "/v1/catalog/us/songs/310730206",
                            "id": "310730206",
                            "type": "songs"
                        },
                        {
                            "attributes": {
                                "artistName": "Bruce Springsteen",
                                "artwork": {
                                    "bgColor": "ffffff",
                                    "height": 1500,
                                    "textColor1": "0c0b09",
                                    "textColor2": "2a2724",
                                    "textColor3": "3d3c3a",
                                    "textColor4": "555250",
                                    "url": "https://example.mzstatic.com/image/thumb/Music3/v4/2d/02/4a/2d024aaa-4547-ca71-7ba1-b8f5e1d98256/source/{w}x{h}bb.jpeg",
                                    "width": 1500
                                },
                                "composerName": "Bruce Springsteen",
                                "discNumber": 1,
                                "durationInMillis": 191315,
                                "genreNames": [
                                    "Rock",
                                    "Music",
                                    "Arena Rock",
                                    "Rock & Roll",
                                    "Pop",
                                    "Pop/Rock"
                                ],
                                "isrc": "USSM19904336",
                                "name": "Tenth Avenue Freeze-Out",
                                "playParams": {
                                    "id": "310730208",
                                    "kind": "song"
                                },
                                "previews": [
                                    {
                                        "url": "https://example.itunes.apple.com/apple-assets-us-std-000001/Music6/v4/4a/f4/d8/4af4d82e-4f37-744a-e57c-d215d4d33e7f/mzaf_5059518566033756247.plus.aac.p.m4a"
                                    }
                                ],
                                "releaseDate": "1975-08-25",
                                "trackNumber": 2,
                                "url": "https://itunes.apple.com/us/album/tenth-avenue-freeze-out/310730204?i=310730208"
                            },
                            "href": "/v1/catalog/us/songs/310730208",
                            "id": "310730208",
                            "type": "songs"
                        },
                        {
                            "attributes": {
                                "artistName": "Bruce Springsteen",
                                "artwork": {
                                    "bgColor": "ffffff",
                                    "height": 1500,
                                    "textColor1": "0c0b09",
                                    "textColor2": "2a2724",
                                    "textColor3": "3d3c3a",
                                    "textColor4": "555250",
                                    "url": "https://example.mzstatic.com/image/thumb/Music3/v4/2d/02/4a/2d024aaa-4547-ca71-7ba1-b8f5e1d98256/source/{w}x{h}bb.jpeg",
                                    "width": 1500
                                },
                                "composerName": "Bruce Springsteen",
                                "discNumber": 1,
                                "durationInMillis": 181341,
                                "genreNames": [
                                    "Rock",
                                    "Music",
                                    "Arena Rock",
                                    "Rock & Roll",
                                    "Pop",
                                    "Pop/Rock"
                                ],
                                "isrc": "USSM19904337",
                                "name": "Night",
                                "playParams": {
                                    "id": "310730209",
                                    "kind": "song"
                                },
                                "previews": [
                                    {
                                        "url": "https://example.itunes.apple.com/apple-assets-us-std-000001/Music6/v4/86/f0/48/86f048fe-0540-341d-23e4-af964a47accc/mzaf_5312429574489384302.plus.aac.p.m4a"
                                    }
                                ],
                                "releaseDate": "1975-08-25",
                                "trackNumber": 3,
                                "url": "https://itunes.apple.com/us/album/night/310730204?i=310730209"
                            },
                            "href": "/v1/catalog/us/songs/310730209",
                            "id": "310730209",
                            "type": "songs"
                        },
                        {
                            "attributes": {
                                "artistName": "Bruce Springsteen",
                                "artwork": {
                                    "bgColor": "ffffff",
                                    "height": 1500,
                                    "textColor1": "0c0b09",
                                    "textColor2": "2a2724",
                                    "textColor3": "3d3c3a",
                                    "textColor4": "555250",
                                    "url": "https://example.mzstatic.com/image/thumb/Music3/v4/2d/02/4a/2d024aaa-4547-ca71-7ba1-b8f5e1d98256/source/{w}x{h}bb.jpeg",
                                    "width": 1500
                                },
                                "composerName": "Bruce Springsteen",
                                "discNumber": 1,
                                "durationInMillis": 391764,
                                "genreNames": [
                                    "Rock",
                                    "Music",
                                    "Arena Rock",
                                    "Rock & Roll",
                                    "Pop",
                                    "Pop/Rock"
                                ],
                                "isrc": "USSM19904338",
                                "name": "Backstreets",
                                "playParams": {
                                    "id": "310730213",
                                    "kind": "song"
                                },
                                "previews": [
                                    {
                                        "url": "https://example.itunes.apple.com/apple-assets-us-std-000001/Music4/v4/be/5e/c2/be5ec2f4-4a2d-bebe-2673-c561184b2e00/mzaf_6738395021881076522.plus.aac.p.m4a"
                                    }
                                ],
                                "releaseDate": "1975-08-25",
                                "trackNumber": 4,
                                "url": "https://itunes.apple.com/us/album/backstreets/310730204?i=310730213"
                            },
                            "href": "/v1/catalog/us/songs/310730213",
                            "id": "310730213",
                            "type": "songs"
                        },
                        {
                            "attributes": {
                                "artistName": "Bruce Springsteen",
                                "artwork": {
                                    "bgColor": "ffffff",
                                    "height": 1500,
                                    "textColor1": "0c0b09",
                                    "textColor2": "2a2724",
                                    "textColor3": "3d3c3a",
                                    "textColor4": "555250",
                                    "url": "https://example.mzstatic.com/image/thumb/Music3/v4/2d/02/4a/2d024aaa-4547-ca71-7ba1-b8f5e1d98256/source/{w}x{h}bb.jpeg",
                                    "width": 1500
                                },
                                "composerName": "Bruce Springsteen",
                                "discNumber": 1,
                                "durationInMillis": 269933,
                                "genreNames": [
                                    "Rock",
                                    "Music",
                                    "Arena Rock",
                                    "Rock & Roll",
                                    "Pop",
                                    "Pop/Rock"
                                ],
                                "isrc": "USSM17500423",
                                "name": "Born to Run",
                                "playParams": {
                                    "id": "310730214",
                                    "kind": "song"
                                },
                                "previews": [
                                    {
                                        "url": "https://example.itunes.apple.com/apple-assets-us-std-000001/Music6/v4/e7/11/61/e7116151-918a-d38b-1f19-18c5e9fde68d/mzaf_6408655963451084497.plus.aac.p.m4a"
                                    }
                                ],
                                "releaseDate": "1975-08-25",
                                "trackNumber": 5,
                                "url": "https://itunes.apple.com/us/album/born-to-run/310730204?i=310730214"
                            },
                            "href": "/v1/catalog/us/songs/310730214",
                            "id": "310730214",
                            "type": "songs"
                        },
                        {
                            "attributes": {
                                "artistName": "Bruce Springsteen",
                                "artwork": {
                                    "bgColor": "ffffff",
                                    "height": 1500,
                                    "textColor1": "0c0b09",
                                    "textColor2": "2a2724",
                                    "textColor3": "3d3c3a",
                                    "textColor4": "555250",
                                    "url": "https://example.mzstatic.com/image/thumb/Music3/v4/2d/02/4a/2d024aaa-4547-ca71-7ba1-b8f5e1d98256/source/{w}x{h}bb.jpeg",
                                    "width": 1500
                                },
                                "composerName": "Bruce Springsteen",
                                "discNumber": 1,
                                "durationInMillis": 270261,
                                "genreNames": [
                                    "Rock",
                                    "Music",
                                    "Arena Rock",
                                    "Rock & Roll",
                                    "Pop",
                                    "Pop/Rock"
                                ],
                                "isrc": "USSM19904339",
                                "name": "She's the One",
                                "playParams": {
                                    "id": "310730220",
                                    "kind": "song"
                                },
                                "previews": [
                                    {
                                        "url": "https://example.itunes.apple.com/apple-assets-us-std-000001/Music4/v4/7f/a7/98/7fa798ce-6961-a8eb-36f2-1ba5a6edb633/mzaf_1598287630853821436.plus.aac.p.m4a"
                                    }
                                ],
                                "releaseDate": "1975-08-25",
                                "trackNumber": 6,
                                "url": "https://itunes.apple.com/us/album/shes-the-one/310730204?i=310730220"
                            },
                            "href": "/v1/catalog/us/songs/310730220",
                            "id": "310730220",
                            "type": "songs"
                        },
                        {
                            "attributes": {
                                "artistName": "Bruce Springsteen",
                                "artwork": {
                                    "bgColor": "ffffff",
                                    "height": 1500,
                                    "textColor1": "0c0b09",
                                    "textColor2": "2a2724",
                                    "textColor3": "3d3c3a",
                                    "textColor4": "555250",
                                    "url": "https://example.mzstatic.com/image/thumb/Music3/v4/2d/02/4a/2d024aaa-4547-ca71-7ba1-b8f5e1d98256/source/{w}x{h}bb.jpeg",
                                    "width": 1500
                                },
                                "composerName": "Bruce Springsteen",
                                "discNumber": 1,
                                "durationInMillis": 198721,
                                "genreNames": [
                                    "Rock",
                                    "Music",
                                    "Arena Rock",
                                    "Rock & Roll",
                                    "Pop",
                                    "Pop/Rock"
                                ],
                                "isrc": "USSM19904340",
                                "name": "Meeting Across the River",
                                "playParams": {
                                    "id": "310730222",
                                    "kind": "song"
                                },
                                "previews": [
                                    {
                                        "url": "https://example.itunes.apple.com/apple-assets-us-std-000001/Music/v4/5c/57/79/5c57797c-1eaa-cc52-c09e-92a0ae5640bc/mzaf_8885046370683433204.plus.aac.p.m4a"
                                    }
                                ],
                                "releaseDate": "1975-08-25",
                                "trackNumber": 7,
                                "url": "https://itunes.apple.com/us/album/meeting-across-the-river/310730204?i=310730222"
                            },
                            "href": "/v1/catalog/us/songs/310730222",
                            "id": "310730222",
                            "type": "songs"
                        },
                        {
                            "attributes": {
                                "artistName": "Bruce Springsteen",
                                "artwork": {
                                    "bgColor": "ffffff",
                                    "height": 1500,
                                    "textColor1": "0c0b09",
                                    "textColor2": "2a2724",
                                    "textColor3": "3d3c3a",
                                    "textColor4": "555250",
                                    "url": "https://example.mzstatic.com/image/thumb/Music3/v4/2d/02/4a/2d024aaa-4547-ca71-7ba1-b8f5e1d98256/source/{w}x{h}bb.jpeg",
                                    "width": 1500
                                },
                                "composerName": "Bruce Springsteen",
                                "discNumber": 1,
                                "durationInMillis": 573496,
                                "genreNames": [
                                    "Rock",
                                    "Music",
                                    "Arena Rock",
                                    "Rock & Roll",
                                    "Pop",
                                    "Pop/Rock"
                                ],
                                "isrc": "USSM19904341",
                                "name": "Jungleland",
                                "playParams": {
                                    "id": "310730227",
                                    "kind": "song"
                                },
                                "previews": [
                                    {
                                        "url": "https://example.itunes.apple.com/apple-assets-us-std-000001/Music4/v4/0a/23/cb/0a23cb27-471d-5b38-1c19-1fd5bff63811/mzaf_1376553896271654019.plus.aac.p.m4a"
                                    }
                                ],
                                "releaseDate": "1975-08-25",
                                "trackNumber": 8,
                                "url": "https://itunes.apple.com/us/album/jungleland/310730204?i=310730227"
                            },
                            "href": "/v1/catalog/us/songs/310730227",
                            "id": "310730227",
                            "type": "songs"
                        }
                    ],
                    "href": "/v1/catalog/us/albums/310730204/tracks"
                }
            },
            "type": "albums"
        }
    """)

let multipleCatalogAlbumsJSON =
    JSON.init(parseJSON:
        """
            {
                "data": [
                    {
                        "attributes": {
                            "artistName": "Bruce Springsteen",
                            "artwork": {
                                "bgColor": "ffffff",
                                "height": 1500,
                                "textColor1": "0c0b09",
                                "textColor2": "2a2724",
                                "textColor3": "3d3c3a",
                                "textColor4": "555250",
                                "url": "https://example.mzstatic.com/image/thumb/Music3/v4/2d/02/4a/2d024aaa-4547-ca71-7ba1-b8f5e1d98256/source/{w}x{h}bb.jpeg",
                                "width": 1500
                            },
                            "copyright": "\u{2117} 1975 Bruce Springsteen",
                            "editorialNotes": {
                                "short": "Springsteen's third album was the one that broke it all open for him.",
                                "standard": "Springsteen's third album was the one that broke it all open for him, planting his tales of Jersey girls, cars, and nights spent sleeping on the beach firmly in the Top Five. He shot for an unholy hybrid of Orbison, Dylan and Spector \u{2014} and actually reached it. \"Come take my hand,\" he invited in the opening lines. \"We're ridin' out tonight to case the Promised Land.\" Soon after this album, he'd discover the limits of such dreams, but here, it's a wide-open road: Even the tales of petty crime (\"Meeting Across the River\") and teen-gang violence (\"Jungleland\") are invested with all the wit and charm you can handle. Bruce's catalog is filled with one-of-a-kind albums from <i>The Wild, The Innocent and the E Street Shuffle</i> to <i>The Ghost of Tom Joad</i>. Forty years on, <i>Born to Run</i> still sits near the very top of that stack."
                            },
                            "genreNames": [
                                "Rock",
                                "Music",
                                "Arena Rock",
                                "Rock & Roll",
                                "Pop",
                                "Pop/Rock"
                            ],
                            "isComplete": true,
                            "isMasteredForItunes": true,
                            "isSingle": false,
                            "name": "Born to Run",
                            "playParams": {
                                "id": "310730204",
                                "kind": "album"
                            },
                            "recordLabel": "Columbia",
                            "releaseDate": "1975-08-25",
                            "trackCount": 8,
                            "url": "https://itunes.apple.com/us/album/born-to-run/310730204"
                        },
                        "href": "/v1/catalog/us/albums/310730204",
                        "id": "310730204",
                        "relationships": {
                            "artists": {
                                "data": [
                                    {
                                        "href": "/v1/catalog/us/artists/178834",
                                        "id": "178834",
                                        "type": "artists"
                                    }
                                ],
                                "href": "/v1/catalog/us/albums/310730204/artists"
                            },
                            "tracks": {
                                "data": [
                                    {
                                        "attributes": {
                                            "artistName": "Bruce Springsteen",
                                            "artwork": {
                                                "bgColor": "ffffff",
                                                "height": 1500,
                                                "textColor1": "0c0b09",
                                                "textColor2": "2a2724",
                                                "textColor3": "3d3c3a",
                                                "textColor4": "555250",
                                                "url": "https://example.mzstatic.com/image/thumb/Music3/v4/2d/02/4a/2d024aaa-4547-ca71-7ba1-b8f5e1d98256/source/{w}x{h}bb.jpeg",
                                                "width": 1500
                                            },
                                            "composerName": "Bruce Springsteen",
                                            "discNumber": 1,
                                            "durationInMillis": 289186,
                                            "genreNames": [
                                                "Rock",
                                                "Music",
                                                "Arena Rock",
                                                "Rock & Roll",
                                                "Pop",
                                                "Pop/Rock"
                                            ],
                                            "isrc": "USSM19904335",
                                            "name": "Thunder Road",
                                            "playParams": {
                                                "id": "310730206",
                                                "kind": "song"
                                            },
                                            "previews": [
                                                {
                                                    "url": "https://example.itunes.apple.com/apple-assets-us-std-000001/Music4/v4/a2/4f/a7/a24fa727-36e4-c870-973b-00704c80187a/mzaf_7083782255622091857.plus.aac.p.m4a"
                                                }
                                            ],
                                            "releaseDate": "1975-08-25",
                                            "trackNumber": 1,
                                            "url": "https://itunes.apple.com/us/album/thunder-road/310730204?i=310730206"
                                        },
                                        "href": "/v1/catalog/us/songs/310730206",
                                        "id": "310730206",
                                        "type": "songs"
                                    },
                                    {
                                        "attributes": {
                                            "artistName": "Bruce Springsteen",
                                            "artwork": {
                                                "bgColor": "ffffff",
                                                "height": 1500,
                                                "textColor1": "0c0b09",
                                                "textColor2": "2a2724",
                                                "textColor3": "3d3c3a",
                                                "textColor4": "555250",
                                                "url": "https://example.mzstatic.com/image/thumb/Music3/v4/2d/02/4a/2d024aaa-4547-ca71-7ba1-b8f5e1d98256/source/{w}x{h}bb.jpeg",
                                                "width": 1500
                                            },
                                            "composerName": "Bruce Springsteen",
                                            "discNumber": 1,
                                            "durationInMillis": 191315,
                                            "genreNames": [
                                                "Rock",
                                                "Music",
                                                "Arena Rock",
                                                "Rock & Roll",
                                                "Pop",
                                                "Pop/Rock"
                                            ],
                                            "isrc": "USSM19904336",
                                            "name": "Tenth Avenue Freeze-Out",
                                            "playParams": {
                                                "id": "310730208",
                                                "kind": "song"
                                            },
                                            "previews": [
                                                {
                                                    "url": "https://example.itunes.apple.com/apple-assets-us-std-000001/Music6/v4/4a/f4/d8/4af4d82e-4f37-744a-e57c-d215d4d33e7f/mzaf_5059518566033756247.plus.aac.p.m4a"
                                                }
                                            ],
                                            "releaseDate": "1975-08-25",
                                            "trackNumber": 2,
                                            "url": "https://itunes.apple.com/us/album/tenth-avenue-freeze-out/310730204?i=310730208"
                                        },
                                        "href": "/v1/catalog/us/songs/310730208",
                                        "id": "310730208",
                                        "type": "songs"
                                    },
                                    {
                                        "attributes": {
                                            "artistName": "Bruce Springsteen",
                                            "artwork": {
                                                "bgColor": "ffffff",
                                                "height": 1500,
                                                "textColor1": "0c0b09",
                                                "textColor2": "2a2724",
                                                "textColor3": "3d3c3a",
                                                "textColor4": "555250",
                                                "url": "https://example.mzstatic.com/image/thumb/Music3/v4/2d/02/4a/2d024aaa-4547-ca71-7ba1-b8f5e1d98256/source/{w}x{h}bb.jpeg",
                                                "width": 1500
                                            },
                                            "composerName": "Bruce Springsteen",
                                            "discNumber": 1,
                                            "durationInMillis": 181341,
                                            "genreNames": [
                                                "Rock",
                                                "Music",
                                                "Arena Rock",
                                                "Rock & Roll",
                                                "Pop",
                                                "Pop/Rock"
                                            ],
                                            "isrc": "USSM19904337",
                                            "name": "Night",
                                            "playParams": {
                                                "id": "310730209",
                                                "kind": "song"
                                            },
                                            "previews": [
                                                {
                                                    "url": "https://example.itunes.apple.com/apple-assets-us-std-000001/Music6/v4/86/f0/48/86f048fe-0540-341d-23e4-af964a47accc/mzaf_5312429574489384302.plus.aac.p.m4a"
                                                }
                                            ],
                                            "releaseDate": "1975-08-25",
                                            "trackNumber": 3,
                                            "url": "https://itunes.apple.com/us/album/night/310730204?i=310730209"
                                        },
                                        "href": "/v1/catalog/us/songs/310730209",
                                        "id": "310730209",
                                        "type": "songs"
                                    },
                                    {
                                        "attributes": {
                                            "artistName": "Bruce Springsteen",
                                            "artwork": {
                                                "bgColor": "ffffff",
                                                "height": 1500,
                                                "textColor1": "0c0b09",
                                                "textColor2": "2a2724",
                                                "textColor3": "3d3c3a",
                                                "textColor4": "555250",
                                                "url": "https://example.mzstatic.com/image/thumb/Music3/v4/2d/02/4a/2d024aaa-4547-ca71-7ba1-b8f5e1d98256/source/{w}x{h}bb.jpeg",
                                                "width": 1500
                                            },
                                            "composerName": "Bruce Springsteen",
                                            "discNumber": 1,
                                            "durationInMillis": 391764,
                                            "genreNames": [
                                                "Rock",
                                                "Music",
                                                "Arena Rock",
                                                "Rock & Roll",
                                                "Pop",
                                                "Pop/Rock"
                                            ],
                                            "isrc": "USSM19904338",
                                            "name": "Backstreets",
                                            "playParams": {
                                                "id": "310730213",
                                                "kind": "song"
                                            },
                                            "previews": [
                                                {
                                                    "url": "https://example.itunes.apple.com/apple-assets-us-std-000001/Music4/v4/be/5e/c2/be5ec2f4-4a2d-bebe-2673-c561184b2e00/mzaf_6738395021881076522.plus.aac.p.m4a"
                                                }
                                            ],
                                            "releaseDate": "1975-08-25",
                                            "trackNumber": 4,
                                            "url": "https://itunes.apple.com/us/album/backstreets/310730204?i=310730213"
                                        },
                                        "href": "/v1/catalog/us/songs/310730213",
                                        "id": "310730213",
                                        "type": "songs"
                                    },
                                    {
                                        "attributes": {
                                            "artistName": "Bruce Springsteen",
                                            "artwork": {
                                                "bgColor": "ffffff",
                                                "height": 1500,
                                                "textColor1": "0c0b09",
                                                "textColor2": "2a2724",
                                                "textColor3": "3d3c3a",
                                                "textColor4": "555250",
                                                "url": "https://example.mzstatic.com/image/thumb/Music3/v4/2d/02/4a/2d024aaa-4547-ca71-7ba1-b8f5e1d98256/source/{w}x{h}bb.jpeg",
                                                "width": 1500
                                            },
                                            "composerName": "Bruce Springsteen",
                                            "discNumber": 1,
                                            "durationInMillis": 269933,
                                            "genreNames": [
                                                "Rock",
                                                "Music",
                                                "Arena Rock",
                                                "Rock & Roll",
                                                "Pop",
                                                "Pop/Rock"
                                            ],
                                            "isrc": "USSM17500423",
                                            "name": "Born to Run",
                                            "playParams": {
                                                "id": "310730214",
                                                "kind": "song"
                                            },
                                            "previews": [
                                                {
                                                    "url": "https://example.itunes.apple.com/apple-assets-us-std-000001/Music6/v4/e7/11/61/e7116151-918a-d38b-1f19-18c5e9fde68d/mzaf_6408655963451084497.plus.aac.p.m4a"
                                                }
                                            ],
                                            "releaseDate": "1975-08-25",
                                            "trackNumber": 5,
                                            "url": "https://itunes.apple.com/us/album/born-to-run/310730204?i=310730214"
                                        },
                                        "href": "/v1/catalog/us/songs/310730214",
                                        "id": "310730214",
                                        "type": "songs"
                                    },
                                    {
                                        "attributes": {
                                            "artistName": "Bruce Springsteen",
                                            "artwork": {
                                                "bgColor": "ffffff",
                                                "height": 1500,
                                                "textColor1": "0c0b09",
                                                "textColor2": "2a2724",
                                                "textColor3": "3d3c3a",
                                                "textColor4": "555250",
                                                "url": "https://example.mzstatic.com/image/thumb/Music3/v4/2d/02/4a/2d024aaa-4547-ca71-7ba1-b8f5e1d98256/source/{w}x{h}bb.jpeg",
                                                "width": 1500
                                            },
                                            "composerName": "Bruce Springsteen",
                                            "discNumber": 1,
                                            "durationInMillis": 270261,
                                            "genreNames": [
                                                "Rock",
                                                "Music",
                                                "Arena Rock",
                                                "Rock & Roll",
                                                "Pop",
                                                "Pop/Rock"
                                            ],
                                            "isrc": "USSM19904339",
                                            "name": "She's the One",
                                            "playParams": {
                                                "id": "310730220",
                                                "kind": "song"
                                            },
                                            "previews": [
                                                {
                                                    "url": "https://example.itunes.apple.com/apple-assets-us-std-000001/Music4/v4/7f/a7/98/7fa798ce-6961-a8eb-36f2-1ba5a6edb633/mzaf_1598287630853821436.plus.aac.p.m4a"
                                                }
                                            ],
                                            "releaseDate": "1975-08-25",
                                            "trackNumber": 6,
                                            "url": "https://itunes.apple.com/us/album/shes-the-one/310730204?i=310730220"
                                        },
                                        "href": "/v1/catalog/us/songs/310730220",
                                        "id": "310730220",
                                        "type": "songs"
                                    },
                                    {
                                        "attributes": {
                                            "artistName": "Bruce Springsteen",
                                            "artwork": {
                                                "bgColor": "ffffff",
                                                "height": 1500,
                                                "textColor1": "0c0b09",
                                                "textColor2": "2a2724",
                                                "textColor3": "3d3c3a",
                                                "textColor4": "555250",
                                                "url": "https://example.mzstatic.com/image/thumb/Music3/v4/2d/02/4a/2d024aaa-4547-ca71-7ba1-b8f5e1d98256/source/{w}x{h}bb.jpeg",
                                                "width": 1500
                                            },
                                            "composerName": "Bruce Springsteen",
                                            "discNumber": 1,
                                            "durationInMillis": 198721,
                                            "genreNames": [
                                                "Rock",
                                                "Music",
                                                "Arena Rock",
                                                "Rock & Roll",
                                                "Pop",
                                                "Pop/Rock"
                                            ],
                                            "isrc": "USSM19904340",
                                            "name": "Meeting Across the River",
                                            "playParams": {
                                                "id": "310730222",
                                                "kind": "song"
                                            },
                                            "previews": [
                                                {
                                                    "url": "https://example.itunes.apple.com/apple-assets-us-std-000001/Music/v4/5c/57/79/5c57797c-1eaa-cc52-c09e-92a0ae5640bc/mzaf_8885046370683433204.plus.aac.p.m4a"
                                                }
                                            ],
                                            "releaseDate": "1975-08-25",
                                            "trackNumber": 7,
                                            "url": "https://itunes.apple.com/us/album/meeting-across-the-river/310730204?i=310730222"
                                        },
                                        "href": "/v1/catalog/us/songs/310730222",
                                        "id": "310730222",
                                        "type": "songs"
                                    },
                                    {
                                        "attributes": {
                                            "artistName": "Bruce Springsteen",
                                            "artwork": {
                                                "bgColor": "ffffff",
                                                "height": 1500,
                                                "textColor1": "0c0b09",
                                                "textColor2": "2a2724",
                                                "textColor3": "3d3c3a",
                                                "textColor4": "555250",
                                                "url": "https://example.mzstatic.com/image/thumb/Music3/v4/2d/02/4a/2d024aaa-4547-ca71-7ba1-b8f5e1d98256/source/{w}x{h}bb.jpeg",
                                                "width": 1500
                                            },
                                            "composerName": "Bruce Springsteen",
                                            "discNumber": 1,
                                            "durationInMillis": 573496,
                                            "genreNames": [
                                                "Rock",
                                                "Music",
                                                "Arena Rock",
                                                "Rock & Roll",
                                                "Pop",
                                                "Pop/Rock"
                                            ],
                                            "isrc": "USSM19904341",
                                            "name": "Jungleland",
                                            "playParams": {
                                                "id": "310730227",
                                                "kind": "song"
                                            },
                                            "previews": [
                                                {
                                                    "url": "https://example.itunes.apple.com/apple-assets-us-std-000001/Music4/v4/0a/23/cb/0a23cb27-471d-5b38-1c19-1fd5bff63811/mzaf_1376553896271654019.plus.aac.p.m4a"
                                                }
                                            ],
                                            "releaseDate": "1975-08-25",
                                            "trackNumber": 8,
                                            "url": "https://itunes.apple.com/us/album/jungleland/310730204?i=310730227"
                                        },
                                        "href": "/v1/catalog/us/songs/310730227",
                                        "id": "310730227",
                                        "type": "songs"
                                    }
                                ],
                                "href": "/v1/catalog/us/albums/310730204/tracks"
                            }
                        },
                        "type": "albums"
                    },
                    {
                        "attributes": {
                            "artistName": "Bob Dylan",
                            "artwork": {
                                "bgColor": "1b201a",
                                "height": 1500,
                                "textColor1": "f4ebd3",
                                "textColor2": "d6b493",
                                "textColor3": "c8c2ae",
                                "textColor4": "b0967b",
                                "url": "https://example.mzstatic.com/image/thumb/Music111/v4/b2/ae/08/b2ae0875-2495-4d23-6f13-a91516ebd384/source/{w}x{h}bb.jpeg",
                                "width": 1500
                            },
                            "copyright": "\u{2117} Originally Released 1963 Sony Music Entertainment Inc.",
                            "editorialNotes": {
                                "short": "The protest and love songs that made his early reputation.",
                                "standard": "Bob Dylan\u{2019}s first album was mostly old folk and blues songs, but his second album, <i>The Freewheelin\u{2019} Bob Dylan</i>, shows a nearly unbelievable transformation. Dylan\u{2019}s songwriting talents came fast and furious. These earliest compositions include the landmark civil rights anthem \u{201c}Blowin\u{2019} in the Wind\u{201}d; the anti-war screeds \u{201c}Masters of War,\u{201}d \u{201}cTalkin\u{2019} World War III Blues,\u{201}d and \u{201}cA Hard Rain\u{2019}s a-Gonna Fall\u{201d}; and the romantic turns of \u{201c}Girl from the North Country\u{201}d and \u{201}cDon\u{2019}t Think Twice, It\u{2019}s All Right.\u{201}d Modern singer-songwriting starts here."
                            },
                            "genreNames": [
                                "Rock",
                                "Music",
                                "Singer/ Songwriter",
                                "Singer/Songwriter",
                                "Contemporary Folk"
                            ],
                            "isComplete": true,
                            "isMasteredForItunes": true,
                            "isSingle": false,
                            "name": "The Freewheelin' Bob Dylan",
                            "playParams": {
                                "id": "190758914",
                                "kind": "album"
                            },
                            "recordLabel": "Columbia",
                            "releaseDate": "1963-05-27",
                            "trackCount": 13,
                            "url": "https://itunes.apple.com/us/album/the-freewheelin-bob-dylan/190758914"
                        },
                        "href": "/v1/catalog/us/albums/190758914",
                        "id": "190758914",
                        "relationships": {
                            "artists": {
                                "data": [
                                    {
                                        "href": "/v1/catalog/us/artists/462006",
                                        "id": "462006",
                                        "type": "artists"
                                    }
                                ],
                                "href": "/v1/catalog/us/albums/190758914/artists"
                            },
                            "tracks": {
                                "data": [
                                    {
                                        "attributes": {
                                            "artistName": "Bob Dylan",
                                            "artwork": {
                                                "bgColor": "1b201a",
                                                "height": 1500,
                                                "textColor1": "f4ebd3",
                                                "textColor2": "d6b493",
                                                "textColor3": "c8c2ae",
                                                "textColor4": "b0967b",
                                                "url": "https://example.mzstatic.com/image/thumb/Music111/v4/b2/ae/08/b2ae0875-2495-4d23-6f13-a91516ebd384/source/{w}x{h}bb.jpeg",
                                                "width": 1500
                                            },
                                            "composerName": "B. Dylan",
                                            "discNumber": 1,
                                            "durationInMillis": 168757,
                                            "genreNames": [
                                                "Rock",
                                                "Music",
                                                "Singer/ Songwriter",
                                                "Singer/Songwriter",
                                                "Contemporary Folk"
                                            ],
                                            "isrc": "USSM19900534",
                                            "name": "Blowin' In the Wind",
                                            "playParams": {
                                                "id": "190758932",
                                                "kind": "song"
                                            },
                                            "previews": [
                                                {
                                                    "url": "https://example.itunes.apple.com/apple-assets-us-std-000001/Music/07/9d/bb/mzi.hyomnqmg.aac.p.m4a"
                                                }
                                            ],
                                            "releaseDate": "1963-05-27",
                                            "trackNumber": 1,
                                            "url": "https://itunes.apple.com/us/album/blowin-in-the-wind/190758914?i=190758932"
                                        },
                                        "href": "/v1/catalog/us/songs/190758932",
                                        "id": "190758932",
                                        "type": "songs"
                                    },
                                    {
                                        "attributes": {
                                            "artistName": "Bob Dylan",
                                            "artwork": {
                                                "bgColor": "1b201a",
                                                "height": 1500,
                                                "textColor1": "f4ebd3",
                                                "textColor2": "d6b493",
                                                "textColor3": "c8c2ae",
                                                "textColor4": "b0967b",
                                                "url": "https://example.mzstatic.com/image/thumb/Music111/v4/b2/ae/08/b2ae0875-2495-4d23-6f13-a91516ebd384/source/{w}x{h}bb.jpeg",
                                                "width": 1500
                                            },
                                            "composerName": "B. Dylan",
                                            "discNumber": 1,
                                            "durationInMillis": 203082,
                                            "genreNames": [
                                                "Rock",
                                                "Music",
                                                "Singer/ Songwriter",
                                                "Singer/Songwriter",
                                                "Contemporary Folk"
                                            ],
                                            "isrc": "USSM19922898",
                                            "name": "Girl from the North Country",
                                            "playParams": {
                                                "id": "190758937",
                                                "kind": "song"
                                            },
                                            "previews": [
                                                {
                                                    "url": "https://example.itunes.apple.com/apple-assets-us-std-000001/Music/ff/69/c3/mzi.vlkgldbf.aac.p.m4a"
                                                }
                                            ],
                                            "releaseDate": "1963-05-27",
                                            "trackNumber": 2,
                                            "url": "https://itunes.apple.com/us/album/girl-from-the-north-country/190758914?i=190758937"
                                        },
                                        "href": "/v1/catalog/us/songs/190758937",
                                        "id": "190758937",
                                        "type": "songs"
                                    },
                                    {
                                        "attributes": {
                                            "artistName": "Bob Dylan",
                                            "artwork": {
                                                "bgColor": "1b201a",
                                                "height": 1500,
                                                "textColor1": "f4ebd3",
                                                "textColor2": "d6b493",
                                                "textColor3": "c8c2ae",
                                                "textColor4": "b0967b",
                                                "url": "https://example.mzstatic.com/image/thumb/Music111/v4/b2/ae/08/b2ae0875-2495-4d23-6f13-a91516ebd384/source/{w}x{h}bb.jpeg",
                                                "width": 1500
                                            },
                                            "composerName": "B. Dylan",
                                            "discNumber": 1,
                                            "durationInMillis": 278100,
                                            "genreNames": [
                                                "Rock",
                                                "Music",
                                                "Singer/ Songwriter",
                                                "Singer/Songwriter",
                                                "Contemporary Folk"
                                            ],
                                            "isrc": "USSM19922899",
                                            "name": "Masters of War",
                                            "playParams": {
                                                "id": "190758945",
                                                "kind": "song"
                                            },
                                            "previews": [
                                                {
                                                    "url": "https://example.itunes.apple.com/apple-assets-us-std-000001/Music/d4/71/60/mzi.hnpotutb.aac.p.m4a"
                                                }
                                            ],
                                            "releaseDate": "1963-05-27",
                                            "trackNumber": 3,
                                            "url": "https://itunes.apple.com/us/album/masters-of-war/190758914?i=190758945"
                                        },
                                        "href": "/v1/catalog/us/songs/190758945",
                                        "id": "190758945",
                                        "type": "songs"
                                    },
                                    {
                                        "attributes": {
                                            "artistName": "Bob Dylan",
                                            "artwork": {
                                                "bgColor": "1b201a",
                                                "height": 1500,
                                                "textColor1": "f4ebd3",
                                                "textColor2": "d6b493",
                                                "textColor3": "c8c2ae",
                                                "textColor4": "b0967b",
                                                "url": "https://example.mzstatic.com/image/thumb/Music111/v4/b2/ae/08/b2ae0875-2495-4d23-6f13-a91516ebd384/source/{w}x{h}bb.jpeg",
                                                "width": 1500
                                            },
                                            "composerName": "Bob Dylan",
                                            "discNumber": 1,
                                            "durationInMillis": 212108,
                                            "genreNames": [
                                                "Rock",
                                                "Music",
                                                "Singer/ Songwriter",
                                                "Singer/Songwriter",
                                                "Contemporary Folk"
                                            ],
                                            "isrc": "USSM19922900",
                                            "name": "Down the Highway",
                                            "playParams": {
                                                "id": "190759004",
                                                "kind": "song"
                                            },
                                            "previews": [
                                                {
                                                    "url": "https://example.itunes.apple.com/apple-assets-us-std-000001/Music/6f/fb/c3/mzi.ljgwwjjb.aac.p.m4a"
                                                }
                                            ],
                                            "releaseDate": "1963-05-27",
                                            "trackNumber": 4,
                                            "url": "https://itunes.apple.com/us/album/down-the-highway/190758914?i=190759004"
                                        },
                                        "href": "/v1/catalog/us/songs/190759004",
                                        "id": "190759004",
                                        "type": "songs"
                                    },
                                    {
                                        "attributes": {
                                            "artistName": "Bob Dylan",
                                            "artwork": {
                                                "bgColor": "1b201a",
                                                "height": 1500,
                                                "textColor1": "f4ebd3",
                                                "textColor2": "d6b493",
                                                "textColor3": "c8c2ae",
                                                "textColor4": "b0967b",
                                                "url": "https://example.mzstatic.com/image/thumb/Music111/v4/b2/ae/08/b2ae0875-2495-4d23-6f13-a91516ebd384/source/{w}x{h}bb.jpeg",
                                                "width": 1500
                                            },
                                            "composerName": "Bob Dylan",
                                            "discNumber": 1,
                                            "durationInMillis": 148874,
                                            "genreNames": [
                                                "Rock",
                                                "Music",
                                                "Singer/ Songwriter",
                                                "Singer/Songwriter",
                                                "Contemporary Folk"
                                            ],
                                            "isrc": "USSM19922901",
                                            "name": "Bob Dylan's Blues",
                                            "playParams": {
                                                "id": "190759330",
                                                "kind": "song"
                                            },
                                            "previews": [
                                                {
                                                    "url": "https://example.itunes.apple.com/apple-assets-us-std-000001/Music/68/5a/33/mzi.hpsvjwbn.aac.p.m4a"
                                                }
                                            ],
                                            "releaseDate": "1963-05-27",
                                            "trackNumber": 5,
                                            "url": "https://itunes.apple.com/us/album/bob-dylans-blues/190758914?i=190759330"
                                        },
                                        "href": "/v1/catalog/us/songs/190759330",
                                        "id": "190759330",
                                        "type": "songs"
                                    },
                                    {
                                        "attributes": {
                                            "artistName": "Bob Dylan",
                                            "artwork": {
                                                "bgColor": "1b201a",
                                                "height": 1500,
                                                "textColor1": "f4ebd3",
                                                "textColor2": "d6b493",
                                                "textColor3": "c8c2ae",
                                                "textColor4": "b0967b",
                                                "url": "https://example.mzstatic.com/image/thumb/Music111/v4/b2/ae/08/b2ae0875-2495-4d23-6f13-a91516ebd384/source/{w}x{h}bb.jpeg",
                                                "width": 1500
                                            },
                                            "composerName": "Bob Dylan",
                                            "discNumber": 1,
                                            "durationInMillis": 412988,
                                            "genreNames": [
                                                "Rock",
                                                "Music",
                                                "Singer/ Songwriter",
                                                "Singer/Songwriter",
                                                "Contemporary Folk"
                                            ],
                                            "isrc": "USSM19922902",
                                            "name": "A Hard Rain's A-Gonna Fall",
                                            "playParams": {
                                                "id": "190759530",
                                                "kind": "song"
                                            },
                                            "previews": [
                                                {
                                                    "url": "https://example.itunes.apple.com/apple-assets-us-std-000001/Music/ed/9d/87/mzi.mtnkyaza.aac.p.m4a"
                                                }
                                            ],
                                            "releaseDate": "1963-05-27",
                                            "trackNumber": 6,
                                            "url": "https://itunes.apple.com/us/album/a-hard-rains-a-gonna-fall/190758914?i=190759530"
                                        },
                                        "href": "/v1/catalog/us/songs/190759530",
                                        "id": "190759530",
                                        "type": "songs"
                                    },
                                    {
                                        "attributes": {
                                            "artistName": "Bob Dylan",
                                            "artwork": {
                                                "bgColor": "1b201a",
                                                "height": 1500,
                                                "textColor1": "f4ebd3",
                                                "textColor2": "d6b493",
                                                "textColor3": "c8c2ae",
                                                "textColor4": "b0967b",
                                                "url": "https://example.mzstatic.com/image/thumb/Music111/v4/b2/ae/08/b2ae0875-2495-4d23-6f13-a91516ebd384/source/{w}x{h}bb.jpeg",
                                                "width": 1500
                                            },
                                            "composerName": "Bob Dylan",
                                            "discNumber": 1,
                                            "durationInMillis": 220888,
                                            "genreNames": [
                                                "Rock",
                                                "Music",
                                                "Singer/ Songwriter",
                                                "Singer/Songwriter",
                                                "Contemporary Folk"
                                            ],
                                            "isrc": "USSM19922903",
                                            "name": "Don't Think Twice, It's All Right",
                                            "playParams": {
                                                "id": "190759866",
                                                "kind": "song"
                                            },
                                            "previews": [
                                                {
                                                    "url": "https://example.itunes.apple.com/apple-assets-us-std-000001/Music/60/35/53/mzi.qtrnluly.aac.p.m4a"
                                                }
                                            ],
                                            "releaseDate": "1963-05-27",
                                            "trackNumber": 7,
                                            "url": "https://itunes.apple.com/us/album/dont-think-twice-its-all-right/190758914?i=190759866"
                                        },
                                        "href": "/v1/catalog/us/songs/190759866",
                                        "id": "190759866",
                                        "type": "songs"
                                    },
                                    {
                                        "attributes": {
                                            "artistName": "Bob Dylan",
                                            "artwork": {
                                                "bgColor": "1b201a",
                                                "height": 1500,
                                                "textColor1": "f4ebd3",
                                                "textColor2": "d6b493",
                                                "textColor3": "c8c2ae",
                                                "textColor4": "b0967b",
                                                "url": "https://example.mzstatic.com/image/thumb/Music111/v4/b2/ae/08/b2ae0875-2495-4d23-6f13-a91516ebd384/source/{w}x{h}bb.jpeg",
                                                "width": 1500
                                            },
                                            "composerName": "Bob Dylan",
                                            "discNumber": 1,
                                            "durationInMillis": 302600,
                                            "genreNames": [
                                                "Rock",
                                                "Music",
                                                "Singer/ Songwriter",
                                                "Singer/Songwriter",
                                                "Contemporary Folk"
                                            ],
                                            "isrc": "USSM19922904",
                                            "name": "Bob Dylan's Dream",
                                            "playParams": {
                                                "id": "190759897",
                                                "kind": "song"
                                            },
                                            "previews": [
                                                {
                                                    "url": "https://example.itunes.apple.com/apple-assets-us-std-000001/Music/9c/b1/6c/mzi.qeidmjvz.aac.p.m4a"
                                                }
                                            ],
                                            "releaseDate": "1963-05-27",
                                            "trackNumber": 8,
                                            "url": "https://itunes.apple.com/us/album/bob-dylans-dream/190758914?i=190759897"
                                        },
                                        "href": "/v1/catalog/us/songs/190759897",
                                        "id": "190759897",
                                        "type": "songs"
                                    },
                                    {
                                        "attributes": {
                                            "artistName": "Bob Dylan",
                                            "artwork": {
                                                "bgColor": "1b201a",
                                                "height": 1500,
                                                "textColor1": "f4ebd3",
                                                "textColor2": "d6b493",
                                                "textColor3": "c8c2ae",
                                                "textColor4": "b0967b",
                                                "url": "https://example.mzstatic.com/image/thumb/Music111/v4/b2/ae/08/b2ae0875-2495-4d23-6f13-a91516ebd384/source/{w}x{h}bb.jpeg",
                                                "width": 1500
                                            },
                                            "composerName": "Bob Dylan",
                                            "discNumber": 1,
                                            "durationInMillis": 110336,
                                            "genreNames": [
                                                "Rock",
                                                "Music",
                                                "Singer/ Songwriter",
                                                "Singer/Songwriter",
                                                "Contemporary Folk"
                                            ],
                                            "isrc": "USSM19922905",
                                            "name": "Oxford Town",
                                            "playParams": {
                                                "id": "190760759",
                                                "kind": "song"
                                            },
                                            "previews": [
                                                {
                                                    "url": "https://example.itunes.apple.com/apple-assets-us-std-000001/Music/83/9d/08/mzi.czdjaolv.aac.p.m4a"
                                                }
                                            ],
                                            "releaseDate": "1963-05-27",
                                            "trackNumber": 9,
                                            "url": "https://itunes.apple.com/us/album/oxford-town/190758914?i=190760759"
                                        },
                                        "href": "/v1/catalog/us/songs/190760759",
                                        "id": "190760759",
                                        "type": "songs"
                                    },
                                    {
                                        "attributes": {
                                            "artistName": "Bob Dylan",
                                            "artwork": {
                                                "bgColor": "1b201a",
                                                "height": 1500,
                                                "textColor1": "f4ebd3",
                                                "textColor2": "d6b493",
                                                "textColor3": "c8c2ae",
                                                "textColor4": "b0967b",
                                                "url": "https://example.mzstatic.com/image/thumb/Music111/v4/b2/ae/08/b2ae0875-2495-4d23-6f13-a91516ebd384/source/{w}x{h}bb.jpeg",
                                                "width": 1500
                                            },
                                            "composerName": "Bob Dylan",
                                            "discNumber": 1,
                                            "durationInMillis": 387464,
                                            "genreNames": [
                                                "Rock",
                                                "Music",
                                                "Singer/ Songwriter",
                                                "Singer/Songwriter",
                                                "Contemporary Folk"
                                            ],
                                            "isrc": "USSM19922906",
                                            "name": "Talkin' World War III Blues",
                                            "playParams": {
                                                "id": "190761023",
                                                "kind": "song"
                                            },
                                            "previews": [
                                                {
                                                    "url": "https://example.itunes.apple.com/apple-assets-us-std-000001/Music/68/d4/c3/mzi.hrnacrry.aac.p.m4a"
                                                }
                                            ],
                                            "releaseDate": "1963-05-27",
                                            "trackNumber": 10,
                                            "url": "https://itunes.apple.com/us/album/talkin-world-war-iii-blues/190758914?i=190761023"
                                        },
                                        "href": "/v1/catalog/us/songs/190761023",
                                        "id": "190761023",
                                        "type": "songs"
                                    },
                                    {
                                        "attributes": {
                                            "artistName": "Bob Dylan",
                                            "artwork": {
                                                "bgColor": "1b201a",
                                                "height": 1500,
                                                "textColor1": "f4ebd3",
                                                "textColor2": "d6b493",
                                                "textColor3": "c8c2ae",
                                                "textColor4": "b0967b",
                                                "url": "https://example.mzstatic.com/image/thumb/Music111/v4/b2/ae/08/b2ae0875-2495-4d23-6f13-a91516ebd384/source/{w}x{h}bb.jpeg",
                                                "width": 1500
                                            },
                                            "composerName": "B. Dylan",
                                            "discNumber": 1,
                                            "durationInMillis": 164032,
                                            "genreNames": [
                                                "Rock",
                                                "Music",
                                                "Singer/ Songwriter",
                                                "Singer/Songwriter",
                                                "Contemporary Folk"
                                            ],
                                            "isrc": "USSM19922907",
                                            "name": "Corrina, Corrina",
                                            "playParams": {
                                                "id": "190761041",
                                                "kind": "song"
                                            },
                                            "previews": [
                                                {
                                                    "url": "https://example.itunes.apple.com/apple-assets-us-std-000001/Music/66/8c/c7/mzi.ugltaegg.aac.p.m4a"
                                                }
                                            ],
                                            "releaseDate": "1962-01-01",
                                            "trackNumber": 11,
                                            "url": "https://itunes.apple.com/us/album/corrina-corrina/190758914?i=190761041"
                                        },
                                        "href": "/v1/catalog/us/songs/190761041",
                                        "id": "190761041",
                                        "type": "songs"
                                    },
                                    {
                                        "attributes": {
                                            "artistName": "Bob Dylan",
                                            "artwork": {
                                                "bgColor": "1b201a",
                                                "height": 1500,
                                                "textColor1": "f4ebd3",
                                                "textColor2": "d6b493",
                                                "textColor3": "c8c2ae",
                                                "textColor4": "b0967b",
                                                "url": "https://example.mzstatic.com/image/thumb/Music111/v4/b2/ae/08/b2ae0875-2495-4d23-6f13-a91516ebd384/source/{w}x{h}bb.jpeg",
                                                "width": 1500
                                            },
                                            "composerName": "Bob Dylan",
                                            "discNumber": 1,
                                            "durationInMillis": 120843,
                                            "genreNames": [
                                                "Rock",
                                                "Music",
                                                "Singer/ Songwriter",
                                                "Singer/Songwriter",
                                                "Contemporary Folk"
                                            ],
                                            "isrc": "USSM19929601",
                                            "name": "Honey, Just Allow Me One More Chance",
                                            "playParams": {
                                                "id": "190761184",
                                                "kind": "song"
                                            },
                                            "previews": [
                                                {
                                                    "url": "https://example.itunes.apple.com/apple-assets-us-std-000001/Music/e1/11/8d/mzi.ykbcgnwk.aac.p.m4a"
                                                }
                                            ],
                                            "releaseDate": "1963-05-27",
                                            "trackNumber": 12,
                                            "url": "https://itunes.apple.com/us/album/honey-just-allow-me-one-more-chance/190758914?i=190761184"
                                        },
                                        "href": "/v1/catalog/us/songs/190761184",
                                        "id": "190761184",
                                        "type": "songs"
                                    },
                                    {
                                        "attributes": {
                                            "artistName": "Bob Dylan",
                                            "artwork": {
                                                "bgColor": "1b201a",
                                                "height": 1500,
                                                "textColor1": "f4ebd3",
                                                "textColor2": "d6b493",
                                                "textColor3": "c8c2ae",
                                                "textColor4": "b0967b",
                                                "url": "https://example.mzstatic.com/image/thumb/Music111/v4/b2/ae/08/b2ae0875-2495-4d23-6f13-a91516ebd384/source/{w}x{h}bb.jpeg",
                                                "width": 1500
                                            },
                                            "composerName": "Bob Dylan",
                                            "discNumber": 1,
                                            "durationInMillis": 286757,
                                            "genreNames": [
                                                "Rock",
                                                "Music",
                                                "Singer/ Songwriter",
                                                "Singer/Songwriter",
                                                "Contemporary Folk"
                                            ],
                                            "isrc": "USSM19922908",
                                            "name": "I Shall Be Free",
                                            "playParams": {
                                                "id": "190761224",
                                                "kind": "song"
                                            },
                                            "previews": [
                                                {
                                                    "url": "https://example.itunes.apple.com/apple-assets-us-std-000001/Music/27/4e/4a/mzi.eahpaavs.aac.p.m4a"
                                                }
                                            ],
                                            "releaseDate": "1963-05-27",
                                            "trackNumber": 13,
                                            "url": "https://itunes.apple.com/us/album/i-shall-be-free/190758914?i=190761224"
                                        },
                                        "href": "/v1/catalog/us/songs/190761224",
                                        "id": "190761224",
                                        "type": "songs"
                                    }
                                ],
                                "href": "/v1/catalog/us/albums/190758914/tracks"
                            }
                        },
                        "type": "albums"
                    }
                ]
            }
        """)

let libraryAlbumJSON =
    JSON.init(parseJSON:
        """
        {
            "attributes": {
                "artistName": "Lana Del Rey",
                "artwork": {
                    "height": 1200,
                    "url": "https://example.mzstatic.com/image/thumb/Music2/v4/54/d5/76/54d5765e-8bc2-af71-483e-5a5fb5597c61/UMG_cvrart_00602537865659_01_RGB72_1500x1500_14UMGIM20562.jpeg/{w}x{h}bb.jpeg",
                    "width": 1200
                },
                "name": "Ultraviolence (Deluxe)",
                "playParams": {
                    "id": "l.424stuk",
                    "isLibrary": true,
                    "kind": "album"
                },
                "trackCount": 15
            },
            "href": "/v1/me/library/albums/l.424stuk",
            "id": "l.424stuk",
            "relationships": {
                "tracks": {
                    "data": [
                        {
                            "attributes": {
                                "artistName": "Lana Del Rey",
                                "artwork": {
                                    "height": 1200,
                                    "url": "https://example.mzstatic.com/image/thumb/Music2/v4/54/d5/76/54d5765e-8bc2-af71-483e-5a5fb5597c61/UMG_cvrart_00602537865659_01_RGB72_1500x1500_14UMGIM20562.jpeg/{w}x{h}bb.jpeg",
                                    "width": 1200
                                },
                                "contentRating": "explicit",
                                "name": "Cruel World",
                                "playParams": {
                                    "id": "i.vMX1Q84HKQWRAd",
                                    "isLibrary": true,
                                    "kind": "song"
                                },
                                "trackNumber": 1
                            },
                            "href": "/v1/me/library/songs/i.vMX1Q84HKQWRAd",
                            "id": "i.vMX1Q84HKQWRAd",
                            "type": "library-songs"
                        },
                        {
                            "attributes": {
                                "artistName": "Lana Del Rey",
                                "artwork": {
                                    "height": 1200,
                                    "url": "https://example.mzstatic.com/image/thumb/Music2/v4/54/d5/76/54d5765e-8bc2-af71-483e-5a5fb5597c61/UMG_cvrart_00602537865659_01_RGB72_1500x1500_14UMGIM20562.jpeg/{w}x{h}bb.jpeg",
                                    "width": 1200
                                },
                                "name": "Ultraviolence",
                                "playParams": {
                                    "id": "i.xrXvOJqtv0VrNA",
                                    "isLibrary": true,
                                    "kind": "song"
                                },
                                "trackNumber": 2
                            },
                            "href": "/v1/me/library/songs/i.xrXvOJqtv0VrNA",
                            "id": "i.xrXvOJqtv0VrNA",
                            "type": "library-songs"
                        },
                        {
                            "attributes": {
                                "artistName": "Lana Del Rey",
                                "artwork": {
                                    "height": 1200,
                                    "url": "https://example.mzstatic.com/image/thumb/Music2/v4/54/d5/76/54d5765e-8bc2-af71-483e-5a5fb5597c61/UMG_cvrart_00602537865659_01_RGB72_1500x1500_14UMGIM20562.jpeg/{w}x{h}bb.jpeg",
                                    "width": 1200
                                },
                                "name": "Shades of Cool",
                                "playParams": {
                                    "id": "i.06QNrp4fYre61O",
                                    "isLibrary": true,
                                    "kind": "song"
                                },
                                "trackNumber": 3
                            },
                            "href": "/v1/me/library/songs/i.06QNrp4fYre61O",
                            "id": "i.06QNrp4fYre61O",
                            "type": "library-songs"
                        },
                        {
                            "attributes": {
                                "artistName": "Lana Del Rey",
                                "artwork": {
                                    "height": 1200,
                                    "url": "https://example.mzstatic.com/image/thumb/Music2/v4/54/d5/76/54d5765e-8bc2-af71-483e-5a5fb5597c61/UMG_cvrart_00602537865659_01_RGB72_1500x1500_14UMGIM20562.jpeg/{w}x{h}bb.jpeg",
                                    "width": 1200
                                },
                                "contentRating": "explicit",
                                "name": "Brooklyn Baby",
                                "playParams": {
                                    "id": "i.aJGY5ZASJpbdVX",
                                    "isLibrary": true,
                                    "kind": "song"
                                },
                                "trackNumber": 4
                            },
                            "href": "/v1/me/library/songs/i.aJGY5ZASJpbdVX",
                            "id": "i.aJGY5ZASJpbdVX",
                            "type": "library-songs"
                        },
                        {
                            "attributes": {
                                "artistName": "Lana Del Rey",
                                "name": "West Coast",
                                "playParams": {
                                    "id": "i.9oJN4kBTVdpgxJ",
                                    "isLibrary": true,
                                    "kind": "song"
                                },
                                "trackNumber": 5
                            },
                            "href": "/v1/me/library/songs/i.9oJN4kBTVdpgxJ",
                            "id": "i.9oJN4kBTVdpgxJ",
                            "type": "library-songs"
                        },
                        {
                            "attributes": {
                                "artistName": "Lana Del Rey",
                                "name": "Sad Girl",
                                "playParams": {
                                    "id": "i.NJv0R29fEaLK51",
                                    "isLibrary": true,
                                    "kind": "song"
                                },
                                "trackNumber": 6
                            },
                            "href": "/v1/me/library/songs/i.NJv0R29fEaLK51",
                            "id": "i.NJv0R29fEaLK51",
                            "type": "library-songs"
                        },
                        {
                            "attributes": {
                                "artistName": "Lana Del Rey",
                                "artwork": {
                                    "height": 1200,
                                    "url": "https://example.mzstatic.com/image/thumb/Music2/v4/54/d5/76/54d5765e-8bc2-af71-483e-5a5fb5597c61/UMG_cvrart_00602537865659_01_RGB72_1500x1500_14UMGIM20562.jpeg/{w}x{h}bb.jpeg",
                                    "width": 1200
                                },
                                "contentRating": "explicit",
                                "name": "Pretty When You Cry",
                                "playParams": {
                                    "id": "i.dlvq6XJFPLaemG",
                                    "isLibrary": true,
                                    "kind": "song"
                                },
                                "trackNumber": 7
                            },
                            "href": "/v1/me/library/songs/i.dlvq6XJFPLaemG",
                            "id": "i.dlvq6XJFPLaemG",
                            "type": "library-songs"
                        },
                        {
                            "attributes": {
                                "artistName": "Lana Del Rey",
                                "artwork": {
                                    "height": 1200,
                                    "url": "https://example.mzstatic.com/image/thumb/Music2/v4/54/d5/76/54d5765e-8bc2-af71-483e-5a5fb5597c61/UMG_cvrart_00602537865659_01_RGB72_1500x1500_14UMGIM20562.jpeg/{w}x{h}bb.jpeg",
                                    "width": 1200
                                },
                                "name": "Money Power Glory",
                                "playParams": {
                                    "id": "i.EYVb0qQIB7WZbe",
                                    "isLibrary": true,
                                    "kind": "song"
                                },
                                "trackNumber": 8
                            },
                            "href": "/v1/me/library/songs/i.EYVb0qQIB7WZbe",
                            "id": "i.EYVb0qQIB7WZbe",
                            "type": "library-songs"
                        },
                        {
                            "attributes": {
                                "artistName": "Lana Del Rey",
                                "artwork": {
                                    "height": 1200,
                                    "url": "https://example.mzstatic.com/image/thumb/Music2/v4/54/d5/76/54d5765e-8bc2-af71-483e-5a5fb5597c61/UMG_cvrart_00602537865659_01_RGB72_1500x1500_14UMGIM20562.jpeg/{w}x{h}bb.jpeg",
                                    "width": 1200
                                },
                                "contentRating": "explicit",
                                "name": "Fucked My Way Up To the Top",
                                "playParams": {
                                    "id": "i.7PJNQvWUXlD68R",
                                    "isLibrary": true,
                                    "kind": "song"
                                },
                                "trackNumber": 9
                            },
                            "href": "/v1/me/library/songs/i.7PJNQvWUXlD68R",
                            "id": "i.7PJNQvWUXlD68R",
                            "type": "library-songs"
                        },
                        {
                            "attributes": {
                                "artistName": "Lana Del Rey",
                                "artwork": {
                                    "height": 1200,
                                    "url": "https://example.mzstatic.com/image/thumb/Music2/v4/54/d5/76/54d5765e-8bc2-af71-483e-5a5fb5597c61/UMG_cvrart_00602537865659_01_RGB72_1500x1500_14UMGIM20562.jpeg/{w}x{h}bb.jpeg",
                                    "width": 1200
                                },
                                "name": "Old Money",
                                "playParams": {
                                    "id": "i.rXzZrMEtEVP8g3",
                                    "isLibrary": true,
                                    "kind": "song"
                                },
                                "trackNumber": 10
                            },
                            "href": "/v1/me/library/songs/i.rXzZrMEtEVP8g3",
                            "id": "i.rXzZrMEtEVP8g3",
                            "type": "library-songs"
                        },
                        {
                            "attributes": {
                                "artistName": "Lana Del Rey",
                                "artwork": {
                                    "height": 1200,
                                    "url": "https://example.mzstatic.com/image/thumb/Music2/v4/54/d5/76/54d5765e-8bc2-af71-483e-5a5fb5597c61/UMG_cvrart_00602537865659_01_RGB72_1500x1500_14UMGIM20562.jpeg/{w}x{h}bb.jpeg",
                                    "width": 1200
                                },
                                "name": "The Other Woman",
                                "playParams": {
                                    "id": "i.vMX1Q24IKQWRAd",
                                    "isLibrary": true,
                                    "kind": "song"
                                },
                                "trackNumber": 11
                            },
                            "href": "/v1/me/library/songs/i.vMX1Q24IKQWRAd",
                            "id": "i.vMX1Q24IKQWRAd",
                            "type": "library-songs"
                        },
                        {
                            "attributes": {
                                "artistName": "Lana Del Rey",
                                "artwork": {
                                    "height": 1200,
                                    "url": "https://example.mzstatic.com/image/thumb/Music2/v4/54/d5/76/54d5765e-8bc2-af71-483e-5a5fb5597c61/UMG_cvrart_00602537865659_01_RGB72_1500x1500_14UMGIM20562.jpeg/{w}x{h}bb.jpeg",
                                    "width": 1200
                                },
                                "name": "Black Beauty",
                                "playParams": {
                                    "id": "i.xrXvO5vFv0VrNA",
                                    "isLibrary": true,
                                    "kind": "song"
                                },
                                "trackNumber": 12
                            },
                            "href": "/v1/me/library/songs/i.xrXvO5vFv0VrNA",
                            "id": "i.xrXvO5vFv0VrNA",
                            "type": "library-songs"
                        },
                        {
                            "attributes": {
                                "artistName": "Lana Del Rey",
                                "name": "Guns and Roses",
                                "playParams": {
                                    "id": "i.06QNrdXfYre61O",
                                    "isLibrary": true,
                                    "kind": "song"
                                },
                                "trackNumber": 13
                            },
                            "href": "/v1/me/library/songs/i.06QNrdXfYre61O",
                            "id": "i.06QNrdXfYre61O",
                            "type": "library-songs"
                        },
                        {
                            "attributes": {
                                "artistName": "Lana Del Rey",
                                "artwork": {
                                    "height": 1200,
                                    "url": "https://example.mzstatic.com/image/thumb/Music2/v4/54/d5/76/54d5765e-8bc2-af71-483e-5a5fb5597c61/UMG_cvrart_00602537865659_01_RGB72_1500x1500_14UMGIM20562.jpeg/{w}x{h}bb.jpeg",
                                    "width": 1200
                                },
                                "name": "Florida Kilos",
                                "playParams": {
                                    "id": "i.aJGY5oPfJpbdVX",
                                    "isLibrary": true,
                                    "kind": "song"
                                },
                                "trackNumber": 14
                            },
                            "href": "/v1/me/library/songs/i.aJGY5oPfJpbdVX",
                            "id": "i.aJGY5oPfJpbdVX",
                            "type": "library-songs"
                        },
                        {
                            "attributes": {
                                "artistName": "Lana Del Rey",
                                "artwork": {
                                    "height": 1200,
                                    "url": "https://example.mzstatic.com/image/thumb/Music2/v4/54/d5/76/54d5765e-8bc2-af71-483e-5a5fb5597c61/UMG_cvrart_00602537865659_01_RGB72_1500x1500_14UMGIM20562.jpeg/{w}x{h}bb.jpeg",
                                    "width": 1200
                                },
                                "contentRating": "explicit",
                                "name": "Is This Happiness",
                                "playParams": {
                                    "id": "i.9oJN4Z2FVdpgxJ",
                                    "isLibrary": true,
                                    "kind": "song"
                                },
                                "trackNumber": 15
                            },
                            "href": "/v1/me/library/songs/i.9oJN4Z2FVdpgxJ",
                            "id": "i.9oJN4Z2FVdpgxJ",
                            "type": "library-songs"
                        }
                    ],
                    "href": "/v1/me/library/albums/l.424stuk/tracks"
                }
            },
            "type": "library-albums"
        }
    """)

let multipleLibraryAlbumsJSON =
JSON.init(parseJSON:
    """
        {
            "data": [
                {
                    "attributes": {
                        "artistName": "Lana Del Rey",
                        "artwork": {
                            "height": 1200,
                            "url": "https://example.mzstatic.com/image/thumb/Music2/v4/54/d5/76/54d5765e-8bc2-af71-483e-5a5fb5597c61/UMG_cvrart_00602537865659_01_RGB72_1500x1500_14UMGIM20562.jpeg/{w}x{h}bb.jpeg",
                            "width": 1200
                        },
                        "name": "Ultraviolence (Deluxe)",
                        "playParams": {
                            "id": "l.424stuk",
                            "isLibrary": true,
                            "kind": "album"
                        },
                        "trackCount": 0
                    },
                    "href": "/v1/me/library/albums/l.424stuk",
                    "id": "l.424stuk",
                    "type": "library-albums"
                },
                {
                    "attributes": {
                        "artistName": "Sam Smith",
                        "artwork": {
                            "height": 1200,
                            "url": "https://example.mzstatic.com/image/thumb/Music4/v4/e7/55/fa/e755fa2b-01c4-3c6d-1788-fa15ba1eabe8/UMG_cvrart_00602537780211_01_RGB72_1500x1500_13UAEIM58958.jpeg/{w}x{h}bb.jpeg",
                            "width": 1200
                        },
                        "name": "In the Lonely Hour (Deluxe Version)",
                        "playParams": {
                            "id": "l.JWErW12",
                            "isLibrary": true,
                            "kind": "album"
                        },
                        "trackCount": 0
                    },
                    "href": "/v1/me/library/albums/l.JWErW12",
                    "id": "l.JWErW12",
                    "type": "library-albums"
                }
            ]
        }
    """)

let allLibraryAlbumsJSON =
JSON.init(parseJSON:
    """
        {
            "data": [
                {
                    "attributes": {
                        "artistName": "Bruce Springsteen",
                        "artwork": {
                            "height": 1200,
                            "url": "https://example.mzstatic.com/image/thumb/Music7/v4/d7/d4/4c/d7d44c9a-fb71-4ba4-1bf6-3beeb179f03f/dj.fogkvpds.jpeg/{w}x{h}bb.jpeg",
                            "width": 1200
                        },
                        "name": "Born in the U.S.A.",
                        "playParams": {
                            "id": "l.rE2SnBs",
                            "isLibrary": true,
                            "kind": "album"
                        },
                        "trackCount": 0
                    },
                    "href": "/v1/me/library/albums/l.rE2SnBs",
                    "id": "l.rE2SnBs",
                    "type": "library-albums"
                },
                {
                    "attributes": {
                        "artistName": "Bob Dylan",
                        "artwork": {
                            "height": 1200,
                            "url": "https://example.mzstatic.com/image/thumb/Music/08/dc/91/mzi.cscwtxfp.jpeg/{w}x{h}bb.jpeg",
                            "width": 1200
                        },
                        "name": "Highway 61 Revisited",
                        "playParams": {
                            "id": "l.7znhNGs",
                            "isLibrary": true,
                            "kind": "album"
                        },
                        "trackCount": 0
                    },
                    "href": "/v1/me/library/albums/l.7znhNGs",
                    "id": "l.7znhNGs",
                    "type": "library-albums"
                },
                {
                    "attributes": {
                        "artistName": "Sam Smith",
                        "artwork": {
                            "height": 1200,
                            "url": "https://example.mzstatic.com/image/thumb/Music4/v4/e7/55/fa/e755fa2b-01c4-3c6d-1788-fa15ba1eabe8/UMG_cvrart_00602537780211_01_RGB72_1500x1500_13UAEIM58958.jpeg/{w}x{h}bb.jpeg",
                            "width": 1200
                        },
                        "name": "In the Lonely Hour (Deluxe Version)",
                        "playParams": {
                            "id": "l.JWErW12",
                            "isLibrary": true,
                            "kind": "album"
                        },
                        "trackCount": 0
                    },
                    "href": "/v1/me/library/albums/l.JWErW12",
                    "id": "l.JWErW12",
                    "type": "library-albums"
                },
                {
                    "attributes": {
                        "artistName": "Michael de Jong",
                        "artwork": {
                            "height": 1200,
                            "url": "https://example.mzstatic.com/image/thumb/Music/v4/3c/63/27/3c6327f3-8c69-98af-415c-aef50fa6a3b9/MDJ_2014_V02.jpeg/{w}x{h}bb.jpeg",
                            "width": 1200
                        },
                        "name": "Something For the Pain",
                        "playParams": {
                            "id": "l.s8iCzXa",
                            "isLibrary": true,
                            "kind": "album"
                        },
                        "trackCount": 0
                    },
                    "href": "/v1/me/library/albums/l.s8iCzXa",
                    "id": "l.s8iCzXa",
                    "type": "library-albums"
                },
                {
                    "attributes": {
                        "artistName": "Lana Del Rey",
                        "artwork": {
                            "height": 1200,
                            "url": "https://example.mzstatic.com/image/thumb/Music2/v4/54/d5/76/54d5765e-8bc2-af71-483e-5a5fb5597c61/UMG_cvrart_00602537865659_01_RGB72_1500x1500_14UMGIM20562.jpeg/{w}x{h}bb.jpeg",
                            "width": 1200
                        },
                        "name": "Ultraviolence (Deluxe)",
                        "playParams": {
                            "id": "l.424stuk",
                            "isLibrary": true,
                            "kind": "album"
                        },
                        "trackCount": 0
                    },
                    "href": "/v1/me/library/albums/l.424stuk",
                    "id": "l.424stuk",
                    "type": "library-albums"
                },
                {
                    "attributes": {
                        "artistName": "Ukraine National Symphony Orchestra",
                        "artwork": {
                            "height": 1200,
                            "url": "https://example.mzstatic.com/image/thumb/Features/f5/33/e1/dj.aomjdzqh.jpeg/{w}x{h}bb.jpeg",
                            "width": 1200
                        },
                        "name": "The Very Best of Tchaikovsky",
                        "playParams": {
                            "id": "l.Zll9glr",
                            "isLibrary": true,
                            "kind": "album"
                        },
                        "trackCount": 0
                    },
                    "href": "/v1/me/library/albums/l.Zll9glr",
                    "id": "l.Zll9glr",
                    "type": "library-albums"
                },
                {
                    "attributes": {
                        "artistName": "Katy Perry",
                        "artwork": {
                            "height": 1200,
                            "url": "https://example.mzstatic.com/image/thumb/Music127/v4/85/cc/1c/85cc1c0a-cef2-d81b-6394-d556c61a0bef/UMG_cvrart_00602557675559_01_RGB72_1800x1800_17UMGIM99424.jpeg/{w}x{h}bb.jpeg",
                            "width": 1200
                        },
                        "name": "Witness",
                        "playParams": {
                            "id": "l.XlUb5Ja",
                            "isLibrary": true,
                            "kind": "album"
                        },
                        "trackCount": 0
                    },
                    "href": "/v1/me/library/albums/l.XlUb5Ja",
                    "id": "l.XlUb5Ja",
                    "type": "library-albums"
                },
                {
                    "attributes": {
                        "artistName": "Ed Sheeran",
                        "name": "x (Deluxe Edition)",
                        "playParams": {
                            "id": "l.k7Rwaou",
                            "isLibrary": true,
                            "kind": "album"
                        },
                        "trackCount": 0
                    },
                    "href": "/v1/me/library/albums/l.k7Rwaou",
                    "id": "l.k7Rwaou",
                    "type": "library-albums"
                }
            ]
        }
    """)

let catalogPlaylistJSON =
    JSON.init(parseJSON:
        """
        {
            "attributes": {
                "artwork": {
                    "bgColor": "161d16",
                    "height": 1080,
                    "isMosaic": true,
                    "textColor1": "ffffff",
                    "textColor2": "e3aa71",
                    "textColor3": "d0d1d0",
                    "textColor4": "ba8e5f",
                    "url": "https://example.mzstatic.com/image/thumb/Features71/v4/49/f0/f6/49f0f636-cefe-0fba-a6a1-01321374e768/source/{w}x{h}cc.jpeg",
                    "width": 4320
                },
                "curatorName": "Apple Music R&B",
                "description": {
                    "short": "The songs that cemented her iconic status.",
                    "standard": "Few female artists have reached the top of the charts as frequently as Janet Jackson. We've assembled all of her number one hits for a chart-topping collection which confirms her status as the true Queen of pop-R&B."
                },
                "lastModifiedDate": "2015-04-11T16:15:51Z",
                "name": "Janet Jackson: No.1 Songs",
                "playParams": {
                    "id": "pl.acc464c750b94302b8806e5fcbe56e17",
                    "kind": "playlist"
                },
                "playlistType": "editorial",
                "url": "https://itunes.apple.com/us/playlist/janet-jackson-no-1-songs/pl.acc464c750b94302b8806e5fcbe56e17"
            },
            "href": "/v1/catalog/us/playlists/pl.acc464c750b94302b8806e5fcbe56e17",
            "id": "pl.acc464c750b94302b8806e5fcbe56e17",
            "relationships": {
                "curator": {
                    "data": [
                        {
                            "href": "/v1/catalog/us/apple-curators/976439551",
                            "id": "976439551",
                            "type": "apple-curators"
                        }
                    ],
                    "href": "/v1/catalog/us/playlists/pl.acc464c750b94302b8806e5fcbe56e17/curator"
                },
                "tracks": {
                    "data": [
                        {
                            "attributes": {
                                "artistName": "Janet Jackson",
                                "artwork": {
                                    "bgColor": "9c3526",
                                    "height": 1404,
                                    "textColor1": "ffffe5",
                                    "textColor2": "ffc79f",
                                    "textColor3": "ebd6be",
                                    "textColor4": "eba986",
                                    "url": "https://example.mzstatic.com/image/thumb/Music4/v4/77/50/11/7750111a-af31-7dc1-4f2f-e1cc855f394d/source/{w}x{h}bb.jpeg",
                                    "width": 1404
                                },
                                "discNumber": 1,
                                "durationInMillis": 301200,
                                "genreNames": [
                                    "Rock",
                                    "Music",
                                    "R&B/Soul",
                                    "Contemporary R&B",
                                    "Pop",
                                    "Adult Contemporary",
                                    "Dance",
                                    "Electronic"
                                ],
                                "isrc": "USVI29700014",
                                "name": "Together Again",
                                "playParams": {
                                    "id": "723390870",
                                    "kind": "song"
                                },
                                "previews": [
                                    {
                                        "url": "https://example.itunes.apple.com/apple-assets-us-std-000001/Music7/v4/31/db/d5/31dbd582-cf23-08f5-1394-c28316f0cde2/mzaf_2035383873021370206.plus.aac.p.m4a"
                                    }
                                ],
                                "releaseDate": "1997-10-07",
                                "trackNumber": 11,
                                "url": "https://itunes.apple.com/us/album/together-again/723390477?i=723390870"
                            },
                            "href": "/v1/catalog/us/songs/723390870",
                            "id": "723390870",
                            "type": "songs"
                        },
                        {
                            "attributes": {
                                "artistName": "Janet Jackson",
                                "artwork": {
                                    "bgColor": "ffffff",
                                    "height": 1404,
                                    "textColor1": "050404",
                                    "textColor2": "452c22",
                                    "textColor3": "373636",
                                    "textColor4": "6a564e",
                                    "url": "https://example.mzstatic.com/image/thumb/Music/v4/30/75/33/30753397-86e8-5b3a-e48b-85fb785c4124/source/{w}x{h}bb.jpeg",
                                    "width": 1404
                                },
                                "discNumber": 1,
                                "durationInMillis": 330027,
                                "genreNames": [
                                    "Pop",
                                    "Music",
                                    "Rock",
                                    "Electronic",
                                    "R&B/Soul",
                                    "Contemporary R&B",
                                    "Adult Contemporary",
                                    "Dance",
                                    "Pop/Rock"
                                ],
                                "isrc": "USVI20100057",
                                "name": "All for You",
                                "playParams": {
                                    "id": "724885384",
                                    "kind": "song"
                                },
                                "previews": [
                                    {
                                        "url": "https://example.itunes.apple.com/apple-assets-us-std-000001/Music2/v4/69/03/c1/6903c1d7-32c9-85cd-d301-5d4bb4e07125/mzaf_4441152766436868823.plus.aac.p.m4a"
                                    }
                                ],
                                "releaseDate": "2001-03-13",
                                "trackNumber": 3,
                                "url": "https://itunes.apple.com/us/album/all-for-you/724885014?i=724885384"
                            },
                            "href": "/v1/catalog/us/songs/724885384",
                            "id": "724885384",
                            "type": "songs"
                        },
                        {
                            "attributes": {
                                "artistName": "Janet Jackson",
                                "artwork": {
                                    "bgColor": "ffffff",
                                    "height": 1404,
                                    "textColor1": "050404",
                                    "textColor2": "452c22",
                                    "textColor3": "373636",
                                    "textColor4": "6a564e",
                                    "url": "https://example.mzstatic.com/image/thumb/Music/v4/30/75/33/30753397-86e8-5b3a-e48b-85fb785c4124/source/{w}x{h}bb.jpeg",
                                    "width": 1404
                                },
                                "discNumber": 1,
                                "durationInMillis": 264973,
                                "genreNames": [
                                    "Pop",
                                    "Music",
                                    "Rock",
                                    "Electronic",
                                    "R&B/Soul",
                                    "Contemporary R&B",
                                    "Adult Contemporary",
                                    "Dance",
                                    "Pop/Rock"
                                ],
                                "isrc": "USVI20100098",
                                "name": "Doesn't Really Matter",
                                "playParams": {
                                    "id": "724885790",
                                    "kind": "song"
                                },
                                "previews": [
                                    {
                                        "url": "https://example.itunes.apple.com/apple-assets-us-std-000001/Music1/v4/25/51/98/255198f2-02d9-0d8a-183f-9cacee118b2e/mzaf_1901656142812658216.plus.aac.p.m4a"
                                    }
                                ],
                                "releaseDate": "2001-04-24",
                                "trackNumber": 17,
                                "url": "https://itunes.apple.com/us/album/doesnt-really-matter/724885014?i=724885790"
                            },
                            "href": "/v1/catalog/us/songs/724885790",
                            "id": "724885790",
                            "type": "songs"
                        }
                    ],
                    "href": "/v1/catalog/us/playlists/pl.acc464c750b94302b8806e5fcbe56e17/tracks"
                }
            },
            "type": "playlists"
        }
    """)

let multipleCatalogPlaylistsJSON =
    JSON.init(parseJSON:
        """
            {
                "data": [
                    {
                        "attributes": {
                            "artwork": {
                                "bgColor": "161d16",
                                "height": 1080,
                                "isMosaic": true,
                                "textColor1": "ffffff",
                                "textColor2": "e3aa71",
                                "textColor3": "d0d1d0",
                                "textColor4": "ba8e5f",
                                "url": "https://example.mzstatic.com/image/thumb/Features71/v4/49/f0/f6/49f0f636-cefe-0fba-a6a1-01321374e768/source/{w}x{h}cc.jpeg",
                                "width": 4320
                            },
                            "curatorName": "Apple Music R&B",
                            "description": {
                                "short": "The songs that cemented her iconic status.",
                                "standard": "Few female artists have reached the top of the charts as frequently as Janet Jackson. We've assembled all of her number one hits for a chart-topping collection which confirms her status as the true Queen of pop-R&B."
                            },
                            "lastModifiedDate": "2015-04-11T16:15:51Z",
                            "name": "Janet Jackson: No.1 Songs",
                            "playParams": {
                                "id": "pl.acc464c750b94302b8806e5fcbe56e17",
                                "kind": "playlist"
                            },
                            "playlistType": "editorial",
                            "url": "https://itunes.apple.com/us/playlist/janet-jackson-no-1-songs/pl.acc464c750b94302b8806e5fcbe56e17"
                        },
                        "href": "/v1/catalog/us/playlists/pl.acc464c750b94302b8806e5fcbe56e17",
                        "id": "pl.acc464c750b94302b8806e5fcbe56e17",
                        "relationships": {
                            "curator": {
                                "data": [
                                    {
                                        "href": "/v1/catalog/us/apple-curators/976439551",
                                        "id": "976439551",
                                        "type": "apple-curators"
                                    }
                                ],
                                "href": "/v1/catalog/us/playlists/pl.acc464c750b94302b8806e5fcbe56e17/curator"
                            },
                            "tracks": {
                                "data": [
                                    {
                                        "attributes": {
                                            "artistName": "Janet Jackson",
                                            "artwork": {
                                                "bgColor": "9c3526",
                                                "height": 1404,
                                                "textColor1": "ffffe5",
                                                "textColor2": "ffc79f",
                                                "textColor3": "ebd6be",
                                                "textColor4": "eba986",
                                                "url": "https://example.mzstatic.com/image/thumb/Music4/v4/77/50/11/7750111a-af31-7dc1-4f2f-e1cc855f394d/source/{w}x{h}bb.jpeg",
                                                "width": 1404
                                            },
                                            "discNumber": 1,
                                            "durationInMillis": 301200,
                                            "genreNames": [
                                                "Rock",
                                                "Music",
                                                "R&B/Soul",
                                                "Contemporary R&B",
                                                "Pop",
                                                "Adult Contemporary",
                                                "Dance",
                                                "Electronic"
                                            ],
                                            "isrc": "USVI29700014",
                                            "name": "Together Again",
                                            "playParams": {
                                                "id": "723390870",
                                                "kind": "song"
                                            },
                                            "previews": [
                                                {
                                                    "url": "https://example.itunes.apple.com/apple-assets-us-std-000001/Music7/v4/31/db/d5/31dbd582-cf23-08f5-1394-c28316f0cde2/mzaf_2035383873021370206.plus.aac.p.m4a"
                                                }
                                            ],
                                            "releaseDate": "1997-10-07",
                                            "trackNumber": 11,
                                            "url": "https://itunes.apple.com/us/album/together-again/723390477?i=723390870"
                                        },
                                        "href": "/v1/catalog/us/songs/723390870",
                                        "id": "723390870",
                                        "type": "songs"
                                    },
                                    {
                                        "attributes": {
                                            "artistName": "Janet Jackson",
                                            "artwork": {
                                                "bgColor": "ffffff",
                                                "height": 1404,
                                                "textColor1": "050404",
                                                "textColor2": "452c22",
                                                "textColor3": "373636",
                                                "textColor4": "6a564e",
                                                "url": "https://example.mzstatic.com/image/thumb/Music/v4/30/75/33/30753397-86e8-5b3a-e48b-85fb785c4124/source/{w}x{h}bb.jpeg",
                                                "width": 1404
                                            },
                                            "discNumber": 1,
                                            "durationInMillis": 330027,
                                            "genreNames": [
                                                "Pop",
                                                "Music",
                                                "Rock",
                                                "Electronic",
                                                "R&B/Soul",
                                                "Contemporary R&B",
                                                "Adult Contemporary",
                                                "Dance",
                                                "Pop/Rock"
                                            ],
                                            "isrc": "USVI20100057",
                                            "name": "All for You",
                                            "playParams": {
                                                "id": "724885384",
                                                "kind": "song"
                                            },
                                            "previews": [
                                                {
                                                    "url": "https://example.itunes.apple.com/apple-assets-us-std-000001/Music2/v4/69/03/c1/6903c1d7-32c9-85cd-d301-5d4bb4e07125/mzaf_4441152766436868823.plus.aac.p.m4a"
                                                }
                                            ],
                                            "releaseDate": "2001-03-13",
                                            "trackNumber": 3,
                                            "url": "https://itunes.apple.com/us/album/all-for-you/724885014?i=724885384"
                                        },
                                        "href": "/v1/catalog/us/songs/724885384",
                                        "id": "724885384",
                                        "type": "songs"
                                    },
                                    {
                                        "attributes": {
                                            "artistName": "Janet Jackson",
                                            "artwork": {
                                                "bgColor": "ffffff",
                                                "height": 1404,
                                                "textColor1": "050404",
                                                "textColor2": "452c22",
                                                "textColor3": "373636",
                                                "textColor4": "6a564e",
                                                "url": "https://example.mzstatic.com/image/thumb/Music/v4/30/75/33/30753397-86e8-5b3a-e48b-85fb785c4124/source/{w}x{h}bb.jpeg",
                                                "width": 1404
                                            },
                                            "discNumber": 1,
                                            "durationInMillis": 264973,
                                            "genreNames": [
                                                "Pop",
                                                "Music",
                                                "Rock",
                                                "Electronic",
                                                "R&B/Soul",
                                                "Contemporary R&B",
                                                "Adult Contemporary",
                                                "Dance",
                                                "Pop/Rock"
                                            ],
                                            "isrc": "USVI20100098",
                                            "name": "Doesn't Really Matter",
                                            "playParams": {
                                                "id": "724885790",
                                                "kind": "song"
                                            },
                                            "previews": [
                                                {
                                                    "url": "https://example.itunes.apple.com/apple-assets-us-std-000001/Music1/v4/25/51/98/255198f2-02d9-0d8a-183f-9cacee118b2e/mzaf_1901656142812658216.plus.aac.p.m4a"
                                                }
                                            ],
                                            "releaseDate": "2001-04-24",
                                            "trackNumber": 17,
                                            "url": "https://itunes.apple.com/us/album/doesnt-really-matter/724885014?i=724885790"
                                        },
                                        "href": "/v1/catalog/us/songs/724885790",
                                        "id": "724885790",
                                        "type": "songs"
                                    }
                                ],
                                "href": "/v1/catalog/us/playlists/pl.acc464c750b94302b8806e5fcbe56e17/tracks"
                            }
                        },
                        "type": "playlists"
                    },
                    {
                        "attributes": {
                            "artwork": {
                                "bgColor": "201e1c",
                                "height": 1080,
                                "isMosaic": true,
                                "textColor1": "ffffff",
                                "textColor2": "f93621",
                                "textColor3": "d2d1d1",
                                "textColor4": "cd3120",
                                "url": "https://example.mzstatic.com/image/thumb/Features71/v4/ab/da/51/abda5143-fe72-43be-6c94-a2314bdafe99/source/{w}x{h}cc.jpeg",
                                "width": 4320
                            },
                            "curatorName": "Apple Music Pop",
                            "description": {
                                "short": "Gag me with a spoon! These hits are like totally rad.",
                                "standard": "Pop music has always been the home turf of teenagers, but the \u{2018}80s were a particularly tubular time for the voice of youth. With budding new musical sensations like New Kids On The Block, New Edition, and Debbie Gibson hitting the airwaves, this decade was a golden age for teen pop."
                            },
                            "lastModifiedDate": "2015-04-11T16:20:03Z",
                            "name": "Best of '80s Teen Pop",
                            "playParams": {
                                "id": "pl.97c6f95b0b884bedbcce117f9ea5d54b",
                                "kind": "playlist"
                            },
                            "playlistType": "editorial",
                            "url": "https://itunes.apple.com/us/playlist/best-of-80s-teen-pop/pl.97c6f95b0b884bedbcce117f9ea5d54b"
                        },
                        "href": "/v1/catalog/us/playlists/pl.97c6f95b0b884bedbcce117f9ea5d54b",
                        "id": "pl.97c6f95b0b884bedbcce117f9ea5d54b",
                        "relationships": {
                            "curator": {
                                "data": [
                                    {
                                        "href": "/v1/catalog/us/apple-curators/976439548",
                                        "id": "976439548",
                                        "type": "apple-curators"
                                    }
                                ],
                                "href": "/v1/catalog/us/playlists/pl.97c6f95b0b884bedbcce117f9ea5d54b/curator"
                            },
                            "tracks": {
                                "data": [
                                    {
                                        "attributes": {
                                            "artistName": "Menudo",
                                            "artwork": {
                                                "bgColor": "85b638",
                                                "height": 600,
                                                "textColor1": "1a1515",
                                                "textColor2": "26201d",
                                                "textColor3": "2f351c",
                                                "textColor4": "393e22",
                                                "url": "https://example.mzstatic.com/image/thumb/Music/v4/77/af/78/77af78b0-ddb1-3a43-c9dd-aa81caed112a/source/{w}x{h}bb.jpeg",
                                                "width": 605
                                            },
                                            "composerName": "Howie Rice",
                                            "discNumber": 1,
                                            "durationInMillis": 249080,
                                            "genreNames": [
                                                "Pop Latino",
                                                "Music",
                                                "Latino"
                                            ],
                                            "isrc": "USBL10000910",
                                            "name": "Hold Me",
                                            "playParams": {
                                                "id": "304797572",
                                                "kind": "song"
                                            },
                                            "previews": [
                                                {
                                                    "url": "https://example.itunes.apple.com/apple-assets-us-std-000001/Music/2d/eb/d6/mzm.ufjjksfx.aac.p.m4a"
                                                }
                                            ],
                                            "releaseDate": "1999-07-27",
                                            "trackNumber": 15,
                                            "url": "https://itunes.apple.com/us/album/hold-me/304797474?i=304797572"
                                        },
                                        "href": "/v1/catalog/us/songs/304797572",
                                        "id": "304797572",
                                        "type": "songs"
                                    },
                                    {
                                        "attributes": {
                                            "artistName": "New Kids On the Block",
                                            "artwork": {
                                                "bgColor": "26151b",
                                                "height": 600,
                                                "textColor1": "faf0e9",
                                                "textColor2": "efdacb",
                                                "textColor3": "cfc4c0",
                                                "textColor4": "c6b3a8",
                                                "url": "https://example.mzstatic.com/image/thumb/Music/v4/13/36/38/133638d3-a982-0e79-f283-feb267726b29/source/{w}x{h}bb.jpeg",
                                                "width": 600
                                            },
                                            "composerName": "Maurice Starr",
                                            "discNumber": 1,
                                            "durationInMillis": 249960,
                                            "genreNames": [
                                                "Pop",
                                                "Music",
                                                "Dance",
                                                "R&B/Soul",
                                                "Teen Pop"
                                            ],
                                            "isrc": "USSM18700355",
                                            "name": "You've Got It (The Right Stuff)",
                                            "playParams": {
                                                "id": "158643513",
                                                "kind": "song"
                                            },
                                            "previews": [
                                                {
                                                    "url": "https://example.itunes.apple.com/apple-assets-us-std-000001/Music/65/87/3e/mzm.atjsstjr.aac.p.m4a"
                                                }
                                            ],
                                            "releaseDate": "1986-01-01",
                                            "trackNumber": 1,
                                            "url": "https://itunes.apple.com/us/album/youve-got-it-the-right-stuff/158643506?i=158643513"
                                        },
                                        "href": "/v1/catalog/us/songs/158643513",
                                        "id": "158643513",
                                        "type": "songs"
                                    },
                                    {
                                        "attributes": {
                                            "artistName": "Tracie Spencer",
                                            "artwork": {
                                                "bgColor": "222023",
                                                "height": 1500,
                                                "textColor1": "f7d6c6",
                                                "textColor2": "ecb8a2",
                                                "textColor3": "ccb1a5",
                                                "textColor4": "c49a88",
                                                "url": "https://example.mzstatic.com/image/thumb/Music6/v4/2b/56/5f/2b565f63-2548-96e5-ae47-7a7fb08f477e/source/{w}x{h}bb.jpeg",
                                                "width": 1500
                                            },
                                            "composerName": "I. Klarmann & F. Weber",
                                            "discNumber": 1,
                                            "durationInMillis": 304933,
                                            "genreNames": [
                                                "R&B/Soul",
                                                "Music",
                                                "Quiet Storm",
                                                "Dance",
                                                "Rock",
                                                "Soul",
                                                "Electronic"
                                            ],
                                            "isrc": "USCA28700144",
                                            "name": "Symptoms of True Love",
                                            "playParams": {
                                                "id": "715675288",
                                                "kind": "song"
                                            },
                                            "previews": [
                                                {
                                                    "url": "https://example.itunes.apple.com/apple-assets-us-std-000001/AudioPreview71/v4/ac/6f/c2/ac6fc254-6b48-4982-35be-be0fe4f1b35e/mzaf_6617808271506300030.plus.aac.p.m4a"
                                                }
                                            ],
                                            "releaseDate": "1988-01-01",
                                            "trackNumber": 2,
                                            "url": "https://itunes.apple.com/us/album/symptoms-of-true-love/715675181?i=715675288"
                                        },
                                        "href": "/v1/catalog/us/songs/715675288",
                                        "id": "715675288",
                                        "type": "songs"
                                    },
                                    {
                                        "attributes": {
                                            "artistName": "Shana",
                                            "artwork": {
                                                "bgColor": "ffffff",
                                                "height": 600,
                                                "textColor1": "2c2e2a",
                                                "textColor2": "313332",
                                                "textColor3": "565854",
                                                "textColor4": "5a5c5b",
                                                "url": "https://example.mzstatic.com/image/thumb/Music/v4/bb/6c/77/bb6c7782-c1ac-b881-e1a6-37734437bbbd/source/{w}x{h}bb.jpeg",
                                                "width": 600
                                            },
                                            "discNumber": 1,
                                            "durationInMillis": 250480,
                                            "genreNames": [
                                                "R&B/Soul",
                                                "Music",
                                                "Hip-Hop/Rap"
                                            ],
                                            "isrc": "USA560596419",
                                            "name": "I Want You",
                                            "playParams": {
                                                "id": "80954416",
                                                "kind": "song"
                                            },
                                            "previews": [
                                                {
                                                    "url": "https://example.itunes.apple.com/apple-assets-us-std-000001/Music/3b/37/86/mzm.dxrilvft.aac.p.m4a"
                                                }
                                            ],
                                            "releaseDate": "2005-09-13",
                                            "trackNumber": 2,
                                            "url": "https://itunes.apple.com/us/album/i-want-you/80954783?i=80954416"
                                        },
                                        "href": "/v1/catalog/us/songs/80954416",
                                        "id": "80954416",
                                        "type": "songs"
                                    },
                                    {
                                        "attributes": {
                                            "artistName": "Alisha",
                                            "artwork": {
                                                "bgColor": "c41300",
                                                "height": 1400,
                                                "textColor1": "fff5f6",
                                                "textColor2": "fea92c",
                                                "textColor3": "f3c7c4",
                                                "textColor4": "f28b23",
                                                "url": "https://example.mzstatic.com/image/thumb/Music6/v4/db/b8/ad/dbb8adeb-44a8-b976-d01f-c7329a99cadf/source/{w}x{h}bb.jpeg",
                                                "width": 1400
                                            },
                                            "discNumber": 1,
                                            "durationInMillis": 338227,
                                            "genreNames": [
                                                "Country",
                                                "Music"
                                            ],
                                            "isrc": "USVG29552428",
                                            "name": "Baby Talk",
                                            "playParams": {
                                                "id": "712108754",
                                                "kind": "song"
                                            },
                                            "previews": [
                                                {
                                                    "url": "https://example.itunes.apple.com/apple-assets-us-std-000001/AudioPreview71/v4/90/90/fe/9090febf-78da-880c-02a5-98c4d07cba0b/mzaf_3770320154333279538.plus.aac.p.m4a"
                                                }
                                            ],
                                            "releaseDate": "2007-02-13",
                                            "trackNumber": 10,
                                            "url": "https://itunes.apple.com/us/album/baby-talk/712108686?i=712108754"
                                        },
                                        "href": "/v1/catalog/us/songs/712108754",
                                        "id": "712108754",
                                        "type": "songs"
                                    },
                                    {
                                        "attributes": {
                                            "artistName": "Martika",
                                            "artwork": {
                                                "bgColor": "0d1a20",
                                                "height": 600,
                                                "textColor1": "accedf",
                                                "textColor2": "8cb6cb",
                                                "textColor3": "8caab9",
                                                "textColor4": "7397a8",
                                                "url": "https://example.mzstatic.com/image/thumb/Music/v4/bf/74/2f/bf742f0a-ecc0-662a-dbd3-1a0347d28bb2/source/{w}x{h}bb.jpeg",
                                                "width": 600
                                            },
                                            "composerName": "Martika & M. Jay",
                                            "discNumber": 1,
                                            "durationInMillis": 287533,
                                            "genreNames": [
                                                "Pop",
                                                "Music",
                                                "Dance",
                                                "R&B/Soul",
                                                "Adult Contemporary"
                                            ],
                                            "isrc": "USSM18800406",
                                            "name": "Toy Soldiers",
                                            "playParams": {
                                                "id": "203201890",
                                                "kind": "song"
                                            },
                                            "previews": [
                                                {
                                                    "url": "https://example.itunes.apple.com/apple-assets-us-std-000001/Music/ad/07/19/mzm.nrbibsvz.aac.p.m4a"
                                                }
                                            ],
                                            "releaseDate": "1988-10-18",
                                            "trackNumber": 4,
                                            "url": "https://itunes.apple.com/us/album/toy-soldiers/203201685?i=203201890"
                                        },
                                        "href": "/v1/catalog/us/songs/203201890",
                                        "id": "203201890",
                                        "type": "songs"
                                    },
                                    {
                                        "attributes": {
                                            "artistName": "The Jets",
                                            "artwork": {
                                                "bgColor": "ffffff",
                                                "height": 1415,
                                                "textColor1": "000000",
                                                "textColor2": "243045",
                                                "textColor3": "333333",
                                                "textColor4": "4f596a",
                                                "url": "https://example.mzstatic.com/image/thumb/Music111/v4/28/bd/83/28bd833a-1cf8-3162-eb45-d55c0aca07b2/source/{w}x{h}bb.jpeg",
                                                "width": 1422
                                            },
                                            "composerName": "Jerry Knight & Aaron Zigman",
                                            "discNumber": 1,
                                            "durationInMillis": 270067,
                                            "genreNames": [
                                                "R&B/Soul",
                                                "Music",
                                                "Pop",
                                                "Contemporary R&B",
                                                "Teen Pop"
                                            ],
                                            "isrc": "USMC19033204",
                                            "name": "Crush On You",
                                            "playParams": {
                                                "id": "26719",
                                                "kind": "song"
                                            },
                                            "previews": [
                                                {
                                                    "url": "https://example.itunes.apple.com/apple-assets-us-std-000001/AudioPreview111/v4/0a/59/51/0a59513a-4fc3-8358-66e3-58cc949a932f/mzaf_3982869699684463711.plus.aac.p.m4a"
                                                }
                                            ],
                                            "releaseDate": "2001-01-01",
                                            "trackNumber": 1,
                                            "url": "https://itunes.apple.com/us/album/crush-on-you/26746?i=26719"
                                        },
                                        "href": "/v1/catalog/us/songs/26719",
                                        "id": "26719",
                                        "type": "songs"
                                    },
                                    {
                                        "attributes": {
                                            "artistName": "New Edition",
                                            "artwork": {
                                                "bgColor": "301624",
                                                "height": 1387,
                                                "textColor1": "f5f8f6",
                                                "textColor2": "f2ab30",
                                                "textColor3": "cecbcc",
                                                "textColor4": "cb8d2e",
                                                "url": "https://example.mzstatic.com/image/thumb/Music/v4/17/f9/d5/17f9d5d8-4816-8613-400d-a00e8f2d0213/source/{w}x{h}bb.jpeg",
                                                "width": 1420
                                            },
                                            "discNumber": 1,
                                            "durationInMillis": 237733,
                                            "genreNames": [
                                                "R&B/Soul",
                                                "Music",
                                                "Pop",
                                                "Teen Pop",
                                                "Hip-Hop/Rap",
                                                "Hip-Hop"
                                            ],
                                            "isrc": "USWR39100014",
                                            "name": "Candy Girl",
                                            "playParams": {
                                                "id": "3242306",
                                                "kind": "song"
                                            },
                                            "previews": [
                                                {
                                                    "url": "https://example.itunes.apple.com/apple-assets-us-std-000001/AudioPreview71/v4/8e/e3/88/8ee388eb-f88d-5d20-b7ae-be02544c050b/mzaf_415295000604040570.plus.aac.p.m4a"
                                                }
                                            ],
                                            "releaseDate": "1983-01-01",
                                            "trackNumber": 6,
                                            "url": "https://itunes.apple.com/us/album/candy-girl/3242317?i=3242306"
                                        },
                                        "href": "/v1/catalog/us/songs/3242306",
                                        "id": "3242306",
                                        "type": "songs"
                                    },
                                    {
                                        "attributes": {
                                            "artistName": "Madonna",
                                            "artwork": {
                                                "bgColor": "dfd8d0",
                                                "height": 1435,
                                                "textColor1": "191917",
                                                "textColor2": "201e1b",
                                                "textColor3": "403f3c",
                                                "textColor4": "46433f",
                                                "url": "https://example.mzstatic.com/image/thumb/Music/v4/d7/6f/0f/d76f0f8f-9f56-3dc9-e383-2d1e14471507/source/{w}x{h}bb.jpeg",
                                                "width": 1447
                                            },
                                            "discNumber": 1,
                                            "durationInMillis": 417040,
                                            "genreNames": [
                                                "Pop",
                                                "Music",
                                                "Pop/Rock",
                                                "Electronic",
                                                "R&B/Soul",
                                                "Dance"
                                            ],
                                            "isrc": "USWB19902985",
                                            "name": "Borderline",
                                            "playParams": {
                                                "id": "80815626",
                                                "kind": "song"
                                            },
                                            "previews": [
                                                {
                                                    "url": "https://example.itunes.apple.com/apple-assets-us-std-000001/Music6/v4/d8/32/e7/d832e723-81fc-6745-24b3-df887fc6be1d/mzaf_4635524336012334267.plus.aac.p.m4a"
                                                }
                                            ],
                                            "releaseDate": "1983-01-01",
                                            "trackNumber": 2,
                                            "url": "https://itunes.apple.com/us/album/borderline/80815644?i=80815626"
                                        },
                                        "href": "/v1/catalog/us/songs/80815626",
                                        "id": "80815626",
                                        "type": "songs"
                                    },
                                    {
                                        "attributes": {
                                            "artistName": "Debbie Gibson",
                                            "artwork": {
                                                "bgColor": "1e1a0e",
                                                "height": 1400,
                                                "textColor1": "fbe599",
                                                "textColor2": "edb248",
                                                "textColor3": "cfbc7d",
                                                "textColor4": "c3933c",
                                                "url": "https://example.mzstatic.com/image/thumb/Music62/v4/d5/36/34/d53634ef-568b-85df-6559-fe7d2e94c057/source/{w}x{h}bb.jpeg",
                                                "width": 1426
                                            },
                                            "composerName": "Debbie Gibson",
                                            "discNumber": 1,
                                            "durationInMillis": 236533,
                                            "genreNames": [
                                                "Pop",
                                                "Music",
                                                "Dance",
                                                "Pop/Rock",
                                                "Teen Pop"
                                            ],
                                            "isrc": "USAT29902070",
                                            "name": "Only In My Dreams",
                                            "playParams": {
                                                "id": "73239207",
                                                "kind": "song"
                                            },
                                            "previews": [
                                                {
                                                    "url": "https://example.itunes.apple.com/apple-assets-us-std-000001/AudioPreview62/v4/07/21/c5/0721c5c4-80aa-1e9d-c89d-348a28949bb6/mzaf_1607201022694809093.plus.aac.p.m4a"
                                                }
                                            ],
                                            "releaseDate": "1987-09-15",
                                            "trackNumber": 1,
                                            "url": "https://itunes.apple.com/us/album/only-in-my-dreams/73239496?i=73239207"
                                        },
                                        "href": "/v1/catalog/us/songs/73239207",
                                        "id": "73239207",
                                        "type": "songs"
                                    }
                                ],
                                "href": "/v1/catalog/us/playlists/pl.97c6f95b0b884bedbcce117f9ea5d54b/tracks"
                            }
                        },
                        "type": "playlists"
                    }
                ]
            }
        """)

let libraryPlaylistJSON =
    JSON.init(parseJSON:
        """
        {
            "attributes": {
                "canEdit": true,
                "description": {
                    "standard": "My description"
                },
                "name": "Some Playlist",
                "playParams": {
                    "id": "p.MoGJYM3CYXW09B",
                    "isLibrary": true,
                    "kind": "playlist"
                }
            },
            "href": "/v1/me/library/playlists/p.MoGJYM3CYXW09B",
            "id": "p.MoGJYM3CYXW09B",
            "type": "library-playlists"
        }
    """)

let multipleLibraryPlaylistsJSON =
    JSON.init(parseJSON:
        """
            {
                "data": [
                    {
                        "attributes": {
                            "canEdit": true,
                            "description": {
                                "standard": "My description"
                            },
                            "name": "Some Playlist",
                            "playParams": {
                                "id": "p.MoGJYM3CYXW09B",
                                "isLibrary": true,
                                "kind": "playlist"
                            }
                        },
                        "href": "/v1/me/library/playlists/p.MoGJYM3CYXW09B",
                        "id": "p.MoGJYM3CYXW09B",
                        "type": "library-playlists"
                    },
                    {
                        "attributes": {
                            "canEdit": true,
                            "name": "Media API Playlist",
                            "playParams": {
                                "id": "p.8Wx6vK6IQeP0N2",
                                "isLibrary": true,
                                "kind": "playlist"
                            }
                        },
                        "href": "/v1/me/library/playlists/p.8Wx6vK6IQeP0N2",
                        "id": "p.8Wx6vK6IQeP0N2",
                        "type": "library-playlists"
                    }
                ]
            }
        """)

let allLibraryPlaylistsJSON =
JSON.init(parseJSON:
    """
        {
            "data": [
                {
                    "attributes": {
                        "canEdit": true,
                        "description": {
                            "standard": "My description"
                        },
                        "name": "Some Playlist",
                        "playParams": {
                            "id": "p.MoGJYM3CYXW09B",
                            "isLibrary": true,
                            "kind": "playlist"
                        }
                    },
                    "href": "/v1/me/library/playlists/p.MoGJYM3CYXW09B",
                    "id": "p.MoGJYM3CYXW09B",
                    "type": "library-playlists"
                },
                {
                    "attributes": {
                        "canEdit": true,
                        "name": "Media API Playlist",
                        "playParams": {
                            "id": "p.8Wx6vK6IQeP0N2",
                            "isLibrary": true,
                            "kind": "playlist"
                        }
                    },
                    "href": "/v1/me/library/playlists/p.8Wx6vK6IQeP0N2",
                    "id": "p.8Wx6vK6IQeP0N2",
                    "type": "library-playlists"
                }
            ]
        }
    """)

let catalogMVJSON =
    JSON.init(parseJSON:
        """
        {
            "attributes": {
                "albumName": "Rubber Soul",
                "artistName": "The Beatles",
                "artwork": {
                    "height": 480,
                    "url": "https://example.mzstatic.com/image/thumb/Video/80/7c/7b/mzi.whntyxqw.jpg/{w}x{h}bb.jpeg",
                    "width": 640
                },
                "genreNames": [
                    "Rock"
                ],
                "has4K": false,
                "hasHDR": false,
                "isrc": "GBDCE0900012",
                "name": "Rubber Soul (Documentary)",
                "previews": [
                    {
                        "artwork": {
                            "height": 480,
                            "url": "https://example.mzstatic.com/image/thumb/Video/80/7c/7b/mzi.whntyxqw.jpg/{w}x{h}bb.jpeg",
                            "width": 640
                        },
                        "url": "http://video.itunes.apple.com/apple-itms7-assets-us-std-000001/Video/04/9b/4b/mzm.dlcrzuou..640x480.h264lc.u.p.m4v"
                    }
                ],
                "releaseDate": "2010-11-16",
                "trackNumber": 15,
                "url": "https://itunes.apple.com/us/music-video/rubber-soul-documentary/401135199"
            },
            "href": "/v1/catalog/us/music-videos/401135199",
            "id": "401135199",
            "relationships": {
                "albums": {
                    "data": [
                        {
                            "href": "/v1/catalog/us/albums/401134909",
                            "id": "401134909",
                            "type": "albums"
                        }
                    ],
                    "href": "/v1/catalog/us/music-videos/401135199/albums"
                },
                "artists": {
                    "data": [
                        {
                            "href": "/v1/catalog/us/artists/136975",
                            "id": "136975",
                            "type": "artists"
                        }
                    ],
                    "href": "/v1/catalog/us/music-videos/401135199/artists"
                }
            },
            "type": "music-videos"
        }
    """)

let multipleCatalogMVsJSON =
    JSON.init(parseJSON:
        """
            {
                "data": [
                    {
                        "attributes": {
                            "albumName": "Rubber Soul",
                            "artistName": "The Beatles",
                            "artwork": {
                                "height": 480,
                                "url": "https://example.mzstatic.com/image/thumb/Video/80/7c/7b/mzi.whntyxqw.jpg/{w}x{h}bb.jpeg",
                                "width": 640
                            },
                            "genreNames": [
                                "Rock"
                            ],
                            "has4K": false,
                            "hasHDR": false,
                            "isrc": "GBDCE0900012",
                            "name": "Rubber Soul (Documentary)",
                            "previews": [
                                {
                                    "artwork": {
                                        "height": 480,
                                        "url": "https://example.mzstatic.com/image/thumb/Video/80/7c/7b/mzi.whntyxqw.jpg/{w}x{h}bb.jpeg",
                                        "width": 640
                                    },
                                    "url": "http://video.itunes.apple.com/apple-itms7-assets-us-std-000001/Video/04/9b/4b/mzm.dlcrzuou..640x480.h264lc.u.p.m4v"
                                }
                            ],
                            "releaseDate": "2010-11-16",
                            "trackNumber": 15,
                            "url": "https://itunes.apple.com/us/music-video/rubber-soul-documentary/401135199"
                        },
                        "href": "/v1/catalog/us/music-videos/401135199",
                        "id": "401135199",
                        "relationships": {
                            "albums": {
                                "data": [
                                    {
                                        "href": "/v1/catalog/us/albums/401134909",
                                        "id": "401134909",
                                        "type": "albums"
                                    }
                                ],
                                "href": "/v1/catalog/us/music-videos/401135199/albums"
                            },
                            "artists": {
                                "data": [
                                    {
                                        "href": "/v1/catalog/us/artists/136975",
                                        "id": "136975",
                                        "type": "artists"
                                    }
                                ],
                                "href": "/v1/catalog/us/music-videos/401135199/artists"
                            }
                        },
                        "type": "music-videos"
                    },
                    {
                        "attributes": {
                            "albumName": "Sgt. Pepper's Lonely Hearts Club Band",
                            "artistName": "The Beatles",
                            "artwork": {
                                "height": 480,
                                "url": "https://example.mzstatic.com/image/thumb/Video/d6/e5/b9/mzi.jglfpadr.jpg/{w}x{h}bb.jpeg",
                                "width": 640
                            },
                            "durationInMillis": 248480,
                            "genreNames": [
                                "Rock"
                            ],
                            "has4K": false,
                            "hasHDR": false,
                            "isrc": "GBDCE0900014",
                            "name": "Sgt. Pepper's Lonely Hearts Club Band (Documentary)",
                            "playParams": {
                                "id": "401147268",
                                "kind": "musicVideo"
                            },
                            "previews": [
                                {
                                    "artwork": {
                                        "height": 480,
                                        "url": "https://example.mzstatic.com/image/thumb/Video/d6/e5/b9/mzi.jglfpadr.jpg/{w}x{h}bb.jpeg",
                                        "width": 640
                                    },
                                    "url": "http://video.itunes.apple.com/apple-itms7-assets-us-std-000001/Video/6e/79/2e/mzm.qoaamhyf..640x480.h264lc.u.p.m4v"
                                }
                            ],
                            "releaseDate": "2010-11-16",
                            "trackNumber": 14,
                            "url": "https://itunes.apple.com/us/music-video/sgt-peppers-lonely-hearts-club-band-documentary/401147268"
                        },
                        "href": "/v1/catalog/us/music-videos/401147268",
                        "id": "401147268",
                        "relationships": {
                            "albums": {
                                "data": [
                                    {
                                        "href": "/v1/catalog/us/albums/401141921",
                                        "id": "401141921",
                                        "type": "albums"
                                    }
                                ],
                                "href": "/v1/catalog/us/music-videos/401147268/albums"
                            },
                            "artists": {
                                "data": [
                                    {
                                        "href": "/v1/catalog/us/artists/136975",
                                        "id": "136975",
                                        "type": "artists"
                                    }
                                ],
                                "href": "/v1/catalog/us/music-videos/401147268/artists"
                            }
                        },
                        "type": "music-videos"
                    }
                ]
            }
        """)

let libraryMVJSON =
JSON.init(parseJSON:
    """
    {
        "attributes": {
            "albumName": "I'll Go Crazy If I Don't Go Crazy Tonight",
            "artistName": "U2",
            "artwork": {
                "height": 1200,
                "url": "https://example.mzstatic.com/image/thumb/Video/e2/e4/92/mzi.tbabydcf.jpeg/{w}x{h}bb.jpeg",
                "width": 1200
            },
            "contentRating": "clean",
            "name": "I'll Go Crazy If I Don't Go Crazy Tonight (David O'Reilly Video) [David O'Reilly]",
            "trackNumber": 0
        },
        "href": "/v1/me/library/music-videos/i.B0Vz1lxT9dYXOV",
        "id": "i.B0Vz1lxT9dYXOV",
        "type": "library-music-videos"
    }
    """)

let multipleLibraryMVsJSON =
JSON.init(parseJSON:
    """
        {
            "data": [
                {
                    "attributes": {
                        "albumName": "No Line On the Horizon (Deluxe Edition)"
                        "artistName": "U2",
                        "artwork": {
                            "height": 1200,
                            "url": "https://example.mzstatic.com/image/thumb/Video/dd/3b/87/mzi.nitgjlfh.jpeg/{w}x{h}bb.jpeg",
                            "width": 1200
                        },
                        "name": "Anton Corbijn's  Exclusive Film \"Linear\"",
                        "trackNumber": 13
                    },
                    "href": "/v1/me/library/music-videos/i.xrX5kEvtv0VrNA",
                    "id": "i.xrX5kEvtv0VrNA",
                    "type": "library-music-videos"
                },
                {
                    "attributes": {
                        "albumName": "I'll Go Crazy If I Don't Go Crazy Tonight",
                        "artistName": "U2",
                        "artwork": {
                            "height": 1200,
                            "url": "https://example.mzstatic.com/image/thumb/Video/e2/e4/92/mzi.tbabydcf.jpeg/{w}x{h}bb.jpeg",
                            "width": 1200
                        },
                        "contentRating": "clean",
                        "name": "I'll Go Crazy If I Don't Go Crazy Tonight (David O'Reilly Video) [David O'Reilly]",
                        "trackNumber": 0
                    },
                    "href": "/v1/me/library/music-videos/i.B0Vz1lxT9dYXOV",
                    "id": "i.B0Vz1lxT9dYXOV",
                    "type": "library-music-videos"
                }
            ]
        }
    """)

let allLibraryMVsJSON =
JSON.init(parseJSON:
    """
        {
            "data": [
                {
                    "attributes": {
                        "albumName": "No Line On the Horizon (Deluxe Edition)"
                        "artistName": "U2",
                        "artwork": {
                            "height": 1200,
                            "url": "https://example.mzstatic.com/image/thumb/Video/dd/3b/87/mzi.nitgjlfh.jpeg/{w}x{h}bb.jpeg",
                            "width": 1200
                        },
                        "name": "Anton Corbijn's  Exclusive Film \"Linear\"",
                        "trackNumber": 13
                    },
                    "href": "/v1/me/library/music-videos/i.xrX5kEvtv0VrNA",
                    "id": "i.xrX5kEvtv0VrNA",
                    "type": "library-music-videos"
                },
                {
                    "attributes": {
                        "albumName": "I'll Go Crazy If I Don't Go Crazy Tonight",
                        "artistName": "U2",
                        "artwork": {
                            "height": 1200,
                            "url": "https://example.mzstatic.com/image/thumb/Video/e2/e4/92/mzi.tbabydcf.jpeg/{w}x{h}bb.jpeg",
                            "width": 1200
                        },
                        "contentRating": "clean",
                        "name": "I'll Go Crazy If I Don't Go Crazy Tonight (David O'Reilly Video) [David O'Reilly]",
                        "trackNumber": 0
                    },
                    "href": "/v1/me/library/music-videos/i.B0Vz1lxT9dYXOV",
                    "id": "i.B0Vz1lxT9dYXOV",
                    "type": "library-music-videos"
                },
                {
                    "attributes": {
                        "albumName": "I'll Go Crazy If I Don't Go Crazy Tonight",
                        "artistName": "U2",
                        "artwork": {
                            "height": 1200,
                            "url": "https://example.mzstatic.com/image/thumb/Video/1e/20/1f/mzi.zztvlufo.jpeg/{w}x{h}bb.jpeg",
                            "width": 1200
                        },
                        "contentRating": "clean",
                        "name": "I'll Go Crazy If I Don't Go Crazy Tonight (Live Action Version)",
                        "trackNumber": 8
                    },
                    "href": "/v1/me/library/music-videos/i.xrX5p2QHv0VrNA",
                    "id": "i.xrX5p2QHv0VrNA",
                    "type": "library-music-videos"
                }
            ]
        }
    """)

let catalogStationJSON =
    JSON.init(parseJSON:
        """
        {
            "attributes": {
                "artwork": {
                    "bgColor": "eee9d5",
                    "height": 1080,
                    "textColor1": "040404",
                    "textColor2": "121211",
                    "textColor3": "32312e",
                    "textColor4": "3e3d38",
                    "url": "https://example.mzstatic.com/image/thumb/Features42/v4/ed/32/b8/ed32b8eb-6b23-aafe-5c5d-4cdb22f65da4/source/{w}x{h}bb.jpeg",
                    "width": 4320
                },
                "editorialNotes": {
                    "short": "From the margins to the mainstream."
                },
                "isLive": false,
                "name": "Alternative",
                "playParams": {
                    "id": "ra.985484166",
                    "kind": "radioStation"
                },
                "url": "https://itunes.apple.com/us/station/alternative/idra.985484166"
            },
            "href": "/v1/catalog/us/stations/ra.985484166",
            "id": "ra.985484166",
            "type": "stations"
        }
    """)

let storefrontJSON =
JSON.init(parseJSON:
        """
        {
            "attributes": {
                "defaultLanguageTag": "en-US",
                "name": "United States",
                "supportedLanguageTags": [
                    "en-US",
                    "es-MX"
                ]
            },
            "href": "/v1/storefronts/us",
            "id": "us",
            "type": "storefronts"
        }
    """)

let multipleStorefrontsJSON =
JSON.init(parseJSON:
    """
        {
            "data": [
                {
                    "attributes": {
                        "defaultLanguageTag": "en-US",
                        "name": "United States",
                        "supportedLanguageTags": [
                            "en-US",
                            "es-MX"
                        ]
                    },
                    "href": "/v1/storefronts/us",
                    "id": "us",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-CA",
                        "name": "Canada",
                        "supportedLanguageTags": [
                            "en-CA",
                            "fr-CA"
                        ]
                    },
                    "href": "/v1/storefronts/ca",
                    "id": "ca",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "zh-Hans-CN",
                        "name": "China",
                        "supportedLanguageTags": [
                            "zh-Hans-CN",
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/cn",
                    "id": "cn",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-AU",
                        "name": "Australia",
                        "supportedLanguageTags": [
                            "en-AU"
                        ]
                    },
                    "href": "/v1/storefronts/au",
                    "id": "au",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "zh-Hant-HK",
                        "name": "Hong Kong",
                        "supportedLanguageTags": [
                            "zh-Hant-HK",
                            "zh-Hant-TW",
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/hk",
                    "id": "hk",
                    "type": "storefronts"
                }
            ]
        }
    """)

let allStorefrontsJSON =
JSON.init(parseJSON:
    """
        {
            "data": [
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Anguilla",
                        "supportedLanguageTags": [
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/ai",
                    "id": "ai",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Antigua and Barbuda",
                        "supportedLanguageTags": [
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/ag",
                    "id": "ag",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "es-MX",
                        "name": "Argentina",
                        "supportedLanguageTags": [
                            "es-MX",
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/ar",
                    "id": "ar",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Armenia",
                        "supportedLanguageTags": [
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/am",
                    "id": "am",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-AU",
                        "name": "Australia",
                        "supportedLanguageTags": [
                            "en-AU"
                        ]
                    },
                    "href": "/v1/storefronts/au",
                    "id": "au",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "de-DE",
                        "name": "Austria",
                        "supportedLanguageTags": [
                            "de-DE",
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/at",
                    "id": "at",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Azerbaijan",
                        "supportedLanguageTags": [
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/az",
                    "id": "az",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Bahrain",
                        "supportedLanguageTags": [
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/bh",
                    "id": "bh",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Barbados",
                        "supportedLanguageTags": [
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/bb",
                    "id": "bb",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Belarus",
                        "supportedLanguageTags": [
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/by",
                    "id": "by",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Belgium",
                        "supportedLanguageTags": [
                            "en-GB",
                            "fr-FR",
                            "nl"
                        ]
                    },
                    "href": "/v1/storefronts/be",
                    "id": "be",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Belize",
                        "supportedLanguageTags": [
                            "en-GB",
                            "es-MX"
                        ]
                    },
                    "href": "/v1/storefronts/bz",
                    "id": "bz",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Bermuda",
                        "supportedLanguageTags": [
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/bm",
                    "id": "bm",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "es-MX",
                        "name": "Bolivia",
                        "supportedLanguageTags": [
                            "es-MX",
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/bo",
                    "id": "bo",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Botswana",
                        "supportedLanguageTags": [
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/bw",
                    "id": "bw",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "pt-BR",
                        "name": "Brazil",
                        "supportedLanguageTags": [
                            "pt-BR",
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/br",
                    "id": "br",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "British Virgin Islands",
                        "supportedLanguageTags": [
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/vg",
                    "id": "vg",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Bulgaria",
                        "supportedLanguageTags": [
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/bg",
                    "id": "bg",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Cambodia",
                        "supportedLanguageTags": [
                            "en-GB",
                            "fr-FR"
                        ]
                    },
                    "href": "/v1/storefronts/kh",
                    "id": "kh",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-CA",
                        "name": "Canada",
                        "supportedLanguageTags": [
                            "en-CA",
                            "fr-CA"
                        ]
                    },
                    "href": "/v1/storefronts/ca",
                    "id": "ca",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Cape Verde",
                        "supportedLanguageTags": [
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/cv",
                    "id": "cv",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Cayman Islands",
                        "supportedLanguageTags": [
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/ky",
                    "id": "ky",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "es-MX",
                        "name": "Chile",
                        "supportedLanguageTags": [
                            "es-MX",
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/cl",
                    "id": "cl",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "zh-Hans-CN",
                        "name": "China",
                        "supportedLanguageTags": [
                            "zh-Hans-CN",
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/cn",
                    "id": "cn",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "es-MX",
                        "name": "Colombia",
                        "supportedLanguageTags": [
                            "es-MX",
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/co",
                    "id": "co",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "es-MX",
                        "name": "Costa Rica",
                        "supportedLanguageTags": [
                            "es-MX",
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/cr",
                    "id": "cr",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Cyprus",
                        "supportedLanguageTags": [
                            "en-GB",
                            "el",
                            "tr"
                        ]
                    },
                    "href": "/v1/storefronts/cy",
                    "id": "cy",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Czech Republic",
                        "supportedLanguageTags": [
                            "en-GB",
                            "cs"
                        ]
                    },
                    "href": "/v1/storefronts/cz",
                    "id": "cz",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Denmark",
                        "supportedLanguageTags": [
                            "en-GB",
                            "da"
                        ]
                    },
                    "href": "/v1/storefronts/dk",
                    "id": "dk",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Dominica",
                        "supportedLanguageTags": [
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/dm",
                    "id": "dm",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "es-MX",
                        "name": "Dominican Republic",
                        "supportedLanguageTags": [
                            "es-MX",
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/do",
                    "id": "do",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "es-MX",
                        "name": "Ecuador",
                        "supportedLanguageTags": [
                            "es-MX",
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/ec",
                    "id": "ec",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Egypt",
                        "supportedLanguageTags": [
                            "en-GB",
                            "fr-FR"
                        ]
                    },
                    "href": "/v1/storefronts/eg",
                    "id": "eg",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "es-MX",
                        "name": "El Salvador",
                        "supportedLanguageTags": [
                            "es-MX",
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/sv",
                    "id": "sv",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Estonia",
                        "supportedLanguageTags": [
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/ee",
                    "id": "ee",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Fiji",
                        "supportedLanguageTags": [
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/fj",
                    "id": "fj",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Finland",
                        "supportedLanguageTags": [
                            "en-GB",
                            "fi"
                        ]
                    },
                    "href": "/v1/storefronts/fi",
                    "id": "fi",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "fr-FR",
                        "name": "France",
                        "supportedLanguageTags": [
                            "fr-FR",
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/fr",
                    "id": "fr",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Gambia",
                        "supportedLanguageTags": [
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/gm",
                    "id": "gm",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "de-DE",
                        "name": "Germany",
                        "supportedLanguageTags": [
                            "de-DE",
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/de",
                    "id": "de",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Ghana",
                        "supportedLanguageTags": [
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/gh",
                    "id": "gh",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Greece",
                        "supportedLanguageTags": [
                            "en-GB",
                            "el"
                        ]
                    },
                    "href": "/v1/storefronts/gr",
                    "id": "gr",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Grenada",
                        "supportedLanguageTags": [
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/gd",
                    "id": "gd",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "es-MX",
                        "name": "Guatemala",
                        "supportedLanguageTags": [
                            "es-MX",
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/gt",
                    "id": "gt",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Guinea-Bissau",
                        "supportedLanguageTags": [
                            "en-GB",
                            "fr-FR"
                        ]
                    },
                    "href": "/v1/storefronts/gw",
                    "id": "gw",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "es-MX",
                        "name": "Honduras",
                        "supportedLanguageTags": [
                            "es-MX",
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/hn",
                    "id": "hn",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "zh-Hant-HK",
                        "name": "Hong Kong",
                        "supportedLanguageTags": [
                            "zh-Hant-HK",
                            "zh-Hant-TW",
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/hk",
                    "id": "hk",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Hungary",
                        "supportedLanguageTags": [
                            "en-GB",
                            "hu"
                        ]
                    },
                    "href": "/v1/storefronts/hu",
                    "id": "hu",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "India",
                        "supportedLanguageTags": [
                            "en-GB",
                            "hi"
                        ]
                    },
                    "href": "/v1/storefronts/in",
                    "id": "in",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Indonesia",
                        "supportedLanguageTags": [
                            "en-GB",
                            "id"
                        ]
                    },
                    "href": "/v1/storefronts/id",
                    "id": "id",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Ireland",
                        "supportedLanguageTags": [
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/ie",
                    "id": "ie",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Israel",
                        "supportedLanguageTags": [
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/il",
                    "id": "il",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "it",
                        "name": "Italy",
                        "supportedLanguageTags": [
                            "it",
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/it",
                    "id": "it",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "ja",
                        "name": "Japan",
                        "supportedLanguageTags": [
                            "ja",
                            "en-US"
                        ]
                    },
                    "href": "/v1/storefronts/jp",
                    "id": "jp",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Jordan",
                        "supportedLanguageTags": [
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/jo",
                    "id": "jo",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Kazakhstan",
                        "supportedLanguageTags": [
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/kz",
                    "id": "kz",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Kenya",
                        "supportedLanguageTags": [
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/ke",
                    "id": "ke",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "ko",
                        "name": "Korea, Republic of",
                        "supportedLanguageTags": [
                            "ko",
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/kr",
                    "id": "kr",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Kyrgyzstan",
                        "supportedLanguageTags": [
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/kg",
                    "id": "kg",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Lao People's Democratic Republic",
                        "supportedLanguageTags": [
                            "en-GB",
                            "fr-FR"
                        ]
                    },
                    "href": "/v1/storefronts/la",
                    "id": "la",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Latvia",
                        "supportedLanguageTags": [
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/lv",
                    "id": "lv",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Lebanon",
                        "supportedLanguageTags": [
                            "en-GB",
                            "fr-FR"
                        ]
                    },
                    "href": "/v1/storefronts/lb",
                    "id": "lb",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Lithuania",
                        "supportedLanguageTags": [
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/lt",
                    "id": "lt",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Luxembourg",
                        "supportedLanguageTags": [
                            "en-GB",
                            "fr-FR",
                            "de-DE"
                        ]
                    },
                    "href": "/v1/storefronts/lu",
                    "id": "lu",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "zh-Hant-HK",
                        "name": "Macau",
                        "supportedLanguageTags": [
                            "zh-Hant-HK",
                            "zh-Hant-TW",
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/mo",
                    "id": "mo",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Malaysia",
                        "supportedLanguageTags": [
                            "en-GB",
                            "ms"
                        ]
                    },
                    "href": "/v1/storefronts/my",
                    "id": "my",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Malta",
                        "supportedLanguageTags": [
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/mt",
                    "id": "mt",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Mauritius",
                        "supportedLanguageTags": [
                            "en-GB",
                            "fr-FR"
                        ]
                    },
                    "href": "/v1/storefronts/mu",
                    "id": "mu",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "es-MX",
                        "name": "Mexico",
                        "supportedLanguageTags": [
                            "es-MX",
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/mx",
                    "id": "mx",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Micronesia, Federated States of",
                        "supportedLanguageTags": [
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/fm",
                    "id": "fm",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Moldova",
                        "supportedLanguageTags": [
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/md",
                    "id": "md",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Mongolia",
                        "supportedLanguageTags": [
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/mn",
                    "id": "mn",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Nepal",
                        "supportedLanguageTags": [
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/np",
                    "id": "np",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "nl",
                        "name": "Netherlands",
                        "supportedLanguageTags": [
                            "nl",
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/nl",
                    "id": "nl",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-AU",
                        "name": "New Zealand",
                        "supportedLanguageTags": [
                            "en-AU"
                        ]
                    },
                    "href": "/v1/storefronts/nz",
                    "id": "nz",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "es-MX",
                        "name": "Nicaragua",
                        "supportedLanguageTags": [
                            "es-MX",
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/ni",
                    "id": "ni",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Niger",
                        "supportedLanguageTags": [
                            "en-GB",
                            "fr-FR"
                        ]
                    },
                    "href": "/v1/storefronts/ne",
                    "id": "ne",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Nigeria",
                        "supportedLanguageTags": [
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/ng",
                    "id": "ng",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Norway",
                        "supportedLanguageTags": [
                            "en-GB",
                            "no"
                        ]
                    },
                    "href": "/v1/storefronts/no",
                    "id": "no",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Oman",
                        "supportedLanguageTags": [
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/om",
                    "id": "om",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "es-MX",
                        "name": "Panama",
                        "supportedLanguageTags": [
                            "es-MX",
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/pa",
                    "id": "pa",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Papua New Guinea",
                        "supportedLanguageTags": [
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/pg",
                    "id": "pg",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "es-MX",
                        "name": "Paraguay",
                        "supportedLanguageTags": [
                            "es-MX",
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/py",
                    "id": "py",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "es-MX",
                        "name": "Peru",
                        "supportedLanguageTags": [
                            "es-MX",
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/pe",
                    "id": "pe",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Philippines",
                        "supportedLanguageTags": [
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/ph",
                    "id": "ph",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Poland",
                        "supportedLanguageTags": [
                            "en-GB",
                            "pl"
                        ]
                    },
                    "href": "/v1/storefronts/pl",
                    "id": "pl",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "pt-PT",
                        "name": "Portugal",
                        "supportedLanguageTags": [
                            "pt-PT",
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/pt",
                    "id": "pt",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Romania",
                        "supportedLanguageTags": [
                            "en-GB",
                            "ro"
                        ]
                    },
                    "href": "/v1/storefronts/ro",
                    "id": "ro",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "ru",
                        "name": "Russia",
                        "supportedLanguageTags": [
                            "ru",
                            "en-GB",
                            "uk"
                        ]
                    },
                    "href": "/v1/storefronts/ru",
                    "id": "ru",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Saudi Arabia",
                        "supportedLanguageTags": [
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/sa",
                    "id": "sa",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Singapore",
                        "supportedLanguageTags": [
                            "en-GB",
                            "zh-Hans-CN"
                        ]
                    },
                    "href": "/v1/storefronts/sg",
                    "id": "sg",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Slovakia",
                        "supportedLanguageTags": [
                            "en-GB",
                            "sk"
                        ]
                    },
                    "href": "/v1/storefronts/sk",
                    "id": "sk",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Slovenia",
                        "supportedLanguageTags": [
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/si",
                    "id": "si",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "South Africa",
                        "supportedLanguageTags": [
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/za",
                    "id": "za",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "es-ES",
                        "name": "Spain",
                        "supportedLanguageTags": [
                            "es-ES",
                            "ca",
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/es",
                    "id": "es",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Sri Lanka",
                        "supportedLanguageTags": [
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/lk",
                    "id": "lk",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "St. Kitts and Nevis",
                        "supportedLanguageTags": [
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/kn",
                    "id": "kn",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Swaziland",
                        "supportedLanguageTags": [
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/sz",
                    "id": "sz",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "sv",
                        "name": "Sweden",
                        "supportedLanguageTags": [
                            "sv",
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/se",
                    "id": "se",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "de-CH",
                        "name": "Switzerland",
                        "supportedLanguageTags": [
                            "de-CH",
                            "de-DE",
                            "en-GB",
                            "fr-FR",
                            "it"
                        ]
                    },
                    "href": "/v1/storefronts/ch",
                    "id": "ch",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "zh-Hant-TW",
                        "name": "Taiwan",
                        "supportedLanguageTags": [
                            "zh-Hant-TW",
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/tw",
                    "id": "tw",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Tajikistan",
                        "supportedLanguageTags": [
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/tj",
                    "id": "tj",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Thailand",
                        "supportedLanguageTags": [
                            "en-GB",
                            "th"
                        ]
                    },
                    "href": "/v1/storefronts/th",
                    "id": "th",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Trinidad and Tobago",
                        "supportedLanguageTags": [
                            "en-GB",
                            "fr-FR"
                        ]
                    },
                    "href": "/v1/storefronts/tt",
                    "id": "tt",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Turkey",
                        "supportedLanguageTags": [
                            "en-GB",
                            "tr"
                        ]
                    },
                    "href": "/v1/storefronts/tr",
                    "id": "tr",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Turkmenistan",
                        "supportedLanguageTags": [
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/tm",
                    "id": "tm",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "UAE",
                        "supportedLanguageTags": [
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/ae",
                    "id": "ae",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Uganda",
                        "supportedLanguageTags": [
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/ug",
                    "id": "ug",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Ukraine",
                        "supportedLanguageTags": [
                            "en-GB",
                            "uk",
                            "ru"
                        ]
                    },
                    "href": "/v1/storefronts/ua",
                    "id": "ua",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "United Kingdom",
                        "supportedLanguageTags": [
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/gb",
                    "id": "gb",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-US",
                        "name": "United States",
                        "supportedLanguageTags": [
                            "en-US",
                            "es-MX"
                        ]
                    },
                    "href": "/v1/storefronts/us",
                    "id": "us",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Uzbekistan",
                        "supportedLanguageTags": [
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/uz",
                    "id": "uz",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "es-MX",
                        "name": "Venezuela",
                        "supportedLanguageTags": [
                            "es-MX",
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/ve",
                    "id": "ve",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Vietnam",
                        "supportedLanguageTags": [
                            "en-GB",
                            "vi"
                        ]
                    },
                    "href": "/v1/storefronts/vn",
                    "id": "vn",
                    "type": "storefronts"
                },
                {
                    "attributes": {
                        "defaultLanguageTag": "en-GB",
                        "name": "Zimbabwe",
                        "supportedLanguageTags": [
                            "en-GB"
                        ]
                    },
                    "href": "/v1/storefronts/zw",
                    "id": "zw",
                    "type": "storefronts"
                }
            ]
        }
    """)
