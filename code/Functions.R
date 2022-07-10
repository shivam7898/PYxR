if(!exists("q_")) {
  q_ <- NULL
  
  # Matrix to log URL on each page
  q_url <- matrix(nrow = 0, ncol = 4, byrow = TRUE, 
                  dimnames = list(NULL, c("ORIGINAL", "DISPLAY", "URL", "OUT")))
  # Test
  #q_url <- rbind(q_url, c("{pandas}", "[pandas]", 
  #               "https://pandas.pydata.org/docs/user_guide/index.html"))
  
  q_link <- function(x, usr_txt = NA) {
    # Convert String to the link of Python Module Help
	url_row <- match(x, q_url[, "ORIGINAL"])
	if(!is.na(url_row)) {
	    out <- q_url[url_row, "OUT"]
	} else {
	    is_found <- FALSE
	    # Set Flag for Modules & remove braces {}
	    if(all(identical("{", substr(x, 1, 1)),
               identical(substr(x, nchar(x), nchar(x)), "}"))) {
		    is_module <- TRUE
		    y <- substr(x, 2, nchar(x) - 1)
		} else {
			is_module <- FALSE
		    y <- x
		}
		
		# Set Flag for Methods & remove trailing parentheses ()
	    # Python does not allow method & property with same names
	    is_method <- identical("()", substr(y, nchar(y) - 1, nchar(y)))
		# Drop ALL Parentheses (Not only the trailing ones)
	    y <- gsub(pattern = "()", replacement = "", y, fixed = TRUE)
		# Split on dots
		z <- strsplit(y, "[.]")[[1]]
        cat(" x: ", x, "\n", "y: ", y, "\n", "z: ", z, "\n")
        
		if(is_module) {
		    # Modules: q_link("{lib.copy}"), q_link("{pandas}")
			is_found <- TRUE
			modules  <- c("pandas", "pyarrow", "rpy2")
			if(z[1] == "lib") {
			    txt <- z[2]
			    url <- paste0("https://docs.python.org/3/library/", txt, ".html")
                shw <- ifelse(!is.na(usr_txt), usr_txt, txt)
				#cat("txt: ", txt, "\n", "shw: ", shw, "\n", "url: ", url, "\n")
			} else if(z[1] %in% modules) {
			    txt <- z[1]
				url <- paste0("https://pypi.org/project/", txt)
                shw <- ifelse(!is.na(usr_txt), usr_txt, txt)
			} else {
			    is_found <- FALSE
			}
		} else {
			if(z[1]  == "lib") {
			    # Methods: q_link("lib.functions.print()")
			    is_found <- TRUE
				txt <- paste0(z[2], ".html")
				if(length(z) == 3L) txt <- paste0(txt, "#", z[3])
				url <- paste0("https://docs.python.org/3/library/", txt)
				shw <- ifelse(!is.na(usr_txt), usr_txt, 
				              ifelse(is_method, paste0(z[length(z)], "()"), z[length(z)]))

			} else if(z[1] %in% c("pandas", "pd")) {
			    # Methods: q_link("pd.DataFrame()"), q_link("pd.DataFrame.head()")
			    is_found <- TRUE
			    if(z[2] == "[]") {
				    url <- "https://pandas.pydata.org/pandas-docs/stable/user_guide/indexing.html"
					shw <- txt <- "[]"
				} else {
				    txt <- paste0(z[-1], collapse = ".")
					url <- paste0("https://pandas.pydata.org/docs/reference/api/pandas.", txt, ".html")
					shw <- ifelse(!is.na(usr_txt), usr_txt, 
					              ifelse(is_method, paste0(z[length(z)], "()"), z[length(z)]))
			    } 
			} else if(z[1] == "pyarrow") {
			    # Methods: q_link("pyarrow.feather.write_feather()")
			    is_found <- TRUE
			    txt <- paste0(z[-1], collapse = ".")
				# feather.write_feather.html
				url <- paste0("https://arrow.apache.org/docs/python/generated/pyarrow.", txt, ".html")
				shw <- ifelse(!is.na(usr_txt), usr_txt, 
				              ifelse(is_method, paste0(z[length(z)], "()"), z[length(z)])) 
			} else {
			    #
			}
		}
        #cat(" txt: ", txt, "\n", "shw: ", shw, "\n", "url: ", url, "\n")
		out <- ifelse(is_found, paste0("[", shw, "](", url, ")"), NULL)
		#print(out)
		# Log in global object using double arrow
		if(is_found) q_url <<- rbind(q_url, c(x, shw, url, out))
	}
	return(out)
  }

} else print("R Functions not loaded again.")
