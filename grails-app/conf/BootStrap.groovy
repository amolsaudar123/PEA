import pea.Account
import pea.UserTransaction

class BootStrap {

    def init = { servletContext ->
        if (Account.count() != 0)
            return
        String[] bankNames = ["ICICI", "HDFC", "SBI", "Axis Bank", "HSBC"]
        String[] accountTypes = ["Credit", "Saving", "Deposit", "Salary", "Cash"]

        for (int index = 0; index < bankNames.length; index++) {
            def bank = bankNames[index]
            def type = accountTypes[index]
            def user = (index == 0 || index == 2 || index == 4) ? "Amol Saudar" : "Tom Smith"
            new Account(bankName: bank, accountType: type, initialBalance: 100000 + index, accountNumber: 11110 + index, userName: user).save()
        }

       /* String[] payee = ["MakeMyTrip", "Air India", "TajHotel", "OberoiHotel", "localHotel", "session mall"]

        for (int index=0; index<5; index++){
            def payeeCompany=payee[index]
            String tag=((payeeCompany=="MakeMyTrip"||payeeCompany=="Air India") ? "Travelling" :  payeeCompany=="OberoiHotel" ?"Lunch": payeeCompany=="TajHotel" || payeeCompany=="localHotel"? "Breakfast":payeeCompany=="session mall"?"Shopping":"Miscellaneous")
            String user = (index == 0 || index == 2 || index == 4) ? "Amol Saudar" : "Tom Smith"
            new UserTransaction(payee:payee[index], amount: index*20, account:, date:new Date().clearTime()-15 , tag:tag )}

    }*/
        def destroy = {

        }
    }
}