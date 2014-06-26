[

	/* ==========================================================
		uuidsmall is a container for an 8 char random string
		
		usage:
		
			local(x = uuidsmall)
			'uuidsmall '+#x+'\r'
			#x->new
			
			'#x '+#x
			#x = 'ddd'
			'#x new = '+#x
			
			>> uuidsmall 
			>> #x 2pfRgoXT
			>> #x new = ddd
		
		deliberately does NOT populate onCreate
	========================================================== */

	define uuidsmall => type {
		trait { 
			import std_pwd
		}
		data 
			public str::string
			
			
		public new() => { .str = .genPwdAlpha }
		public onCompare(val) => { 
			.str != #val->asString ? return .str < #val->asString ? -1 | 1
			return 0
		}
		public onConvert() => { return .str }
		public asString() => { return .str }
		public size() => { return .str->size }
	}
]
