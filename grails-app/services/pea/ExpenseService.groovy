package pea

import grails.transaction.Transactional

@Transactional
class ExpenseService {

    List<String> getBankName(String name) {
        Account.findAllByUserNameLike(name).collect { it.bankName }
    }

    def getByUserName(String nam){
        UserTransaction.findAllByUserAndType(nam,"expense")
        //Expense.findAllByUserNameLike(nam).collect{it}
    }
}
