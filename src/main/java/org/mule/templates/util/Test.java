/**
 * Mule Anypoint Template
 *
 * Copyright (c) MuleSoft, Inc.  All rights reserved.  http://www.mulesoft.com
 */

package org.mule.templates.util;

import org.joda.time.DateTime;


public class Test {
	public static void main(String[] args){
		System.err.println("ssss");
		DateTime d = org.mule.templates.date.DateUtils.ISOStringDateToDateTime("2014-07-22T17:38:15Z");
		DateTime d1 = org.mule.templates.date.DateUtils.ISOStringDateToDateTime("2014-07-23T17:38:15Z");
		DateTime d2 = org.mule.templates.date.DateUtils.stringToDateTimeWithProvidedOffset("2014-07-21T17:38:15Z", "yyyy-MM-dd'T'HH:mm:ss'Z'", "-00:10:20");
		System.err.println(d2);
		System.err.println(d.compareTo(d2));
		boolean t = org.mule.templates.date.DateUtils.stringToDateTimeWithProvidedOffset("2014-07-21T17:38:15.000Z", "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", "-00:01:05").compareTo(org.mule.templates.date.DateUtils.stringToDateTimeWithProvidedOffset("2014-07-21T17:38:15.000Z", "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", "+00:00:00")) > 0;
	}
}
