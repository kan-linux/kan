/^#/ {}
$1 == prog {
    url=$2 ; for (v in file_vars) gsub("@" v "@",file_vars[v],url) ;
    print url ; exit }
$1 == "@setvar" && NF == 3 { file_vars[$2] = $3 }
