package pea

class ExpenseController {

    def expenseService


    def index1(){

        List<String> bankNames = expenseService.getBankName(session.user)
        def newList=expenseService.getByUserName(session.user)

        def expenses = UserTransaction.findAllByUserAndType(session.user,"expense", [sort:'date', order:'desc'])
        def incomes = UserTransaction.findAllByUserAndType(session.user,"income", [sort:'date', order:'desc'])

        render(view: 'index1', model: [bankNames:bankNames,expenses: expenses,incomes:incomes, expenseCount:expenses.size(), newList:newList])
    }

    def save(){
        UserTransaction transaction = new UserTransaction(
                account: Account.findByBankName(params.bankName),
                amount: params.amount,
                type: params.transactionType,
                date:params.date,
                tag:params.tag,
                user: session.user
        )
        if("expense".equals(params.transactionType)) {
            transaction.payee = params.payee
        }  else {
            transaction.payer = params.payee
        }

        transaction.save(failOnError: true)

        redirect action: "index1", controller: "expense"

    }

    def delete (){
        def deleteExpense = UserTransaction.get(params.id)
        deleteExpense.delete flush: true, failOnError: true
        redirect action: "index1", controller: "expense"
    }
    def edit(){

        def editExpense=UserTransaction.get(params.id)
        List<String> bankNames = expenseService.getBankName(session.user)
        [editExpense:editExpense, id:params.id, bankNames: bankNames]
    }
    def update(){
        def updateId=params.id
        def updateExpense=UserTransaction.get(updateId)
        updateExpense.properties=params
        updateExpense.save flush: true, failOnError: true
        redirect action: "index1", controller: "expense"
    }
    def editTransaction(){
        def editTransaction=UserTransaction.get(params.id)
        List<String> bankNames = expenseService.getBankName(session.user)
        [editTransaction:editTransaction, id:params.id, bankNames: bankNames]
    }
    def updateTransaction(){
        def updateId=params.id
        def updateTransaction=UserTransaction.get(updateId)
        updateTransaction.properties=params
        updateTransaction.save flush: true, failOnError: true
        redirect action: "index1", controller: "expense"
    }

}
