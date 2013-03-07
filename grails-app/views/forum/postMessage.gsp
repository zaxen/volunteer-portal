<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Volunteer Portal - Atlas of Living Australia</title>
        <meta name="layout" content="${grailsApplication.config.ala.skin}"/>
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'vp.css')}"/>
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'forum.css')}"/>
        <script type="text/javascript" src="${resource(dir: 'js/fancybox', file: 'jquery.fancybox-1.3.4.pack.js')}"></script>
        <link rel="stylesheet" href="${resource(dir: 'js/fancybox', file: 'jquery.fancybox-1.3.4.css')}"/>

        <style type="text/css">

        h2 {
            padding-top: 10px;
        }

        textarea {
            width: 100%;
        }

        </style>

    </head>

    <body class="sublevel sub-site volunteerportal">

        <script type="text/javascript">

            var replyTo = "${replyTo?.user?.displayName}";

            function getSelectedText() {
                var t = '';
                if (window.getSelection) {
                    t = window.getSelection();
                } else if (document.getSelection) {
                    t = document.getSelection();
                } else if (document.selection) {
                    t = document.selection.createRange().text;
                }
                if (t.anchorNode) {
                    var author = $(t.anchorNode).parents("div[author]").attr("author")
                    replyTo = author;
                }
                return t;
            }

            $(document).ready(function () {

                $("#btnInsertQuote").mousedown(function(e) {
                    e.preventDefault();

                    var selection = getSelectedText().toString();
                    if (selection && selection.length > 0) {
                        var message = "\n";
                        if ($("#insertTagLine").is(":checked")) {
                            message += "> *" + replyTo + " wrote:*  \n";
                        }
                        message += "> " + selection + "  ";

                        var txt = $("#messageText")
                        txt.val(txt.val() + message);
                    }

                });

                $("#btnCancel").click(function (e) {
                    e.preventDefault();
                    window.location = "${createLink(controller:'forum', action:'viewForumTopic', id: topic.id)}";
                });

            });

        </script>

        <cl:navbar selected=""/>

        <header id="page-header">
            <div class="inner">
                <cl:messages/>
                <vpf:forumNavItems topic="${topic}" lastLabel="${message(code:'forum.project.newMessage', default:'New Message')}" />
            </div>
        </header>

        <div>
            <div class="inner">

                <h3>Conversation history:</h3>
                <div style="height: 300px; overflow-y: scroll; border: 1px solid #a9a9a9" >
                    <g:each in="${topic.messages?.sort { it.date } }" var="reply">
                        <div class="messageReply" author="${reply.user.displayName}" style="border: 1px solid #a9a9a9; margin: 3px; padding: 3px; background: white">
                            <div style="background-color: #3a5c83; color: white">
                                <img src="${resource(dir:'/images', file:'reply.png')}" style="vertical-align: bottom"/>
                                On ${formatDate(date: reply.date, format: 'dd MMM yyyy')} at ${formatDate(date: reply.date, format: 'HH:mm:ss')} <strong>${reply.user.displayName}</strong> wrote:
                            </div>
                            <markdown:renderHtml>${reply.text}</markdown:renderHtml>
                        </div>
                    </g:each>

                </div>

                <div class="originalMessageButtons">
                    <button id="btnInsertQuote" class="button">Insert quote</button>
                    <label for="insertTagLine">Insert tag line</label>
                    <g:checkBox name="insertTagline" id="insertTagLine" checked="true"/>
                </div>

                <h2>Your message:</h2>
                <small>* Note: To see help on how to format your messages, including bold and italics, see <a href="${createLink(action:'markdownHelp')}" target="popup">here</a></small>
                <g:form id="messageForm" controller="forum">

                    <g:hiddenField name="topicId" value="${topic.id}"/>
                    <g:hiddenField name="replyTo" value="${replyTo?.id}"/>
                    <g:textArea id="messageText" name="messageText" rows="12" cols="120" value="${params.messageText}"/>
                    <g:checkBox name="watchTopic" checked="${isWatched}"/>
                    <label for="watchTopic">Watch this topic</label>

                    <div>
                        <g:actionSubmit class="button" value="Preview" action="previewMessage"/>
                        <g:actionSubmit class="button" value="Post message" action="saveNewTopicMessage"/>
                        <button class="button" id="btnCancel">Cancel</button>
                    </div>

                </g:form>

                <g:if test="${params.messageText}">
                    <div class="messagePreview">
                        <h3>Message preview</h3>
                        <markdown:renderHtml>${params.messageText}</markdown:renderHtml>
                    </div>
                </g:if>
            </div>
        </div>
    </body>
</html>
