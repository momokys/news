const ajax = {
    get: function (url, data, handler) {

        /*$.ajax({
            type : "GET",
            url : url,
            success : function(resp) {
                if (resp.msg.length > 0) {
                    if (resp.code === -1) {
                        layer.msg(resp.msg, {
                            icon: 5,
                            anim: 6
                        })
                    } else {
                        layer.msg(resp.msg, {
                            icon: 6,
                        })
                    }
                }
                if (handler != null) {
                    handler(resp)
                }
            }
        });*/

        $.get(url, function (resp) {
            if (resp.msg.length > 0) {
                if (resp.code === -1) {
                    layer.msg(resp.msg, {
                        icon: 5,
                        anim: 6
                    })
                } else {
                    layer.msg(resp.msg, {
                        icon: 6,
                    })
                }
            }
            if (handler != null) {
                handler(resp)
            }
        })
    },
    post: function (url, data, handler, dataType) {

        /*$.ajax({
            type : "POST",
            contentType: "application/json;charset=UTF-8",
            url : url,
            data : data,
            success : function(resp) {
                if (handler != null) {
                    handler(resp)
                }
                if (resp.msg.length > 0) {
                    if (resp.code === -1) {
                        layer.msg(resp.msg, {
                            icon: 5,
                            anim: 6
                        })
                    } else {
                        layer.msg(resp.msg, {
                            icon: 6,
                        })
                    }
                }
            }
        });*/

        $.post(url,data, function (resp) {
            if (handler != null) {
                handler(resp)
            }
            if (resp.msg.length > 0) {
                if (resp.code === -1) {
                    layer.msg(resp.msg, {
                        icon: 5,
                        anim: 6
                    })
                } else {
                    layer.msg(resp.msg, {
                        icon: 6,
                    })
                }
            }
        },dataType)
    },

}