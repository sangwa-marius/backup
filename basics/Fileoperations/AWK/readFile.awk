#!/usr/bin/awk -f

BEGIN{
    FS = ","
    print "Processing file..."
}

NR > 1{
    sum += $3
    count++
    print $3
}

END{
    if(count > 0){
        average = sum/count
        print "The average marks of the students is: "average
    }else{
        print "No student marks found"
    }

    print count
    print $3
}