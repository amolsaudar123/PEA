package pea

import grails.validation.Validateable
import groovy.transform.ToString

@Validateable
@ToString
class Account {
    String bankName
    String accountType
    Long accountNumber
    Integer initialBalance
    String userName

    static constraints = {
        accountNumber nullable: true
    }
}
