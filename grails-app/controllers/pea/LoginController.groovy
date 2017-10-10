package pea

import grails.converters.JSON
import grails.plugin.mail.MailService
import org.springframework.beans.factory.annotation.Autowired

class LoginController {

    @Autowired
    MailService mailService

    def index() { }
    def loginSuccess(){
        response.setContentType('application/json')
        try {
            session.user=params.fullName
            session.photo=params.profilePhoto
            session.email=params.email
            println params
            render 200
        }
        catch (RuntimeException exception) {
            log.error "Error during operation " + exception.message,exception
            render(status: 500, "${['status': "Login ERROR"] as JSON}")
        }
    }
    def testAction() {

      /*  mailService.sendMail {
            to "amolsaudar@gmail.com"
            subject "Hello John"
            body 'this is some text'
        }*/
    }
}
