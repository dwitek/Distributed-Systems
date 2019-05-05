module Bank{
    enum CurrencyType {
        PLN = 0,
        USD = 1,
        EUR = 2,
        CHF = 3,
        NOK = 4
    };

    enum AccountType {
        STANDARD = 0,
        PREMIUM = 1
    };

    exception InvalidPeselFormat{
        string reason;
    };

    exception InvalidDateFormat{
        string reason;
    };

    exception UnsupportedCurrencyType{
        string reason;
    };

    struct Date{
        int day;
        int month;
        int year;
    };

    struct Person{
        string name;
        string surname;
        string pesel;
    };

    struct Credit{
        Date startDate;
        Date endDate;
        double value;
        CurrencyType currencyType;
    };

    struct CreditInfo{
        CurrencyType baseCurrencyType;
        CurrencyType foreignCurrencyType;
        double baseCreditValue;
        double foreignCreditValue;
    };

    interface Account{
        double getAccountBalance();
        void deposit(double money);
    };

    interface PremiumAccount extends Account{
        CreditInfo getCredit(Credit credit) throws InvalidDateFormat, UnsupportedCurrencyType;
    };

    interface AccountFactory{
        Account* createAccount(Person person, double income) throws InvalidPeselFormat;
    };
};