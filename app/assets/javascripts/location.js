$(function() {
    if ("geolocation" in navigator) {
        navigator.geolocation.getCurrentPosition(function(position) {
            // トップの form から送信する要素に加える
            $("#lat_form").val(position.coords.latitude);
            $("#lng_form").val(position.coords.longitude);
            // 「行く」ボタンから送信する要素に加える
            $("#lat_go-button").val(position.coords.latitude);
            $("#lng_go-button").val(position.coords.longitude);
        });
        // 緯度・経度を加えた後にsubmit
        // document.form.submit();
    } else {
        alert("geolocation IS NOT available");
    }
})
