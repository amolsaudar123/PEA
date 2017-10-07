package pea

class ReminderController {

    def index() {
        def reminder=Reminder.findAllByUserName(session.user).collect{it}
        [reminder: reminder]
    }

    def save(){
        def addReminder=new Reminder(params)
        addReminder.save()
        redirect action: "index", controller: "reminder"
    }

    def delete (Long id){

        def deleteReminder = Reminder.get(params.id)

        deleteReminder.delete flush: true, failOnError: true
        redirect action: "index", controller: "reminder"
    }
}
