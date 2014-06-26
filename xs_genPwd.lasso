[ 
	/* ====================================================================
		Password generate process
		Simple usage: 
			xs_genPwd
			xs_genPwd(16)
		Policy Enforcement: 
			xs_StrictPwd(8,-special=1)
			xs_StrictPwd(8,-special=1,-lower=1,-upper=1,-numbers=1)
			xs_StrictPwd(16,-special=4,-lower=1,-upper=1,-numbers=1,-specialchars=array('$','*','!','^','%','@','™'))
	====================================================================*/

		/* ====================================================================
			Create Password
		====================================================================*/
		define xs_genPwd(
			size::integer,
			specialchars::array
		) => {
			local(pMap = array(
				'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
				'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','X','Y','Z',
				'1','2','3','4','5','6','7','8','9','0'
				)
			)
			#specialchars->size ? #pMap->merge(#specialchars)
			local(thisPwd = string)
			loop(#size) => { #thisPwd->append(#pMap->get(integer_random(#pMap->size,1))) }
			return #thisPwd
		}
		define xs_genPwd(size::integer) => { return xs_genPwd(#size,array('$','*','!')) }
		define xs_genPwd() => { return xs_genPwd(8,array('$','*','!')) }
		
		
		/* ====================================================================
			Check to ensure it follows policy
		====================================================================*/
		define xs_isStrictPwd(
			pwd::string,
			-min::integer=8,
			-lower::integer=0,
			-upper::integer=0,
			-numbers::integer=0,
			-special::integer=0,
			-specialchars::array=array('$','*','!')
		) => {
			// reject on not meeting min size
			#min > 0 && #pwd->size < #min ? return false
			
			// count ocurrences
			local(countlower = 0, countupper = 0, countnumbers = 0, countspecial = 0)
			with c in #pwd->values do => {
				#c->isalpha && #c->isupper ? #countupper++ 
				#c->isalpha && #c->islower ? #countlower++ 
				string_isnumeric(#c) ? #countnumbers++
				#specialchars >> #c ? #countspecial++
			}
			
			#countlower < #lower ? return false
			#countupper < #upper ? return false
			#countnumbers < #numbers ? return false
			#countspecial < #special ? return false
			return true
		}


		/* ====================================================================
			Check to ensure it follows policy
		====================================================================*/
		define xs_StrictPwd(
			size::integer=8,
			-lower::integer=0,
			-upper::integer=0,
			-numbers::integer=0,
			-special::integer=0,
			-specialchars::array=array('$','*','!')
		) => {
			local(pwd = xs_genPwd(#size,#specialchars))	
			while(not xs_isStrictPwd(
				#pwd,
				-lower=#lower,
				-upper=#upper,
				-numbers=#numbers,
				-special=#special,
				-specialchars=#specialchars
				)
			) => {#pwd = xs_genPwd(#size,#specialchars)}
			return #pwd
		}

		
		
]
