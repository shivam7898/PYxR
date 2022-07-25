## ---- Q00 ----

if(TRUE || !exists('q_')) {
  #q_ <- NULL

  # Matrix to log URL on each page
  q_url <- matrix(nrow = 0, ncol = 4, byrow = TRUE, 
                  dimnames = list(NULL, c('ORIGINAL', 'DISPLAY', 'URL', 'OUT')))
  # Test
  #q_url <- rbind(q_url, c('{pandas}', '[pandas]', 
  #               'https://pandas.pydata.org/docs/user_guide/index.html'))

## ---- Q01-link ----
  
  q_link <- function(x, usr_txt = NA) {
    # Convert String to the link of Python Module Help
	url_row <- match(x, q_url[, 'ORIGINAL'])
	if(!is.na(url_row)) {
	    out <- q_url[url_row, 'OUT']
	} else {
	    is_found <- FALSE
	    # Set Flag for Modules & remove braces {}
	    if(all(identical('{', substr(x, 1, 1)),
               identical(substr(x, nchar(x), nchar(x)), '}'))) {
		    is_module <- TRUE
		    y <- substr(x, 2, nchar(x) - 1)
		} else {
			is_module <- FALSE
		    y <- x
		}
		
		# Set Flag for Methods & remove trailing parentheses ()
	    # Python does not allow method & property with same names
	    is_method <- identical('()', substr(y, nchar(y) - 1, nchar(y)))
		# Drop ALL Parentheses (Not only the trailing ones)
	    y <- gsub(pattern = '()', replacement = '', y, fixed = TRUE)
		# Split on dots
		z <- strsplit(y, '[.]')[[1]]
        #cat(' x: ', x, '\n', 'y: ', y, '\n', 'z: ', z, '\n')
        
		if(is_module) {
		    # Modules: q_link('{lib.copy}'), q_link('{pandas}')
			is_found <- TRUE
			modules  <- c('pandas', 'pyarrow', 'rpy2')
			if(z[1] == 'lib') {
				txt <- z[2]
			    url <- paste0('https://docs.python.org/3/library/', txt, '.html')
                shw <- ifelse(!is.na(usr_txt), usr_txt, txt)
				#cat('txt: ', txt, '\n', 'shw: ', shw, '\n', 'url: ', url, '\n')
			} else if(z[1] %in% modules) {
			    txt <- z[1]
				url <- paste0('https://pypi.org/project/', txt)
                shw <- ifelse(!is.na(usr_txt), usr_txt, txt)
			} else {
			    is_found <- FALSE
			}
		} else {
			if(z[1] %in% c('lib', 'ref')) {
			    # q_link('lib.functions.print()') 
				#   https://docs.python.org/3/library/functions.html#print
				# q_link('ref.compound_stmts.the-with-statement', 'with()')
				#   https://docs.python.org/3/reference/compound_stmts.html#the-with-statement
				# q_link('lib.os.path.exists()')
				#   https://docs.python.org/3/library/os.path.html#os.path.exists
			    is_found <- TRUE
				txt <- ifelse(z[1] == 'lib', 'library', 'reference')
				url <- paste0('https://docs.python.org/3/', txt, '/')
				#txt <- paste0(z[2], '.html')
				txt <- ifelse(length(z) > 3, paste0(z[2:{length(z)-1}], collapse = '.'), z[2]) 
				txt <- paste0(txt, '.html')
				if(z[2] == 'os') {
				    txt <- paste0(txt, '#', paste0(z[-1], collapse = '.'))
				} else {
				    txt <- paste0(txt, '#', z[3])
				}

				url <- paste0(url, txt)
				shw <- ifelse(!is.na(usr_txt), usr_txt, 
				              ifelse(is_method, paste0(z[length(z)], '()'), z[length(z)]))

			} else if(z[1] %in% c('pandas', 'pd')) {
			    # Methods: q_link('pd.DataFrame()'), q_link('pd.DataFrame.head()')
			    is_found <- TRUE
			    if(z[2] == '[]') {
				    url <- 'https://pandas.pydata.org/pandas-docs/stable/user_guide/indexing.html'
					shw <- txt <- '[]'
				} else {
				    txt <- paste0(z[-1], collapse = '.')
					url <- paste0('https://pandas.pydata.org/docs/reference/api/pandas.', txt, '.html')
					shw <- ifelse(!is.na(usr_txt), usr_txt, 
					              ifelse(is_method, paste0(z[length(z)], '()'), z[length(z)]))
			    } 
			} else if(z[1] == 'pyarrow') {
			    # Methods: q_link('pyarrow.feather.write_feather()')
			    is_found <- TRUE
			    txt <- paste0(z[-1], collapse = '.')
				# feather.write_feather.html
				url <- paste0('https://arrow.apache.org/docs/python/generated/pyarrow.', txt, '.html')
				shw <- ifelse(!is.na(usr_txt), usr_txt, 
				              ifelse(is_method, paste0(z[length(z)], '()'), z[length(z)])) 
			} else {
			    #
			}
		}
        cat(' txt: ', txt, '\n', 'shw: ', shw, '\n', 'url: ', url, '\n')
		out <- ifelse(is_found, paste0('[', shw, '](', url, ')'), NULL)
		#print(out)
		# Log in global object using double arrow
		if(is_found) q_url <<- rbind(q_url, c(x, shw, url, out))
	}
	return(out)
  }

## ---- Q02-so ----

  q_so <- function(x) {
    # q_so('q27044727') q_so('a5965451') q_so('a/5965451')
    y <- tolower(substr(x, 1, 1))
	z <- gsub('/', '', substr(x, 2, nchar(x))) 
	txt <- ifelse(y == 'q', 'questions', 'a')
	out <- paste0('[(SO)](', 'https://stackoverflow.com/', txt, '/', z, ')')
	return(out)
  }

## ---- Q03-null-na ----

  q_NULL_to_NA <- function(x) {
    # Convert DataFrame list columns containing NULL or NaN to vector with NA
	# Ex: mutate(aa, across(where(is.list), q_NULL_to_NA))
	# Unlike is.na(), is.null() is not vectorised & is.nan() is not for list
	x[sapply(x, \(y) is.null(y) || is.nan(y))] <- NA
    x <- unlist(x)
    return(x)
  }

## ---- Q04-kbl ----

  q_kbl <- function(x, cap = NULL, headers = names(x), debug = FALSE, maxrows = 20L) {
    # Print Kable Standard Formats: q_kbl(hh, cap_hh, headers = names_hh, debug = TRUE, maxrows = 10)
    # Kable Prints FULL DATASET. Avoid Printing more rows than maxrows
	if(nrow(x) > maxrows) x <- head(x, maxrows)
	# In debug mode (inside RStudio) print in white, otherwise black
    txt_colour <- ifelse(debug, 'black', 'white')
    out <- kbl(x, caption = cap, col.names = headers, escape = FALSE, 
	              align = 'c', booktabs = TRUE) |> 
    kable_styling(bootstrap_options = c('striped', 'hover', 'condensed', 'responsive'),
                  html_font = 'Consolas', font_size = 12, full_width = FALSE,
                  #position = 'float_left',
                  fixed_thead = TRUE) |> 
    # Header Row Dark & Bold: RGB (48, 48, 48) =HEX (#303030)
	row_spec(0, color = 'white', background = '#303030', bold = TRUE,
	           extra_css = 'border-bottom: 1px solid; border-top: 1px solid') |> 
	row_spec(row = 1:nrow(x), color = txt_colour)
  return(out)
  }

## ---- Q05-q ----

  q_ <- function() {
    # List Additional Objects
	x <- ls(.GlobalEnv)
	# Match object names starting with "q_" and drop them from the vector
    x_drop <- grepl("^q_", x)
    x <- x[!x_drop]
	paste0(x, collapse = ", ")
  }

## ---- Q99-Z ----

} else print('R Functions not loaded again.')
