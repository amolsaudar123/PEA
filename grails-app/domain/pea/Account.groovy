package pea

import grails.validation.Validateable

@Validateable
class Account {
    String bankName
    String accountType
    Long accountNumber
    Integer initialBalance
    String userName

    static constraints = {
    }
}
