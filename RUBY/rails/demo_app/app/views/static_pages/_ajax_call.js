$("#sendInput").on("click", function(event){
    var position = $("#numberPosition").val();
    var inputString  = $("#inputCipher").val();
    if (isNaN(position) || (inputString.match(/\d+/g) != null) || position.length == 0 ){
        $(".errorMessage").html("Invalid!")
        event.preventDefault();
    }
    else {
        Rails.ajax({
            type: 'POST',
            url: '/ciphers',
            data: "string=" + inputString + "&position=" + position,
            success: (result) => {
                $("#outputCipher").html(result);
            },
            error: (err) => {
                console.log("err");
            }  
        })
    }
});