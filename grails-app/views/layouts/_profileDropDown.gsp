<ul class="dropdown-menu">
    <li>
        <div class="navbar-login logged-in">
            <div class="row">
                <div class="col-lg-4">
                    <p class="text-center">
                        <img src="http://www.gravatar.com/avatar/${cl.showCurrentUserEmail().toLowerCase().encodeAsMD5()}?s=80"
                             class="img-circle img-responsive avatar"/>
                    </p>
                </div>

                <div class="col-lg-8">
                    <p class="text-left"><strong>${cl.showCurrentUserName()}</strong><br/><a
                            href="#">${cl.showCurrentUserEmail()}</a></p>
                </div>
            </div>
        </div>

    </li>
    <li class="divider"></li>
    <li>
        <div class="navbar-login navbar-login-session">
            <div class="row">
                <div class="col-lg-12">
                    <ul class="profile-links">
                        <li><a href="http://www.ala.org.au/my-profile" class="" target="_blank">View Profile</a></li>
                        <li><a href="${g.createLink(controller: 'user', action: 'notebook')}" class="">Notebook</a></li>
                        <li><a href="${g.createLink(controller: 'logout', action: 'logout', params: [casUrl: "${grailsApplication.config.casServerName}/cas/logout", appUrl: "${grailsApplication.config.grails.serverURL}"])}" class="">Logout</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </li>
</ul>
