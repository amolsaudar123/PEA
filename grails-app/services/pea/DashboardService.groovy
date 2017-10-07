package pea

import grails.transaction.Transactional

@Transactional
class DashboardService {

    List<UserTransaction> getExpeses(String user){
        UserTransaction.findAllByUserAndType(user,"expense")
    }

    def getMonthlySpending(String user){
        Calendar lowerCalendar = Calendar.getInstance()
        lowerCalendar.add(Calendar.MONTH,-1)
        lowerCalendar.set(Calendar.DATE,1)
        lowerCalendar.add(Calendar.DATE,-1)

        Calendar upperCalendar = Calendar.getInstance()
        upperCalendar.set(Calendar.DATE,1)




        Integer spendingAmount= UserTransaction.findAllByUserAndTypeAndDateBetween(user, "expense",lowerCalendar.getTime(), upperCalendar.getTime()).sum{expense->expense.amount}

        spendingAmount
    }

    def getCurrentMonthSpending(String user){
        Calendar calendar = Calendar.getInstance()
        calendar.set(Calendar.DATE,1)
        calendar.add(Calendar.DATE,-1)
        Integer currentSpendingAmount= UserTransaction.findAllByUserAndTypeAndDateGreaterThan(user, "expense",calendar.getTime()).sum{expense->expense.amount}

        currentSpendingAmount
    }




    List<AccountSummary> calculateBalance(String name) {
        List<AccountSummary> accountSummaries = new ArrayList<>()

        Account.findAllByUserName(name).each {account ->
            Integer totalSpend = UserTransaction.findAllByAccountAndType(account,"expense").sum { expense -> expense.amount }
            Integer totalEarn = UserTransaction.findAllByAccountAndType(account,"income").sum { income -> income.amount }

            int currentBalance = totalSpend ? account.initialBalance.intValue() - totalSpend.intValue() :account.initialBalance
            currentBalance = totalEarn ? currentBalance + totalEarn.intValue() :currentBalance

            accountSummaries.add(new AccountSummary(account: account, balance: (currentBalance )))
        }
        accountSummaries
    }
}
