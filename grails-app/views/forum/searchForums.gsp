<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Volunteer Portal - Atlas of Living Australia</title>
        <meta name="layout" content="${grailsApplication.config.ala.skin}"/>
        %{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'vp.css')}"/>--}%
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'forum.css')}"/>
        <script type="text/javascript" src="${resource(dir: 'js/fancybox', file: 'jquery.fancybox-1.3.4.pack.js')}"></script>
        <link rel="stylesheet" href="${resource(dir: 'js/fancybox', file: 'jquery.fancybox-1.3.4.css')}"/>

        <style type="text/css">
        </style>

    </head>

    <body class="content">

        <r:script type="text/javascript">

            $(document).ready(function() {
            });

        </r:script>

        <cl:headerContent title="Search results: '${query}'" selectedNavItem="forum">
            <%
                pageScope.crumbs = [
                        [link:createLink(controller:'forum', action:'index'), label:'Forum']
                ]
            %>
        </cl:headerContent>

        <div class="container">
            <p>
                <strong>${results.totalCount} matching message${results.totalCount == 1 ? '' : 's'} found.</strong>
            </p>
            <section id="searchResults">
                <vpf:messagesTable messages="${results}" />
                %{--<vpf:searchResultsTable searchResults="${results}"/>--}%
            </section>
        </div>

    </body>
</html>
