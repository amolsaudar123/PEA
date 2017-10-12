package pea

import grails.plugin.mail.MailService
import org.springframework.beans.factory.annotation.Autowired



class ReminderController {

    @Autowired
    MailService mailService

    def index() {
        def reminder=Reminder.findAllByUserName(session.user).collect{it}
        [reminder: reminder]
    }


    def sendMail() {
        def expenses = UserTransaction.findAllByUserAndType(session.user,"expense", [sort:'date', order:'desc'])

        mailService.sendMail {
            to "amolsaudar@gmail.com"
            subject "Report"
            html g.render(template:"sendMail", model:[expenses: expenses], view: "sendMail")
        }
        flash.message = "Message sent at "+new Date()
        redirect action:"index"
    }

}
