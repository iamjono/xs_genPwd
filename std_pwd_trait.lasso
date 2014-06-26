[
	/* ==========================================================
		PWD gen trait
		derivative of xs_genPwd
	========================================================== */
	

	define std_pwd => trait {
	
		provide genPwd(size::integer=8) => {
			local(pMap = array('!','$','%','&','*','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','X','Y','Z','a','1','2','3','4','5','6','7','8','9','0'))
			local(thisPwd = string)
			loop(#size) => {
				#thisPwd->append(#pMap->get(integer_random(#pMap->size,1)))
			}
			return #thisPwd
		}
		provide genPwdAlpha(size::integer=8) => {
			local(pMap = array('a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','X','Y','Z','a','1','2','3','4','5','6','7','8','9','0'))
			local(thisPwd = string)
			loop(#size) => {
				#thisPwd->append(#pMap->get(integer_random(#pMap->size,1)))
			}
			return #thisPwd
		}
	}
]
