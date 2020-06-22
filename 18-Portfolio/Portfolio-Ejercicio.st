!classDefinition: #PortfolioTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: 'depositFor50 depositFor100 withdrawFor50 portfolio emptyPortfolio anotherEmptyPortfolio emptyAccount withdrawFor10'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTest methodsFor: 'testing - empty portfolio' stamp: 'LR 6/21/2020 21:05:12'!
test01PortfolioHasZeroAsBalanceWhenCreated
	self shouldHasZeroBalance: emptyPortfolio.
! !

!PortfolioTest methodsFor: 'testing - empty portfolio' stamp: 'LR 6/21/2020 21:05:20'!
test02PortfolioHasNoneTransactionsWhenCreated
	self shouldHasNotTransactions: emptyPortfolio.
! !

!PortfolioTest methodsFor: 'testing - empty portfolio' stamp: 'LR 6/21/2020 21:05:26'!
test03PortfolioHasNotRegisterATransactionWhenCreated	
	self shouldHasNotRegisteredAnyTransaction: emptyPortfolio.
! !


!PortfolioTest methodsFor: 'testing - adding empty account' stamp: 'LR 6/21/2020 21:07:00'!
test04PorfolioHasZeroAsBalanceWhenAddingAnAccountWithoutTransactions
	self shouldHasZeroBalance: (emptyPortfolio add: emptyAccount).! !

!PortfolioTest methodsFor: 'testing - adding empty account' stamp: 'LR 6/21/2020 21:07:05'!
test05PorfolioHasNoneTransactionsWhenAddingAnAccountWithoutTransactions
	self shouldHasNotTransactions: (emptyPortfolio add: emptyAccount).
! !

!PortfolioTest methodsFor: 'testing - adding empty account' stamp: 'LR 6/21/2020 21:07:12'!
test06PortfolioHasNotRegisterAnyTransactionWhenAddingAnAccountWithoutTransactions
	self shouldHasNotRegisteredAnyTransaction: (emptyPortfolio add: emptyAccount).
! !


!PortfolioTest methodsFor: 'testing - adding multiple accounts with transactions' stamp: 'LR 6/21/2020 21:30:04'!
test12PorfolioHasRegisteredHasBalanceAndHasTransactionsWhenAddingMultipleAccountsWithTransactions
	| account1 account2 |
	
	account1 := self accountWith: {depositFor100 . withdrawFor50 }.
	account2 := self accountWith: {depositFor50 }.
	portfolio := self portfolioWith: {account1. account2.}.
	
	self should: portfolio hasRegistered: {depositFor50 . depositFor100 . withdrawFor50 .}.
	self should: portfolio hasTransactions: {depositFor100 . depositFor50 . withdrawFor50 }.
	self should: portfolio hasBalance: 100.! !


!PortfolioTest methodsFor: 'testing - adding account with transactions' stamp: 'LR 6/21/2020 21:30:16'!
test09PorfolioHasRegisteredHasBalanceAndHasTransactionsWhenAddingAnAccountWithTransactions
	| account |
	
	account := self accountWith: {depositFor100. withdrawFor50 }.
	portfolio := self portfolioWith: {account}.
	
	self should: (portfolio ) hasRegistered: {depositFor100 . withdrawFor50 }.
	self should: (portfolio ) hasTransactions: {depositFor100 . withdrawFor50 }.
	self should: (portfolio ) hasBalance: 50.! !


!PortfolioTest methodsFor: 'testing - adding empty portfolio' stamp: 'LR 6/21/2020 21:07:50'!
test13PorfolioHasZeroAsBalanceWhenAddingAPortfolioWithoutAccounts
	self shouldHasZeroBalance: (emptyPortfolio add: anotherEmptyPortfolio).
! !

!PortfolioTest methodsFor: 'testing - adding empty portfolio' stamp: 'LR 6/21/2020 21:08:01'!
test14PorfolioHasNoneTransactionsWhenAddingAPortfolioWithoutTransactions
	self shouldHasNotTransactions: (emptyPortfolio add: anotherEmptyPortfolio).! !

!PortfolioTest methodsFor: 'testing - adding empty portfolio' stamp: 'LR 6/21/2020 21:08:15'!
test15PortfolioHasNotRegisterAnyTransactionWhenAddingAPortfolioWithoutTransactions
	self shouldHasNotRegisteredAnyTransaction: (emptyPortfolio add: anotherEmptyPortfolio).! !


!PortfolioTest methodsFor: 'testing - adding portfolio with an account' stamp: 'LR 6/21/2020 21:30:41'!
test18PorfolioHasRegisteredHasBalanceAndHasTransactionsWhenAddingAPortfolioWithAnAccountWithTransactions
	| account |
	
	account := self accountWith: {depositFor100 . withdrawFor50 }.
	portfolio := self portfolioWith: {emptyPortfolio add: account.}.
	
	self should: portfolio hasRegistered: {depositFor100 . withdrawFor50 }.
	self should: portfolio hasBalance: 50.
	self should: portfolio hasTransactions: {depositFor100 . withdrawFor50 }.! !


!PortfolioTest methodsFor: 'testing - invalid actions' stamp: 'LR 6/21/2020 21:13:20'!
test19ShouldRaiseAnErrorWhenAddingADuplicateAccount
	portfolio add: emptyAccount.
	
	self should: [portfolio add: emptyAccount ] 
	raise: Error
	withMessageText: Portfolio duplicateBankThingErrorMsg .! !

!PortfolioTest methodsFor: 'testing - invalid actions' stamp: 'LR 6/21/2020 21:13:39'!
test23ShouldRaiseAnErrorWhenAddingAPorfolioWithAnAccountThatItsAlreadyInTheMainPortfolio
	| mainPortfolio |
	
	mainPortfolio := Portfolio new.
	mainPortfolio add: emptyAccount .
	portfolio add: emptyAccount.
	
	self should: [mainPortfolio add: portfolio .]
	raise: Error
	withMessageText: Portfolio duplicateBankThingErrorMsg.! !

!PortfolioTest methodsFor: 'testing - invalid actions' stamp: 'LR 6/21/2020 21:13:53'!
test24ShouldRaiseAnErrorWhenAddingAnAccountToAPortfolioThatItsAlreadyInTheMainPortfolio
	
	portfolio add: emptyPortfolio .
	portfolio add: emptyAccount .
	
	self should: [emptyPortfolio add: emptyAccount .]
	raise: Error
	withMessageText: Portfolio duplicateBankThingErrorMsg.! !

!PortfolioTest methodsFor: 'testing - invalid actions' stamp: 'LR 6/21/2020 21:14:05'!
test25ShouldRaiseAnErrorWhenAddingAnAccountThatItsAlreadyInAChildPortfolioOfTheMainPortfolio
	portfolio add: emptyPortfolio .
	emptyPortfolio add: emptyAccount .
	
	self should: [portfolio add: emptyAccount ]
	raise: Error
	withMessageText: Portfolio duplicateBankThingErrorMsg.! !

!PortfolioTest methodsFor: 'testing - invalid actions' stamp: 'LR 6/21/2020 21:16:08'!
test26ShouldRaiseAnErrorWhenAddingAnAccountThatItsOnAGrandparentPortfolio
	| portfolio1 portfolio2 portfolio3 portfolio4 |
	
	portfolio3 := self portfolioWith: {emptyPortfolio}.
	portfolio4 := self portfolioWith: {emptyPortfolio}.
	
	portfolio1 := self portfolioWith: {emptyAccount. portfolio3}.
	portfolio2 := self portfolioWith: {emptyAccount. portfolio4}.
		
	self should: [emptyPortfolio add: emptyAccount ]
	raise: Error
	withMessageText: Portfolio duplicateBankThingErrorMsg.! !


!PortfolioTest methodsFor: 'testing - adding multiple portfolios with multiple accounts' stamp: 'LR 6/21/2020 21:30:59'!
test22PorfolioHasRegisteredHasBalanceAndHasTransactionsWhenAddingMultiplePortfoliosWithAccountsWithTransactions
	| portfolio1 portfolio2 portfolio3 account1 account2 account3 |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.
	
	account1 := self accountWith: {depositFor100 . withdrawFor50 }.
	
	account2 := self accountWith: {depositFor50.}.
	
	account3 := self accountWith: {withdrawFor10}.
	
	portfolio2 := self portfolioWith: {account1. account2}.
	portfolio3 := self portfolioWith: {account3}.
	portfolio1 := self portfolioWith: {portfolio2. portfolio3}.
	
	self should: portfolio1 hasRegistered: {depositFor50 . depositFor100 . withdrawFor50 . withdrawFor10 }.
	self should: portfolio1 hasTransactions: {depositFor100 . depositFor50 . withdrawFor50 . withdrawFor10 }.
	self should: portfolio1 hasBalance: 90.! !


!PortfolioTest methodsFor: 'setUp/tearDown' stamp: 'LR 6/21/2020 21:20:37'!
setUp
	depositFor50 := Deposit for: 50.
	depositFor100 := Deposit for: 100.
	withdrawFor50 := Withdraw for: 50.
	withdrawFor10 := Withdraw for: 10.
	
	emptyPortfolio := Portfolio new.
	anotherEmptyPortfolio := Portfolio new.
	portfolio := Portfolio new.
	emptyAccount := ReceptiveAccount new.! !


!PortfolioTest methodsFor: 'initialization' stamp: 'LR 6/21/2020 20:51:02'!
accountWith: transactions
	| account |
	
	account := ReceptiveAccount new.
	
	transactions do: [
			:transaction |
			account register: transaction.
		].
	
	^account! !

!PortfolioTest methodsFor: 'initialization' stamp: 'LR 6/21/2020 21:17:15'!
portfolioWith: contents
	| newPortfolio |
	newPortfolio := Portfolio new.
	
	contents do: [
			:content |
			newPortfolio add: content
		].
	
	^newPortfolio 
	! !


!PortfolioTest methodsFor: 'assertions' stamp: 'LR 6/21/2020 20:30:44'!
should: aPortfolio hasBalance: balanceAmount 
	self assert: balanceAmount equals: aPortfolio balance.! !

!PortfolioTest methodsFor: 'assertions' stamp: 'LR 6/21/2020 20:13:38'!
should: aPortfolio hasRegistered: transactions

	transactions do:[
			:transaction |
			self assert: (aPortfolio hasRegistered: transaction).
		] 
	! !

!PortfolioTest methodsFor: 'assertions' stamp: 'LR 6/21/2020 20:31:05'!
should: aPortfolio hasTransactions: transactions
	| aPortfolioTransactions |
	aPortfolioTransactions := aPortfolio transactions.
	
	transactions do: [
			:transaction |
			self assert: (aPortfolioTransactions includes: transaction).
		]! !

!PortfolioTest methodsFor: 'assertions' stamp: 'LR 6/21/2020 20:12:28'!
shouldHasNotRegisteredAnyTransaction: aPortfolio 		
	self deny: (aPortfolio hasRegistered: (Deposit for: 100)).
	self deny: (aPortfolio hasRegistered: (Withdraw for: 50)).! !

!PortfolioTest methodsFor: 'assertions' stamp: 'LR 6/21/2020 20:18:05'!
shouldHasNotTransactions: aPortfolio 
	self assert: 0 equals: aPortfolio transactions size.! !

!PortfolioTest methodsFor: 'assertions' stamp: 'LR 6/21/2020 20:27:25'!
shouldHasZeroBalance: aPortfolio 
		self assert: 0 equals: aPortfolio balance .! !


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

!FinancialAsset methodsFor: 'transactions' stamp: 'LR 6/20/2020 15:03:28'!
transactions
	self subclassResponsibility ! !


!FinancialAsset methodsFor: 'balance' stamp: 'LR 6/20/2020 15:02:31'!
balance
	self subclassResponsibility ! !


!FinancialAsset methodsFor: 'testing' stamp: 'SA 6/22/2020 00:39:09'!
has: aFinancialAsset
	self subclassResponsibility ! !

!FinancialAsset methodsFor: 'testing' stamp: 'SA 6/22/2020 00:39:21'!
hasRegistered: aFinancialAsset
	self subclassResponsibility ! !

!FinancialAsset methodsFor: 'testing' stamp: 'SA 6/22/2020 00:39:29'!
includes: aFinancialAsset
	self subclassResponsibility ! !


!FinancialAsset methodsFor: 'private' stamp: 'SA 6/22/2020 00:38:56'!
addTo: aFinancialAsset
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

!Portfolio methodsFor: 'private' stamp: 'LR 6/21/2020 19:57:14'!
processAllContent: aProcedure
	^(content select: [:aFinancialAsset | aProcedure value: aFinancialAsset]) size > 0.! !

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


!Portfolio methodsFor: 'testing' stamp: 'LR 6/21/2020 19:56:49'!
has: aReceptiveAccount
	^self processAllContent: [:aFinancialAsset | aFinancialAsset has: aReceptiveAccount].! !

!Portfolio methodsFor: 'testing' stamp: 'LR 6/21/2020 19:56:24'!
hasRegistered: aTransaction 
	| accountsWithATransaction |
	
	accountsWithATransaction := content select: [
			:aFinancialAsset |
			aFinancialAsset hasRegistered: aTransaction
		].
	
	^accountsWithATransaction size > 0.! !

!Portfolio methodsFor: 'testing' stamp: 'LR 6/21/2020 19:57:05'!
includes: aFinancialAsset
	^self processAllContent: [:financialAsset | financialAsset includes: aFinancialAsset].! !


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
