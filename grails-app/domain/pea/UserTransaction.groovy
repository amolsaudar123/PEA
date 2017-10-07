package pea

class UserTransaction {
    Integer amount
    Account account
    Date date
    String tag
    String type
    String payee
    String payer
    String user

    static constraints = {
        payee nullable: true
        payer nullable: true
    }
}
