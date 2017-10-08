package pea

import grails.converters.JSON

class APIController {

    def getAggregatedExpenses() {
        response.setContentType('application/json')

        Calendar calendar = Calendar.getInstance()
        calendar.set(Calendar.DATE, 1)
        calendar.add(Calendar.DATE, -1)

        List<UserTransaction> transactions = UserTransaction.findAllByUserAndTypeAndDateGreaterThan(session.user, "expense", calendar.getTime())
        Map groupedTransactions = transactions.groupBy { it.tag }
        Map<String, Integer> aggregatedExpenses = new HashMap<>()
        groupedTransactions.keySet().each { tagThis ->
            List<UserTransaction> valuesForTagThis = groupedTransactions[tagThis]
            Integer sumThis = valuesForTagThis.sum { transactionThis -> transactionThis.amount }
            aggregatedExpenses.put(tagThis, sumThis)
        }

        Calendar lowerCalendar=Calendar.getInstance()
        lowerCalendar.add(Calendar.MONTH, -1)
        lowerCalendar.set(Calendar.DATE, 1)
        lowerCalendar.add(Calendar.DATE, -1)

        Calendar upperCalendar = Calendar.getInstance()
        upperCalendar.set(Calendar.DATE,1)

        List<UserTransaction> lastMonthTransaction=UserTransaction.findAllByUserAndTypeAndDateBetween(session.user, "expense", lowerCalendar.getTime(), upperCalendar.getTime() )
        Map groupedTransactionsForLastMonth = lastMonthTransaction.groupBy { it.tag }
        Map<String, Integer> aggregatedExpensesForLastMonth = new HashMap<>()
        groupedTransactionsForLastMonth.keySet().each { tag ->
            List<UserTransaction> valuesForTag = groupedTransactionsForLastMonth[tag]
            Integer sum = valuesForTag.sum { transaction -> transaction.amount }
            aggregatedExpensesForLastMonth.put(tag, sum)
        }




        render(status: 200, "${[aggregatedExpenses: aggregatedExpenses, aggregatedExpensesForLastMonth: aggregatedExpensesForLastMonth] as JSON}")

    }


    /**
     * If any method in this controller invokes code that will throw a Exception
     * then this method is invoked.
     */
    def onException(final Exception exception) {
        logException exception
        render(status: 500, "${['message': "some internal error occurred"] as JSON}")
    }

    /** Log exception */
    private void logException(final Exception exception) {
        log.error "Exception occurred. ${exception?.message}", exception
        exception.printStackTrace()
    }
}
