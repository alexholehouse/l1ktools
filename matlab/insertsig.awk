BEGIN{
    if (!comment)
	comment="^#"
    done=0
    datestr = strftime("%b.%d.%Y %H:%M:%S %Z")
#    "svnversion ./|sed s/[MS]//"|getline verstr
#    split(verstr,a,":")
#    verstr=a[2]
}

! ($0 ~ comment) {
    if (NR>1 && !done) {
	done=1
	str = substr(comment,2)
	print ""
	print str " Copyright 2011,2012 Broad Institute of MIT and Harvard, L1000 Informatics Team."
	print str " This program is distributed under the terms of the BSD 2-Clause license."
	print str " See LICENSE.TXT or http://www.opensource.org/licenses/BSD-2-Clause for details"
    }
}

{print}
