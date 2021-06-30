/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation

struct Location : Codable {
	let af : String?
	let ar : String?
	let ascii : String?
	let az : String?
	let bg : String?
	let ca : String?
	let da : String?
	let de : String?
	let el : String?
	let en : String?
	let eu : String?
	let fa : String?
	let feature_name : String?
	let fi : String?
	let fr : String?
	let gl : String?
	let he : String?
	let hi : String?
	let hr : String?
	let hu : String?
	let id : String?
	let it : String?
	let ja : String?
	let la : String?
	let lt : String?
	let mk : String?
	let nl : String?
	let no : String?
	let pl : String?
	let pt : String?
	let ro : String?
	let ru : String?
	let sk : String?
	let sl : String?
	let sr : String?
	let th : String?
	let tr : String?
	let vi : String?
	let zu : String?

	enum CodingKeys: String, CodingKey {
		case af = "af"
		case ar = "ar"
		case ascii = "ascii"
		case az = "az"
		case bg = "bg"
		case ca = "ca"
		case da = "da"
		case de = "de"
		case el = "el"
		case en = "en"
		case eu = "eu"
		case fa = "fa"
		case feature_name = "feature_name"
		case fi = "fi"
		case fr = "fr"
		case gl = "gl"
		case he = "he"
		case hi = "hi"
		case hr = "hr"
		case hu = "hu"
		case id = "id"
		case it = "it"
		case ja = "ja"
		case la = "la"
		case lt = "lt"
		case mk = "mk"
		case nl = "nl"
		case no = "no"
		case pl = "pl"
		case pt = "pt"
		case ro = "ro"
		case ru = "ru"
		case sk = "sk"
		case sl = "sl"
		case sr = "sr"
		case th = "th"
		case tr = "tr"
		case vi = "vi"
		case zu = "zu"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		af = try values.decodeIfPresent(String.self, forKey: .af)
		ar = try values.decodeIfPresent(String.self, forKey: .ar)
		ascii = try values.decodeIfPresent(String.self, forKey: .ascii)
		az = try values.decodeIfPresent(String.self, forKey: .az)
		bg = try values.decodeIfPresent(String.self, forKey: .bg)
		ca = try values.decodeIfPresent(String.self, forKey: .ca)
		da = try values.decodeIfPresent(String.self, forKey: .da)
		de = try values.decodeIfPresent(String.self, forKey: .de)
		el = try values.decodeIfPresent(String.self, forKey: .el)
		en = try values.decodeIfPresent(String.self, forKey: .en)
		eu = try values.decodeIfPresent(String.self, forKey: .eu)
		fa = try values.decodeIfPresent(String.self, forKey: .fa)
		feature_name = try values.decodeIfPresent(String.self, forKey: .feature_name)
		fi = try values.decodeIfPresent(String.self, forKey: .fi)
		fr = try values.decodeIfPresent(String.self, forKey: .fr)
		gl = try values.decodeIfPresent(String.self, forKey: .gl)
		he = try values.decodeIfPresent(String.self, forKey: .he)
		hi = try values.decodeIfPresent(String.self, forKey: .hi)
		hr = try values.decodeIfPresent(String.self, forKey: .hr)
		hu = try values.decodeIfPresent(String.self, forKey: .hu)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		it = try values.decodeIfPresent(String.self, forKey: .it)
		ja = try values.decodeIfPresent(String.self, forKey: .ja)
		la = try values.decodeIfPresent(String.self, forKey: .la)
		lt = try values.decodeIfPresent(String.self, forKey: .lt)
		mk = try values.decodeIfPresent(String.self, forKey: .mk)
		nl = try values.decodeIfPresent(String.self, forKey: .nl)
		no = try values.decodeIfPresent(String.self, forKey: .no)
		pl = try values.decodeIfPresent(String.self, forKey: .pl)
		pt = try values.decodeIfPresent(String.self, forKey: .pt)
		ro = try values.decodeIfPresent(String.self, forKey: .ro)
		ru = try values.decodeIfPresent(String.self, forKey: .ru)
		sk = try values.decodeIfPresent(String.self, forKey: .sk)
		sl = try values.decodeIfPresent(String.self, forKey: .sl)
		sr = try values.decodeIfPresent(String.self, forKey: .sr)
		th = try values.decodeIfPresent(String.self, forKey: .th)
		tr = try values.decodeIfPresent(String.self, forKey: .tr)
		vi = try values.decodeIfPresent(String.self, forKey: .vi)
		zu = try values.decodeIfPresent(String.self, forKey: .zu)
	}

}
