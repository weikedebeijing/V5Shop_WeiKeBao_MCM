function ModifyOrderTagID(orderNumbers) {

    $.ajax({
        type: "post",
        url: "../../OrderForm/ModifyOrderTagID",
        data: { "multiOrderIDStr": JSON.stringify(orderNumbers)},
        success: function (data) {
        }
    });
}