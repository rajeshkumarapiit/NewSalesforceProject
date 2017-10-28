public with sharing class AccountListCtr {

    public List<Account> getAccounts()
    {
        return [Select Id, Name, industry, type, rating From Account];
    }

}