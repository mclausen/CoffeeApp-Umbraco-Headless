/* 
Copyright (c) 2019 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct IImage : Codable {
	let _creatorName : String?
	let _url : String?
	let _writerName : String?
	let _hasChildren : Bool?
	let _level : Int?
	let _createDate : String?
	let _id : String?
	let _updateDate : String?
	let _links : String?
	let mediaTypeAlias : String?
	let name : String?
	let sortOrder : Int?
	let umbracoFile : UmbracoFile?
	let umbracoWidth : Int?
	let umbracoHeight : Int?
	let umbracoBytes : Int?
	let umbracoExtension : String?

	enum CodingKeys: String, CodingKey {

		case _creatorName = "_creatorName"
		case _url = "_url"
		case _writerName = "_writerName"
		case _hasChildren = "_hasChildren"
		case _level = "_level"
		case _createDate = "_createDate"
		case _id = "_id"
		case _updateDate = "_updateDate"
		case _links = "_links"
		case mediaTypeAlias = "mediaTypeAlias"
		case name = "name"
		case sortOrder = "sortOrder"
		case umbracoFile = "umbracoFile"
		case umbracoWidth = "umbracoWidth"
		case umbracoHeight = "umbracoHeight"
		case umbracoBytes = "umbracoBytes"
		case umbracoExtension = "umbracoExtension"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		_creatorName = try values.decodeIfPresent(String.self, forKey: ._creatorName)
		_url = try values.decodeIfPresent(String.self, forKey: ._url)
		_writerName = try values.decodeIfPresent(String.self, forKey: ._writerName)
		_hasChildren = try values.decodeIfPresent(Bool.self, forKey: ._hasChildren)
		_level = try values.decodeIfPresent(Int.self, forKey: ._level)
		_createDate = try values.decodeIfPresent(String.self, forKey: ._createDate)
		_id = try values.decodeIfPresent(String.self, forKey: ._id)
		_updateDate = try values.decodeIfPresent(String.self, forKey: ._updateDate)
		_links = try values.decodeIfPresent(String.self, forKey: ._links)
		mediaTypeAlias = try values.decodeIfPresent(String.self, forKey: .mediaTypeAlias)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		sortOrder = try values.decodeIfPresent(Int.self, forKey: .sortOrder)
		umbracoFile = try values.decodeIfPresent(UmbracoFile.self, forKey: .umbracoFile)
		umbracoWidth = try values.decodeIfPresent(Int.self, forKey: .umbracoWidth)
		umbracoHeight = try values.decodeIfPresent(Int.self, forKey: .umbracoHeight)
		umbracoBytes = try values.decodeIfPresent(Int.self, forKey: .umbracoBytes)
		umbracoExtension = try values.decodeIfPresent(String.self, forKey: .umbracoExtension)
	}

}
