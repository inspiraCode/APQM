function formatDate(theDate) {
    theDate = new Date(theDate);
    if (theDate.getMonth() == 1 && theDate.getFullYear() == 1985) {
        return "";
    } else {
        return '' + (theDate.getMonth() + 1) + '/' + theDate.getDate() + '/' + theDate.getFullYear();
    }
}
function formatDateTime(theDate) {
    theDate = new Date(theDate);
    if (theDate.getMonth() == 1 && theDate.getFullYear() == 1985) {
        return "";
    } else {
        return theDate.toLocaleString();
    }
}

function getJSONDate(strDate) {
    if (jQuery.trim(strDate) == "") {
        return (new Date(1985, 1, 10)).toJSON();
    } else {
        return (new Date(strDate)).toJSON();
    }
}