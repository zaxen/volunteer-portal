package au.org.ala.volunteer

import grails.transaction.Transactional
import org.apache.commons.io.FileUtils
import org.apache.commons.lang.StringUtils

@Transactional
class MultimediaService {

    def logService
    def grailsApplication
    def grailsLinkGenerator

    def deleteMultimedia(Multimedia media) {
        def dir = new File(grailsApplication.config.images.home + '/' + media.task?.projectId + '/' + media.task?.id + "/" + media.id)
        if (dir.exists()) {
            log.info("DeleteMultimedia: Preparing to remove multimedia directory ${dir.absolutePath}")
            FileUtils.deleteDirectory(dir)
        } else {
            log.info("DeleteMultimedia: Directory ${dir.absolutePath} does not exist!")
        }
    }

    public String filePathFor(Multimedia media) {
        grailsApplication.config.images.home + File.separator + media.task?.projectId + File.separator + media.task?.id + File.separator + media.id
    }

    public String getImageUrl(Multimedia media) {
        media.filePath ? getImageUrl(media.filePath) : ''
    }

    public String getImageUrl(String filePath) {
        return filePath ? "${grailsApplication.config.server.url}${filePath}" : ''
    }

    public String getImageThumbnailUrl(Multimedia media, boolean absolute = false) {
        if (media == null) {
            log.warn("getImageThumbnailUrl called for null media object")
            return grailsLinkGenerator.resource(file:'/sample-task-thumbnail.jpg')
        }
        String filePath = filePathFor(media) ?: ''
        String filename = filenameFromFilePath(media.filePathToThumbnail) ?: ''
        File file = new File(filePath, filename)
        log.debug("getImageThumbnailUrl media: $media, filePath: $filePath, filename: $filename, file: $file, exists: ${file.exists()}")
        if (file.exists()) {
            return media.filePathToThumbnail ? "${grailsApplication.config.server.url}${media.filePathToThumbnail}" : ''
        } else {
            log.warn("Thumbnail requested for $media but $file doesn't exist")
            return grailsLinkGenerator.resource(file:'/sample-task-thumbnail.jpg', absolute: absolute)
        }
    }

    private String filenameFromFilePath(String filePath) {
        StringUtils.substringAfterLast(filePath, '/')
    }
}
