function closeLoading() {
    $("#loadingDiv").fadeOut("normal", function () {
        $(this).remove();
    });
}

var no;
$.parser.onComplete = function () {
    if (no) clearTimeout(no);
    no = setTimeout(closeLoading, 1000);
}