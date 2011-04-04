## This script extracts and logs variables from cookies sent by clients

@load http

module HTTP;

redef record State += {
	cookie_vars: vector of string &optional &log;
};

event http_header(c: connection, is_orig: bool, name: string, value: string) &priority=2
	{
	if ( is_orig && name == "COOKIE" )
		c$http$cookie_vars = extract_keys(value, /;[[:blank:]]*/);
	}