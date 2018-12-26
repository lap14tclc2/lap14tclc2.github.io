$(document).ready(function () {
    $("#searchUser").on('click', function (event) {
        event.preventDefault();
        var username = $("#username").val();
        $.ajax({
            url: 'https://api.github.com/users/' + username,
            data: {
                client_id: '51fa5fbd21914a21e0b0',
                client_secret: '70bf0e9f8456be7ccf7d6dc7413e4914c2b92232'
            }
        }).done(function (user) {
            //get repo using ajax
            $.ajax({
                url: 'https://api.github.com/users/' + username + "/repos",
                data: {
                    client_id: '51fa5fbd21914a21e0b0',
                    client_secret: '70bf0e9f8456be7ccf7d6dc7413e4914c2b92232'
                }
            }).done(function(repos){
                for(i = 0; i < repos.length; i++){
                    $("#repos .panel-body").append(`
                        <div class="well" style="display:flex; justify-content: center;">
                            <div class="col-md-12 col-lg-12 col-xs-12">
                                <div class="col-md-6 col-lg-6 col-xs-12">
                                    <span class="repo-name">${repos[i].name}</span>
                                    <span class="repo-description">${repos[i].description}</span>
                                </div>
                                <div class="col-md-4 col-lg-4 col-xs-12">
                                    <span class="label repo-fork label-default">${"Forks: " + repos[i].forks}</span>
                                    <span class="label repo-watchers label-primary">${"Watchers: " + repos[i].watchers}</span>
                                    <span class="label repo-stars label-success">${"Stars: " + repos[i].stargazers_count}</span>
                                </div>
                                <div class="col-md-2 col-lg-2 col-xs-12">
                                    <a style="text-decoration:none; background:#111; color:#fff;text-align:center; padding:5px;" class="repo-link" href="${repos[i].html_url}" class="btn btn-primary">Repo page</a>
                                </div>
                            </div>
                        </div>
                    `);
                    $("#repos").css   ('display','block');

                }
            });


            // insert value for profile section
            $('#profile .panel-title').text(user.login);
            $('#profile img.img-profile').attr('src', "" + user.avatar_url);
            $('#profile span.public-repos').text("Public Repos: " + user.public_repos);
            $('#profile span.public-gist').text("Public Gists: " + user.public_gists);
            $('#profile span.followers').text("Followers: " + user.followers);
            $('#profile span.following').text("Following: " + user.following);
            $('#profile ul.list-group li:eq(0)').text("Company: " + user.company);
            $('#profile ul.list-group li:eq(1)').text("Website/Blog: " + user.blog);
            $('#profile ul.list-group li:eq(2)').text("Location: " + user.location);
            $('#profile ul.list-group li:eq(3)').text("Member since: " + user.created_at);
            $('#profile').css('display', 'block');
        });
        // clear text after make request by ajax
        $("#username").val('');
    });


});