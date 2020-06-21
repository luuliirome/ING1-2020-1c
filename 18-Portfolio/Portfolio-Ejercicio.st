!classDefinition: #PortfolioTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTest methodsFor: 'testing - empty portfolio' stamp: 'LR 6/18/2020 20:20:18'!
test01PortfolioHasZeroAsBalanceWhenCreated
	| portfolio |
	
	portfolio := Portfolio new.

	self assert: 0 equals: portfolio balance .
! !

!PortfolioTest methodsFor: 'testing - empty portfolio' stamp: 'LR 6/20/2020 17:00:04'!
test02PortfolioHasNoneTransactionsWhenCreated
	| portfolio |
	
	portfolio := Portfolio new.

	self assert: 0 equals: portfolio transactions size.
! !

!PortfolioTest methodsFor: 'testing - empty portfolio' stamp: 'LR 6/18/2020 20:23:20'!
test03PortfolioHasNotRegisterAnyTransactionWhenCreated
	| portfolio deposit withdraw |
	
	portfolio := Portfolio new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (portfolio hasRegistered: deposit).
	self deny: (portfolio hasRegistered:withdraw).
! !


!PortfolioTest methodsFor: 'testing - adding empty account' stamp: 'LR 6/20/2020 13:07:32'!
test04PorfolioHasZeroAsBalanceWhenAddingAnAccountWithoutTransactions
	| portfolio account |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	portfolio add: account.
	self assert: 0 equals: account balance .
! !

!PortfolioTest methodsFor: 'testing - adding empty account' stamp: 'LR 6/20/2020 17:00:20'!
test05PorfolioHasNoneTransactionsWhenAddingAnAccountWithoutTransactions
	| portfolio account |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	portfolio add: account.
	self assert: 0 equals: portfolio transactions size.
! !

!PortfolioTest methodsFor: 'testing - adding empty account' stamp: 'LR 6/20/2020 13:07:32'!
test06PortfolioHasNotRegisterAnyTransactionWhenAddingAnAccountWithoutTransactions
	| portfolio account deposit withdraw |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	portfolio add: account.
	
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (portfolio hasRegistered: deposit).
	self deny: (portfolio hasRegistered:withdraw).
! !


!PortfolioTest methodsFor: 'testing - adding multiple accounts with transactions' stamp: 'LR 6/20/2020 16:59:49'!
test10PorfolioHasBalanceWhenAddingMultipleAccountsWithTransactions
	| portfolio account1 account2 |
	
	portfolio := Portfolio new.
	account1 := ReceptiveAccount new.
	Deposit register: 100 on: account1.
	Withdraw register: 50 on: account1.
	portfolio add: account1.
	
	account2 := ReceptiveAccount new.
	Deposit register: 100 on: account2.
	Withdraw register: 50 on: account2.
	portfolio add: account2.
	
	self assert: 100 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'testing - adding multiple accounts with transactions' stamp: 'LR 6/20/2020 13:07:33'!
test11PorfolioHasTransactionsWhenAddingMultipleAccountsWithTransactions
	| portfolio account1 account2 deposit1 deposit2 withdraw |
	
	portfolio := Portfolio new.
	account1 := ReceptiveAccount new.
	deposit1 := Deposit register: 100 on: account1.
	withdraw := Withdraw register: 50 on: account1.
	portfolio add: account1.
	
	account2 := ReceptiveAccount new.
	deposit2 := Deposit register: 300 on: account2.
	portfolio add: account2.
	
	self assert: (portfolio transactions includes: deposit1).
	self assert: (portfolio transactions includes: deposit2).
	self assert: (portfolio transactions includes: withdraw).! !

!PortfolioTest methodsFor: 'testing - adding multiple accounts with transactions' stamp: 'LR 6/20/2020 13:07:33'!
test12PorfolioHasRegisteredTransactionsWhenAddingMultipleAccountsWithTransactions
	| portfolio account1 account2 deposit1 deposit2 withdraw |
	
	portfolio := Portfolio new.
	account1 := ReceptiveAccount new.
	deposit1 := Deposit register: 100 on: account1.
	withdraw := Withdraw register: 50 on: account1.
	portfolio add: account1.
	
	account2 := ReceptiveAccount new.
	deposit2 := Deposit register: 300 on: account2.
	portfolio add: account2.
	
	self assert: (portfolio hasRegistered: deposit1).
	self assert: (portfolio hasRegistered: deposit2).
	self assert: (portfolio hasRegistered: withdraw).! !


!PortfolioTest methodsFor: 'testing - adding account with transactions' stamp: 'LR 6/20/2020 17:00:42'!
test07PorfolioHasBalanceWhenAddingAnAccountWithTransactions
	| portfolio account |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
	portfolio add: account.
	
	self assert: 50 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'testing - adding account with transactions' stamp: 'LR 6/20/2020 13:07:32'!
test08PorfolioHasTransactionsWhenAddingAnAccountWithTransactions
	| portfolio account deposit withdraw |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
	portfolio add: account.
	
	self assert: (portfolio transactions includes: deposit).
	self assert: (portfolio transactions includes: withdraw).! !

!PortfolioTest methodsFor: 'testing - adding account with transactions' stamp: 'LR 6/20/2020 13:07:33'!
test09PorfolioHasRegisteredATransactionWhenAddingAnAccountWithTransactions
	| portfolio account deposit withdraw |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
	portfolio add: account.
	
	self assert: (portfolio hasRegistered: deposit).
	self assert: (portfolio hasRegistered: withdraw).! !


!PortfolioTest methodsFor: 'testing - adding empty portfolio' stamp: 'LR 6/20/2020 13:07:33'!
test13PorfolioHasZeroAsBalanceWhenAddingAPortfolioWithoutAccounts
	| portfolio1 portfolio2 |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	
	portfolio1 add: portfolio2.
	self assert: 0 equals: portfolio1 balance .
! !

!PortfolioTest methodsFor: 'testing - adding empty portfolio' stamp: 'LR 6/20/2020 17:00:59'!
test14PorfolioHasNoneTransactionsWhenAddingAPortfolioWithoutTransactions
	| portfolio1 portfolio2 |
	
	portfolio1 := Portfolio new.
	portfolio2 := ReceptiveAccount new.
	
	portfolio1 add: portfolio2 .
	self assert: 0 equals: portfolio1 transactions size.
! !

!PortfolioTest methodsFor: 'testing - adding empty portfolio' stamp: 'LR 6/20/2020 13:07:33'!
test15PortfolioHasNotRegisterAnyTransactionWhenAddingAPortfolioWithoutTransactions
	| portfolio1 portfolio2 deposit withdraw |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	
	portfolio1 add: portfolio2.
	
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (portfolio1 hasRegistered: deposit).
	self deny: (portfolio1 hasRegistered:withdraw).
! !


!PortfolioTest methodsFor: 'testing - adding portfolio with an account' stamp: 'LR 6/20/2020 17:01:10'!
test16PorfolioHasBalanceWhenAddingAPortfolioWithAnAccountWithTransactions
	| portfolio1 portfolio2 account |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
	portfolio2 add: account.
	portfolio1 add: portfolio2.
	
	self assert: 50 equals: portfolio1 balance.! !

!PortfolioTest methodsFor: 'testing - adding portfolio with an account' stamp: 'LR 6/20/2020 13:07:33'!
test17PorfolioHasTransactionsWhenAddingAPortfolioWithAnAccountWithTransactions
	| portfolio1 portfolio2 account deposit withdraw |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
	portfolio2 add: account.
	
	portfolio1 add: portfolio2.
	
	self assert: (portfolio1 transactions includes: deposit).
	self assert: (portfolio1 transactions includes: withdraw).! !

!PortfolioTest methodsFor: 'testing - adding portfolio with an account' stamp: 'LR 6/20/2020 13:07:32'!
test18PorfolioHasRegisteredATransactionWhenAddingAPortfolioWithAnAccountWithTransactions
	| portfolio1 portfolio2 account deposit withdraw |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
	portfolio2 add: account.
	portfolio1 add: portfolio2.
	
	self assert: (portfolio1 hasRegistered: deposit).
	self assert: (portfolio1 hasRegistered: withdraw).! !


!PortfolioTest methodsFor: 'testing - invalid actions' stamp: 'LR 6/20/2020 13:34:08'!
test19ShouldRaiseAnErrorWhenAddingADuplicateAccount
	| portfolio account |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
	portfolio add: account.
	
	self should: [portfolio add: account] 
	raise: Error
	withMessageText: Portfolio duplicateBankThingErrorMsg .! !

!PortfolioTest methodsFor: 'testing - invalid actions' stamp: 'LR 6/20/2020 14:51:00'!
test23ShouldRaiseAnErrorWhenAddingAPorfolioWithAnAccountThatItsAlreadyInTheMainPortfolio
	| mainPortfolio portfolio account |
	
	mainPortfolio := Portfolio new.
	portfolio := Portfolio new.
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
	
	mainPortfolio add: account.
	portfolio add: account.
	
	self should: [mainPortfolio add: portfolio.]
	raise: Error
	withMessageText: Portfolio duplicateBankThingErrorMsg.! !

!PortfolioTest methodsFor: 'testing - invalid actions' stamp: 'LR 6/20/2020 14:49:29'!
test24ShouldRaiseAnErrorWhenAddingAnAccountToAPortfolioThatItsAlreadyInTheMainPortfolio
	| mainPortfolio portfolio  account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
	
	mainPortfolio := Portfolio new.
	portfolio := Portfolio new.
	
	mainPortfolio add: portfolio.
	mainPortfolio add: account.
	
	self should: [portfolio add: account.]
	raise: Error
	withMessageText: Portfolio duplicateBankThingErrorMsg.! !

!PortfolioTest methodsFor: 'testing - invalid actions' stamp: 'LR 6/20/2020 14:52:20'!
test25ShouldRaiseAnErrorWhenAddingAnAccountThatItsAlreadyInAChildPortfolioOfTheMainPortfolio
	| mainPortfolio portfolio  account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
	
	mainPortfolio := Portfolio new.
	portfolio := Portfolio new.
	
	mainPortfolio add: portfolio.
	portfolio add: account.
	
	self should: [mainPortfolio add: account]
	raise: Error
	withMessageText: Portfolio duplicateBankThingErrorMsg.! !

!PortfolioTest methodsFor: 'testing - invalid actions' stamp: 'LR 6/20/2020 15:30:34'!
test26ShouldRaiseAnErrorWhenAddingAnAccountThatItsOnAGrandparentPortfolio
	| portfolio1 portfolio2 portfolio3 portfolio4 portfolio5 account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio1 add: account.
	portfolio2 add: account.
	
	portfolio3 := Portfolio new.	
	portfolio4 := Portfolio new.
	portfolio5 := Portfolio new.

	portfolio3 add: portfolio5.
	portfolio4 add: portfolio5.
	
	portfolio1 add: portfolio3.
	portfolio2 add: portfolio4.
	
	self should: [portfolio5 add: account]
	raise: Error
	withMessageText: Portfolio duplicateBankThingErrorMsg.! !


!PortfolioTest methodsFor: 'testing - adding multiple portfolios with multiple accounts' stamp: 'LR 6/20/2020 17:01:36'!
test20PorfolioHasBalanceWhenAddingMultiplePortfoliosWithAccountsWithTransactions
	| portfolio1 portfolio2 portfolio3 account1 account2 account3 |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.
	account1 := ReceptiveAccount new.
	Deposit register: 100 on: account1.
	Withdraw register: 50 on: account1.
	account2 := ReceptiveAccount new.
	Deposit register: 100 on: account2.
	account3 := ReceptiveAccount new.
	Withdraw register: 10 on: account3.
	
	portfolio2 add: account1.
	portfolio2 add: account2.
	portfolio1 add: portfolio2.
	
	portfolio3 add: account3.
	portfolio1 add: portfolio3.
	
	self assert: 140 equals: portfolio1 balance.! !

!PortfolioTest methodsFor: 'testing - adding multiple portfolios with multiple accounts' stamp: 'LR 6/20/2020 13:57:43'!
test21PorfolioHasTransactionsWhenAddingMultiplePortfoliosWithAccountsWithTransactions
	| portfolio1 portfolio2 portfolio3 account1 account2 account3 deposit1 deposit2 withdraw1 withdraw2 |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.
	account1 := ReceptiveAccount new.
	deposit1 := Deposit register: 100 on: account1.
	withdraw1 := Withdraw register: 50 on: account1.
	account2 := ReceptiveAccount new.
	deposit2 := Deposit register: 100 on: account2.
	account3 := ReceptiveAccount new.
	withdraw2 := Withdraw register: 10 on: account3.
	
	portfolio2 add: account1.
	portfolio2 add: account2.
	portfolio1 add: portfolio2.
	
	portfolio3 add: account3.
	portfolio1 add: portfolio3.
	
	self assert: (portfolio1 transactions includes: deposit1).
	self assert: (portfolio1 transactions includes:  deposit2).
	self assert: (portfolio1 transactions includes:  withdraw1).
	self assert: (portfolio1 transactions includes:  withdraw2).! !

!PortfolioTest methodsFor: 'testing - adding multiple portfolios with multiple accounts' stamp: 'LR 6/20/2020 13:57:24'!
test22PorfolioHasRegisteredWhenAddingMultiplePortfoliosWithAccountsWithTransactions
	| portfolio1 portfolio2 portfolio3 account1 account2 account3 deposit1 deposit2 withdraw1 withdraw2 |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.
	account1 := ReceptiveAccount new.
	deposit1 := Deposit register: 100 on: account1.
	withdraw1 := Withdraw register: 50 on: account1.
	account2 := ReceptiveAccount new.
	deposit2 := Deposit register: 100 on: account2.
	account3 := ReceptiveAccount new.
	withdraw2 := Withdraw register: 10 on: account3.
	
	portfolio2 add: account1.
	portfolio2 add: account2.
	portfolio1 add: portfolio2.
	
	portfolio3 add: account3.
	portfolio1 add: portfolio3.
	
	self assert: (portfolio1 hasRegistered: deposit1).
	self assert: (portfolio1 hasRegistered: deposit2).
	self assert: (portfolio1 hasRegistered: withdraw1).
	self assert: (portfolio1 hasRegistered: withdraw2).! !


!classDefinition: #ReceptiveAccountTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:48'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:54'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:02'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:32'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:46'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:54'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 6/18/2020 17:33:13'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 50 on: account1.
		
	self assert: 1 equals: account1 transactions size .
	self assert: (account1 transactions includes: deposit1).
! !


!classDefinition: #AccountTransaction category: #'Portfolio-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'LR 6/18/2020 20:33:40'!
addToBalance: balance 

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'Portfolio-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'LR 6/20/2020 13:09:20'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'private' stamp: 'LR 6/18/2020 20:31:14'!
addToBalance: balance
	^balance + self value! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'Portfolio-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'private' stamp: 'LR 6/18/2020 20:31:07'!
addToBalance: balance
	^balance - self value! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'Portfolio-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #FinancialAsset category: #'Portfolio-Ejercicio'!
Object subclass: #FinancialAsset
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!FinancialAsset methodsFor: 'as yet unclassified' stamp: 'LR 6/20/2020 15:02:16'!
addTo: aBankThing
	self subclassResponsibility ! !

!FinancialAsset methodsFor: 'as yet unclassified' stamp: 'LR 6/20/2020 15:02:31'!
balance
	self subclassResponsibility ! !

!FinancialAsset methodsFor: 'as yet unclassified' stamp: 'LR 6/20/2020 15:03:12'!
has: aBankThing
	self subclassResponsibility ! !

!FinancialAsset methodsFor: 'as yet unclassified' stamp: 'LR 6/20/2020 15:02:52'!
hasRegistered: aBankThing
	self subclassResponsibility ! !

!FinancialAsset methodsFor: 'as yet unclassified' stamp: 'LR 6/20/2020 15:03:05'!
includes: aBankThing
	self subclassResponsibility ! !

!FinancialAsset methodsFor: 'as yet unclassified' stamp: 'LR 6/20/2020 15:03:28'!
transactions
	self subclassResponsibility ! !


!classDefinition: #Portfolio category: #'Portfolio-Ejercicio'!
FinancialAsset subclass: #Portfolio
	instanceVariableNames: 'content parentPortfolios'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'private' stamp: 'LR 6/20/2020 15:59:11'!
addTo: aPortfolio 
	parentPortfolios add: aPortfolio! !

!Portfolio methodsFor: 'private' stamp: 'LR 6/21/2020 19:49:31'!
rootPortfolios
	| rootPortfolios |
	rootPortfolios := OrderedCollection new.
	
	parentPortfolios size = 0 ifTrue: [rootPortfolios add: self].
	parentPortfolios do: [
		:aParentPortfolio |
		rootPortfolios addAll: aParentPortfolio rootPortfolios
		].
	
	^rootPortfolios! !


!Portfolio methodsFor: 'transactions' stamp: 'LR 6/21/2020 19:56:04'!
transactions
	| transactions | 
	
	transactions := OrderedCollection new.
	
	content do: [
			:aFinancialAsset |
			transactions addAll: aFinancialAsset transactions
		].
	
	^transactions ! !


!Portfolio methodsFor: 'adding' stamp: 'LR 6/21/2020 19:55:51'!
add: aFinancialAsset
	self checkDuplicates: aFinancialAsset. 
	
	content add: aFinancialAsset.
	aFinancialAsset addTo: self.! !


!Portfolio methodsFor: 'initialization' stamp: 'LR 6/20/2020 15:59:39'!
initialize
	content := OrderedCollection new.
	parentPortfolios := OrderedCollection new.! !


!Portfolio methodsFor: 'balance' stamp: 'LR 6/21/2020 19:56:17'!
balance
	^content sum: [:aFinancialAsset | aFinancialAsset balance] ifEmpty: [0].! !


!Portfolio methodsFor: 'testing' stamp: 'LR 6/21/2020 19:56:24'!
hasRegistered: aTransaction 
	| accountsWithATransaction |
	
	accountsWithATransaction := content select: [
			:aFinancialAsset |
			aFinancialAsset hasRegistered: aTransaction
		].
	
	^accountsWithATransaction size > 0.! !


!Portfolio methodsFor: 'comparing' stamp: 'LR 6/21/2020 19:56:49'!
has: aReceptiveAccount
	^self processAllContent: [:aFinancialAsset | aFinancialAsset has: aReceptiveAccount].! !

!Portfolio methodsFor: 'comparing' stamp: 'LR 6/21/2020 19:57:05'!
includes: aFinancialAsset
	^self processAllContent: [:financialAsset | financialAsset includes: aFinancialAsset].! !

!Portfolio methodsFor: 'comparing' stamp: 'LR 6/21/2020 19:57:14'!
processAllContent: aProcedure
	^(content select: [:aFinancialAsset | aProcedure value: aFinancialAsset]) size > 0.! !


!Portfolio methodsFor: 'validations' stamp: 'LR 6/21/2020 19:57:22'!
checkDuplicates: aFinancialAsset 
	self rootPortfolios detect: [:portfolio | portfolio includes: aFinancialAsset ] ifNone: [^self].
	self error: self class duplicateBankThingErrorMsg.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'Portfolio-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'LR 6/20/2020 13:32:38'!
duplicateBankThingErrorMsg
	^'duplicate account'! !


!classDefinition: #ReceptiveAccount category: #'Portfolio-Ejercicio'!
FinancialAsset subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'LR 6/20/2020 13:09:59'!
register: aTransaction
	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'LR 6/18/2020 20:34:42'!
balance
	^transactions inject: 0 into: [ :balance :aTransaction | aTransaction addToBalance: balance ].! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'LR 6/20/2020 15:04:50'!
hasRegistered: aTransaction
	^ transactions includes: aTransaction 
! !


!ReceptiveAccount methodsFor: 'comparing' stamp: 'LR 6/21/2020 19:58:49'!
has: aReceptiveAccount
	^self = aReceptiveAccount.! !

!ReceptiveAccount methodsFor: 'comparing' stamp: 'LR 6/21/2020 19:57:39'!
includes: aFinancialAsset
	^aFinancialAsset has: self.! !


!ReceptiveAccount methodsFor: 'private' stamp: 'LR 6/20/2020 15:00:02'!
addTo: aPortfolio 
"Se agrega addTo simplemente para que la clase sea polimórfica a Portfolio en este mensaje, pero como no es necesario guardar los padres, no se hace nada."
	! !
