package pea

import grails.converters.JSON

import java.text.DateFormatSymbols

class MonthlyExpense{
    String month
    String category
    Integer amount
}

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

        Calendar lowerDate = Calendar.getInstance()
        lowerDate.add(Calendar.MONTH,-1)



        def comparativeData=getExpensesFor(lowerDate.getTime().clearTime(),new Date())


        render(status: 200, "${[comparativeData:comparativeData, currentMonth:new Date().month, aggregatedExpensesForLastMonth:aggregatedExpensesForLastMonth,aggregatedExpenses:aggregatedExpenses] as JSON}")

    }


    def getComparativeExpenses(){
        int currentMonth = Calendar.getInstance().get(Calendar.MONTH)
        int lastMonth = Calendar.getInstance().get(Calendar.MONTH)

    }


    def getCategorizedExpensesForPastMonths(){
        Calendar lowerDate = Calendar.getInstance()
        lowerDate.set(Calendar.DATE, -1)
        lowerDate.add(Calendar.MONTH,-1)
        lowerDate.set(Calendar.MONTH,1)
        //def comparativeData=getExpensesFor(lowerDate.getTime().clearTime(),new Date())

        List<UserTransaction> transactions = UserTransaction.findAllByUserAndTypeAndDateBetween(session.user, "expense", lowerDate.getTime().clearTime(), new Date(),[sort:"date",order:"asc"])
        def monthlyTransactions = transactions.groupBy { getMonthForInt(it.date[Calendar.MONTH]) }
        def categorizedTransactions = transactions.groupBy { it.tag }
        def categories = categorizedTransactions.keySet()

        List<MonthlyExpense> expenses = new ArrayList<>()
        monthlyTransactions.keySet().each {month->
            List<UserTransaction> transactionsOfMonth = monthlyTransactions[month]
            categories.each {category->
                Integer spentOnCategory = transactionsOfMonth.findAll{it.tag==category}.sum {t->t.amount}
                MonthlyExpense expense = new MonthlyExpense(month: month,amount:spentOnCategory?spentOnCategory:0,category: category )
                expenses.add(expense)
            }

        }
        println expenses

        render(status: 200, "${[comparativeData:expenses,categories:categories, currentMonth:new Date().month] as JSON}")

    }

    private def getExpensesFor(Date lowerDate,Date upperDate){
        List<UserTransaction> transactions = UserTransaction.findAllByUserAndTypeAndDateBetween(session.user, "expense", lowerDate, upperDate)


        Map groupedTransactions = transactions.groupBy ({it.tag},{it.date.getMonth()})
        Map<String, List<MonthlyExpense>> aggregatedExpenses = new HashMap<>()
        groupedTransactions.keySet().each { tagThis ->

            Map value = groupedTransactions[tagThis]
            value.keySet().each {tagMonth->
                List<UserTransaction> valuesForTagThis = value[tagMonth]
                Integer sumThis = valuesForTagThis.sum { transactionThis -> transactionThis.amount }

                if(!aggregatedExpenses.containsKey(tagThis)){
                    aggregatedExpenses.put(tagThis,new ArrayList<MonthlyExpense>())
                }
                MonthlyExpense expense = new MonthlyExpense(month: tagMonth,amount:sumThis?sumThis:0,category: tagThis )
                aggregatedExpenses.get(tagThis).add(expense)
            }
        }

        aggregatedExpenses

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

    private String getMonthForInt(int num) {
        String month = "wrong"
        DateFormatSymbols dfs = new DateFormatSymbols()
        String[] months = dfs.getMonths();
        if (num >= 0 && num <= 11 ) {
            month = months[num]
        }
        return month
    }
}
