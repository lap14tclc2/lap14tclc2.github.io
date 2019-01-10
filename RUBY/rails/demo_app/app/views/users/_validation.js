$(".signup-button").on("click", function () {
    $("#new_user").validate({
        //error place
        errorPlacement: function (error, element) {
            error.insertBefore(element);
        },

        //adding rule
        rules: {
            // email is require with format
            "user[email]": {
                required: true,
                email: true
            },

            // password is required
            "user[password]": {
                required: true,
                minlength: 6
            },
            // password confirm is require  and is the same with password
            "user[password_confirmation]": {
                required: true,
                minlength: 6,
                equalTo: "#user_password"
            }
        },

        //error message
        messages: {
            mail: {
                required: "Email is required",
                email: "Please enter the valid address",
                minlength: "Email must be more than 6"
            },
            password: {
                required: "Password is required",
                minlength: "Password must be more than 6"
            },
            password_confirmation: {
                required: "Confirm Password is required",
                minlength: "Confirm Password must be more than 6",
                equalTo: "Password and confirm password must be  same"
            }
        }
    });
})