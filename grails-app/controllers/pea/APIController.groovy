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
        groupedTransactions.keySet().each { tag ->
            List<UserTransaction> valuesForTag = groupedTransactions[tag]
            Integer sum = valuesForTag.sum { transaction -> transaction.amount }
            aggregatedExpenses.put(tag, sum)
        }

        render(status: 200, "${[aggregatedExpenses: aggregatedExpenses] as JSON}")

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
