macro(check_lib var lib required)
	pkg_search_module(${var} ${lib})
	if(${var}_FOUND)
		message("${lib} found")
	else()
		find_library(${var} ${lib})
		if(${var})
			message("${lib} found")
			set(${var}_FOUND 1 CACHE INTERNAL "")
		else()
			if(${required})
				message(FATAL_ERROR "${lib} is required but not found")
			else()
				message("${lib} not found")
			endif()
		endif()
	endif()
endmacro()

