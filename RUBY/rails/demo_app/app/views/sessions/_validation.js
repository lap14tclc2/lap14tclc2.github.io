$("#new_user").validate({
    //error place
    errorPlacement: function(error, element) {
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
    }
});