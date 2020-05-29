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
