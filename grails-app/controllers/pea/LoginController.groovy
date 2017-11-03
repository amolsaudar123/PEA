package pea

import grails.converters.JSON

class LoginController {


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

}
