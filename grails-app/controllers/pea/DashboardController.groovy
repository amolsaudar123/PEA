package pea

class DashboardController {

    def dashboardService

    def onLogin() {

        def newUserName = session.user
        if (newUserName){
            List<AccountSummary> accountSummaries = dashboardService.calculateBalance(newUserName)

            def expenses = dashboardService.getExpeses(newUserName)
            def previousMonthSpending=dashboardService.getMonthlySpending(newUserName)
            def currentMonthSpening=dashboardService.getCurrentMonthSpending(newUserName)
            def status =""
            if(previousMonthSpending && currentMonthSpening)
             status= previousMonthSpending>currentMonthSpening ? "You Spend ${previousMonthSpending-currentMonthSpening} rupee less in this month" : previousMonthSpending<currentMonthSpening ? "In this Month You Spend ${currentMonthSpening-previousMonthSpending} INR more  " :"Same Spending"

            render(view: 'onLogin', model: [expenses: expenses, accountSummaries: accountSummaries, previousMonthSpending:previousMonthSpending, currentMonthSpening:currentMonthSpening, status:status])
        }else {
            render(view: 'onLogin', model: [expenses: [], accountSummaries: []])
        }
    }

    def profile() {


    }
}
