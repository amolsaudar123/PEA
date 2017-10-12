package pea

class AccountController {

    def index() {
        def account=Account.findAllByUserNameLike(session.user, [sort:'id', order:'desc'])
        [account:account]
    }
    def save() {
        def newAc = new Account(params)
        newAc.save()
        redirect action: "index", controller: "account"
    }
    def delete (){
        def deleteAccount = Account.get(params.id)
        deleteAccount.delete flush: true, failOnError: true
        redirect action: "index", controller: "account"
    }
    def edit(){
        def editAccount=Account.get(params.id)
        [editAccount:editAccount, id:params.id]
    }
    def update(){
        def updateAccount=Account.get(params.id)
        updateAccount.properties=params
        updateAccount.save flush: true, failOnError: true
        redirect action: "index", controller: "account"
    }
}
