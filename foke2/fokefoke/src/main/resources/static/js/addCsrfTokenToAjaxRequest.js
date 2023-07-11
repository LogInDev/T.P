function addCsrfTokenToAjaxRequest(xhr) {
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    xhr.setRequestHeader(header, token);
}
function getToke(xhr) {
    var token = $("meta[name='_csrf']").attr("content");
    return token;
}
