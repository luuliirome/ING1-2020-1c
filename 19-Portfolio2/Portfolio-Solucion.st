!classDefinition: #AccountSummaryReportTest category: #'Portfolio-Solucion'!
TestCase subclass: #AccountSummaryReportTest
	instanceVariableNames: 'expectedReport'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountSummaryReportTest methodsFor: 'setUp/tearDown' stamp: 'LR 6/28/2020 20:27:59'!
setUp
	expectedReport := OrderedCollection with: 'Depósito por 400.' with: 'Extracción por 100.' 
	with: 'Salida por transferencia de 50.' with:  'Entrada por transferencia de 10.'! !


!AccountSummaryReportTest methodsFor: 'testing' stamp: 'LR 6/28/2020 20:27:21'!
test01AnAccountWithNoTransactionsShouldReturnAnEmptyReportWithBalanceZero
	| account accountReport |
	account := ReceptiveAccount new.
	accountReport := (AccountSummaryReport newFor: account) report.
	
	self assert: (OrderedCollection with: 'Balance = 0') equals: accountReport.! !

!AccountSummaryReportTest methodsFor: 'testing' stamp: 'LR 6/28/2020 20:33:26'!
test02AnAccountWithTransactionsShouldReturnCorrectReportWithCorrectBalance
	| account1 account2 accountReport |
	account2 := ReceptiveAccount new.
	account1 := self accountWithOutgoingTransferTo: account2.
	
	accountReport := (AccountSummaryReport newFor: account1) report.
	
	expectedReport add: 'Balance = 260'.
	
	self assert: expectedReport equals: accountReport.! !

!AccountSummaryReportTest methodsFor: 'testing' stamp: 'LR 6/28/2020 20:29:50'!
test03APortfolioWithTransactionsShouldReturnCorrectReportWithCorrectBalance
	| portfolio1 portfolio2 accountReport |
	
	portfolio2 := self portfolioWithAccounts.
	portfolio1 := Portfolio with: portfolio2.
	
	accountReport := (AccountSummaryReport newFor: portfolio1) report.
	
	expectedReport add: 'Entrada por transferencia de 50.'. 
	expectedReport add: 'Salida por transferencia de 10.'.
	expectedReport add: 'Balance = 300'.
	
	self assert: expectedReport equals: accountReport.! !


!AccountSummaryReportTest methodsFor: 'testing - private' stamp: 'LR 6/28/2020 20:32:27'!
accountWithOutgoingTransferTo: anAccount
	| account |
	
	account := ReceptiveAccount new.
	
	Deposit register: 400 on: account.
	Withdraw register: 100 on: account.
	Transfer register: 50 from: account to: anAccount.
	Transfer register: 10 from: anAccount to: account.
	
	^account! !

!AccountSummaryReportTest methodsFor: 'testing - private' stamp: 'LR 6/28/2020 20:32:57'!
portfolioWithAccounts
	| account1 account2 |
	account2 := ReceptiveAccount new.
	account1 := self accountWithOutgoingTransferTo: account2.
	^Portfolio with: account1 with: account2.! !


!classDefinition: #PortfolioTest category: #'Portfolio-Solucion'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:17:51'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:23:25'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:43:15'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100))! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:43:11'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:06'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'NR 6/22/2020 07:31:19'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit anotherAccount portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 on: account.
	anotherAccount := ReceptiveAccount new.
	anotherAccountWithdraw := Withdraw register: 100 on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:32'!
test12PortfolioCanNotIncludeItself

	| account simplePortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: simplePortfolio accountsSize.
			self assert: (simplePortfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #ReceptiveAccountTest category: #'Portfolio-Solucion'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!ReceptiveAccountTest methodsFor: 'test - transfers' stamp: 'LR 6/22/2020 20:12:07'!
test01TransferValueMustBePositive
	self should: [Transfer register: -100 from: ReceptiveAccount new to: ReceptiveAccount new.]
	raise: Error
	withMessageText: Transfer negativeTransactionValueError.! !

!ReceptiveAccountTest methodsFor: 'test - transfers' stamp: 'LR 6/22/2020 20:15:22'!
test02TransferMustBeBetweenDifferentAccounts
	| account |
	account := ReceptiveAccount new.
	
	self should: [Transfer register: 100 from: account to: account.]
	raise: Error
	withMessageText: Transfer invalidAccountErrorMsg.! !

!ReceptiveAccountTest methodsFor: 'test - transfers' stamp: 'LR 6/22/2020 20:34:59'!
test03OutgoingTransferMustDecreaseBalance
	| account |
	account := ReceptiveAccount new.
	
	Transfer register: 400 from: account to: ReceptiveAccount new.
	self assert: -400 equals: account balance.! !

!ReceptiveAccountTest methodsFor: 'test - transfers' stamp: 'LR 6/22/2020 20:35:45'!
test04IncomingTransferMustIncreaseBalance
	| account |
	account := ReceptiveAccount new.
	
	Transfer register: 400 from: ReceptiveAccount new to: account.
	self assert: 400 equals: account balance.! !

!ReceptiveAccountTest methodsFor: 'test - transfers' stamp: 'LR 6/28/2020 18:02:53'!
test05FromATransferLegCanReachTheOtherLeg
	| accountSource accountDest transfer incomingTransfer outgoingTransfer |
	accountSource := ReceptiveAccount new.
	accountDest := ReceptiveAccount new.
	
	transfer := Transfer register: 400 from: accountSource to: accountDest.
	incomingTransfer := transfer incoming.
	outgoingTransfer := transfer outgoing.
	
	self assert: outgoingTransfer equals: incomingTransfer transfer outgoing.
	self assert: incomingTransfer equals: outgoingTransfer transfer incoming.	! !


!ReceptiveAccountTest methodsFor: 'tests' stamp: 'SA 6/29/2020 13:43:36'!
test01ReceptiveAccountShouldHaveBalanceZeroWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'SA 6/29/2020 13:44:48'!
test02WhenDepositShouldIncreasesBalanceOnReceptiveAccount 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'SA 6/29/2020 13:45:09'!
test03WhenWithdrawingShouldDecreasesBalanceOnReceptiveAccount 

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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'SA 6/29/2020 13:45:31'!
test05ReceptiveAccountShouldKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'SA 6/29/2020 13:46:01'!
test06ReceptiveAccountShouldNottKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'SA 6/29/2020 13:46:27'!
test07AccountShouldKnowsHisTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 100 on: account1.
		
	self assert: 1 equals: account1 transactions size .
	self assert: (account1 transactions includes: deposit1).
! !


!classDefinition: #TransferNetReportTest category: #'Portfolio-Solucion'!
TestCase subclass: #TransferNetReportTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferNetReportTest methodsFor: 'testing' stamp: 'LR 6/28/2020 20:35:21'!
accountWithOutgoingTransferTo: anAccount
	| account |
	
	account := ReceptiveAccount new.
	
	Deposit register: 400 on: account.
	Withdraw register: 100 on: account.
	Transfer register: 100 from: account to: anAccount.
	Transfer register: 10 from: anAccount to: account.
	
	^account! !

!TransferNetReportTest methodsFor: 'testing' stamp: 'SA 6/29/2020 13:40:12'!
test01ShouldReturnZeroNetValueWhenReportinAnAccountWithNoTransfers
	| transferNetReport |
	
	transferNetReport := (TransferNetReport newFor: ReceptiveAccount new) report.
	self assert: 0 equals: transferNetReport.! !

!TransferNetReportTest methodsFor: 'testing' stamp: 'SA 6/29/2020 13:38:51'!
test02ShouldReturnCorrectNetValueWhenReportingAnAccountWithTransfers
	| transferNetReport account |
	
	account := self accountWithOutgoingTransferTo: ReceptiveAccount new.
	transferNetReport := (TransferNetReport newFor: account) report.
	self assert: -90 equals: transferNetReport.! !

!TransferNetReportTest methodsFor: 'testing' stamp: 'SA 6/29/2020 13:39:38'!
test03ShouldReturnZeroNetValueWhenReportingAPortfolioWithTwoAccountsThatTranfersEachOther
	| transferNetReport account1 account2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Transfer register: 100 from: account1 to: account2.
	
	transferNetReport := (TransferNetReport newFor: (Portfolio with: account1 with: account2)) report.
	self assert: 0 equals: transferNetReport.! !


!classDefinition: #Account category: #'Portfolio-Solucion'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Account methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:24:25'!
isComposedBy: anAccount

	self subclassResponsibility ! !


!Account methodsFor: 'balance' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !


!Account methodsFor: 'transactions' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !

!Account methodsFor: 'transactions' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:24:04'!
addedTo: aPortfolio

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: #'Portfolio-Solucion'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !


!Portfolio methodsFor: 'initialization' stamp: 'HAW 5/25/2019 12:03:18'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !


!Portfolio methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:19:36'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ]! !


!Portfolio methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !

!Portfolio methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !


!Portfolio methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !


!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'Portfolio-Solucion'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: #'Portfolio-Solucion'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:24:46'!
balance

	^transactions 
		inject: 0
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/21/2019 18:55:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !


!classDefinition: #AccountTransaction category: #'Portfolio-Solucion'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'report' stamp: 'LR 6/28/2020 18:53:45'!
report: aReporter
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'Portfolio-Solucion'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/21/2019 18:54:27'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: #'Portfolio-Solucion'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'report' stamp: 'LR 6/28/2020 18:59:42'!
report: aReporter
	^aReporter reportDeposit: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'Portfolio-Solucion'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferLeg category: #'Portfolio-Solucion'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferLeg methodsFor: 'balance' stamp: 'LR 6/28/2020 18:36:02'!
affectBalance
	self subclassResponsibility ! !


!TransferLeg methodsFor: 'value' stamp: 'LR 6/28/2020 18:36:05'!
value
	self subclassResponsibility ! !


!TransferLeg methodsFor: 'report' stamp: 'LR 6/28/2020 18:53:31'!
report: aReporter
	self subclassResponsibility ! !


!classDefinition: #TransferIncoming category: #'Portfolio-Solucion'!
TransferLeg subclass: #TransferIncoming
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferIncoming methodsFor: 'initialization' stamp: 'LR 6/28/2020 17:49:27'!
initializeFor: aTransfer
	transfer := aTransfer.! !


!TransferIncoming methodsFor: 'balance' stamp: 'LR 6/28/2020 17:55:03'!
affectBalance: balance
	^balance + transfer value! !


!TransferIncoming methodsFor: 'private' stamp: 'LR 6/28/2020 17:59:08'!
transfer
	^transfer! !


!TransferIncoming methodsFor: 'value' stamp: 'LR 6/28/2020 18:34:02'!
value
	^transfer value! !


!TransferIncoming methodsFor: 'report' stamp: 'LR 6/28/2020 18:59:49'!
report: aReporter
	^aReporter reportIncomingTransfer: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferIncoming class' category: #'Portfolio-Solucion'!
TransferIncoming class
	instanceVariableNames: ''!

!TransferIncoming class methodsFor: 'instance creation' stamp: 'LR 6/28/2020 17:51:03'!
newFor: aTransfer 
	^self new initializeFor: aTransfer.! !


!classDefinition: #TransferOutgoing category: #'Portfolio-Solucion'!
TransferLeg subclass: #TransferOutgoing
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferOutgoing methodsFor: 'balance' stamp: 'LR 6/28/2020 17:55:13'!
affectBalance: balance
	^balance - transfer value! !


!TransferOutgoing methodsFor: 'initialization' stamp: 'LR 6/28/2020 17:51:31'!
initializeFor: aTransfer
	transfer := aTransfer.! !


!TransferOutgoing methodsFor: 'private' stamp: 'LR 6/28/2020 17:59:26'!
transfer
	^transfer! !


!TransferOutgoing methodsFor: 'value' stamp: 'LR 6/28/2020 18:34:16'!
value
	^transfer value! !


!TransferOutgoing methodsFor: 'report' stamp: 'LR 6/28/2020 18:59:55'!
report: aReporter
	^aReporter reportOutgoingTransfer: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferOutgoing class' category: #'Portfolio-Solucion'!
TransferOutgoing class
	instanceVariableNames: ''!

!TransferOutgoing class methodsFor: 'instance creation' stamp: 'LR 6/28/2020 17:51:09'!
newFor: aTransfer 
	^self new initializeFor: aTransfer.! !


!classDefinition: #Withdraw category: #'Portfolio-Solucion'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !


!Withdraw methodsFor: 'report' stamp: 'LR 6/28/2020 19:00:01'!
report: aReporter
	^aReporter reportWithdraw: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'Portfolio-Solucion'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Report category: #'Portfolio-Solucion'!
Object subclass: #Report
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Report methodsFor: 'report' stamp: 'LR 6/28/2020 19:39:32'!
report
	self subclassResponsibility ! !


!Report methodsFor: 'outgoing transfer' stamp: 'LR 6/28/2020 19:40:15'!
reportOutgoingTransfer: aTransferOutgoing
	self subclassResponsibility ! !


!Report methodsFor: 'deposit' stamp: 'LR 6/28/2020 19:40:22'!
reportDeposit: aDeposit
	self subclassResponsibility ! !


!Report methodsFor: 'incoming transfer' stamp: 'LR 6/28/2020 19:40:04'!
reportIncomingTransfer: aTransferIncoming
	self subclassResponsibility ! !


!Report methodsFor: 'withdraw' stamp: 'LR 6/28/2020 19:40:34'!
reportWithdraw: aWithdraw 
	self subclassResponsibility ! !


!classDefinition: #AccountSummaryReport category: #'Portfolio-Solucion'!
Report subclass: #AccountSummaryReport
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountSummaryReport methodsFor: 'report' stamp: 'LR 6/28/2020 19:02:08'!
balanceReport
	^'Balance = ', account balance asString.! !

!AccountSummaryReport methodsFor: 'report' stamp: 'LR 6/28/2020 19:10:27'!
report
	| reportSummary |
	reportSummary := OrderedCollection new.
	
	account transactions do: [
			:transaction |
			reportSummary add: (transaction report: self).
		].
	
	reportSummary add: self balanceReport.
	^reportSummary! !

!AccountSummaryReport methodsFor: 'report' stamp: 'LR 6/28/2020 19:12:35'!
transactionValueAsString: aTransaction
	^aTransaction value asString, '.'! !


!AccountSummaryReport methodsFor: 'initialization' stamp: 'LR 6/28/2020 18:21:42'!
initializeFor: anAccount
	account := anAccount! !


!AccountSummaryReport methodsFor: 'deposit' stamp: 'LR 6/28/2020 19:15:22'!
reportDeposit: aDeposit
	^'Depósito por ', (self transactionValueAsString: aDeposit).! !


!AccountSummaryReport methodsFor: 'withdraw' stamp: 'LR 6/28/2020 19:15:30'!
reportWithdraw: aWithdraw 
	^'Extracción por ', (self transactionValueAsString: aWithdraw).! !


!AccountSummaryReport methodsFor: 'incoming transfer' stamp: 'LR 6/28/2020 19:15:37'!
reportIncomingTransfer: aTransferIncoming 
	^'Entrada por transferencia de ', (self transactionValueAsString: aTransferIncoming).! !


!AccountSummaryReport methodsFor: 'outgoing transfer' stamp: 'LR 6/28/2020 19:15:43'!
reportOutgoingTransfer: aTransferOutgoing 
	^'Salida por transferencia de ', (self transactionValueAsString: aTransferOutgoing).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountSummaryReport class' category: #'Portfolio-Solucion'!
AccountSummaryReport class
	instanceVariableNames: ''!

!AccountSummaryReport class methodsFor: 'as yet unclassified' stamp: 'LR 6/28/2020 18:21:23'!
newFor: anAccount
	^self new initializeFor: anAccount! !


!classDefinition: #TransferNetReport category: #'Portfolio-Solucion'!
Report subclass: #TransferNetReport
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferNetReport methodsFor: 'initialization' stamp: 'LR 6/28/2020 19:25:49'!
initializeFor: anAccount 
	account := anAccount.! !


!TransferNetReport methodsFor: 'deposit' stamp: 'LR 6/28/2020 19:35:48'!
reportDeposit: aDeposit 
	^0.! !


!TransferNetReport methodsFor: 'incoming transfer' stamp: 'LR 6/28/2020 19:31:09'!
reportIncomingTransfer: aTransferIncoming 
	^aTransferIncoming value.! !


!TransferNetReport methodsFor: 'withdraw' stamp: 'LR 6/28/2020 19:35:56'!
reportWithdraw: aWithdraw 
	^0! !


!TransferNetReport methodsFor: 'outgoing transfer' stamp: 'LR 6/28/2020 19:30:13'!
reportOutgoingTransfer: aTransferOutgoing 
	^aTransferOutgoing value * (-1).! !


!TransferNetReport methodsFor: 'report' stamp: 'LR 6/28/2020 19:35:09'!
report
	^account transactions inject: 0 into: [
			:accum :transaction |
				accum + (transaction report: self).
		].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferNetReport class' category: #'Portfolio-Solucion'!
TransferNetReport class
	instanceVariableNames: ''!

!TransferNetReport class methodsFor: 'as yet unclassified' stamp: 'LR 6/28/2020 19:25:41'!
newFor: anAccount
	^self new initializeFor: anAccount.! !


!classDefinition: #Transfer category: #'Portfolio-Solucion'!
Object subclass: #Transfer
	instanceVariableNames: 'incoming outgoing value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Transfer methodsFor: 'accessing' stamp: 'LR 6/22/2020 21:21:31'!
incoming
	^incoming! !

!Transfer methodsFor: 'accessing' stamp: 'LR 6/22/2020 21:21:24'!
outgoing
	^outgoing ! !

!Transfer methodsFor: 'accessing' stamp: 'LR 6/28/2020 17:56:25'!
value
	^value! !


!Transfer methodsFor: 'initialization' stamp: 'LR 6/28/2020 17:54:28'!
initializeFor: aValue
	value := aValue.
	incoming := TransferIncoming newFor: self.
	outgoing := TransferOutgoing newFor: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: #'Portfolio-Solucion'!
Transfer class
	instanceVariableNames: 'incoming outgoing value'!

!Transfer class methodsFor: 'instance creation' stamp: 'LR 6/28/2020 17:52:01'!
newFor: aValue
	^self new initializeFor: aValue.! !

!Transfer class methodsFor: 'instance creation' stamp: 'LR 6/28/2020 18:08:15'!
register: aValue from: aSourceReceptiveAccount to: aDestinationReceptiveAccount
	| transfer |
	
	aValue < 1 ifTrue: [self error: self negativeTransactionValueError ].
	aSourceReceptiveAccount = aDestinationReceptiveAccount ifTrue: [self error: self invalidAccountErrorMsg ].
	
	transfer := Transfer newFor: aValue.
		
	aSourceReceptiveAccount register: transfer outgoing.
	aDestinationReceptiveAccount register: transfer incoming.
	
	^transfer! !


!Transfer class methodsFor: 'errors' stamp: 'LR 6/22/2020 20:14:27'!
invalidAccountErrorMsg
	^'source and destination accounts must be different'! !

!Transfer class methodsFor: 'errors' stamp: 'LR 6/22/2020 20:01:17'!
negativeTransactionValueError
	^'transaction value must be positive'! !
