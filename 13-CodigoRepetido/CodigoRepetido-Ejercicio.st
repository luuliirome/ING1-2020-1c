!classDefinition: #CantSuspend category: #'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: #'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: #'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'assertions' stamp: 'LR 5/6/2020 22:30:43'!
on: aBlockToFail raises: expectedErrorType andSatisfies: aBlockToAssert
	
	[aBlockToFail value. self fail.] 
	on: expectedErrorType 
		do: ([:anError | self satisfy: (aBlockToAssert value: anError)]).! !

!CustomerBookTest methodsFor: 'assertions' stamp: 'LR 5/6/2020 21:19:15'!
on: aBlockToExecute satisfies: aBlockToAssert
	
	[aBlockToExecute value.].
	self satisfy: aBlockToAssert! !

!CustomerBookTest methodsFor: 'assertions' stamp: 'LR 5/6/2020 21:33:58'!
on: aMethod shouldTakeLessThanMilliseconds: upperBoundary
	^self satisfy: [(self messureRuntime: aMethod) < (upperBoundary * millisecond)].! !

!CustomerBookTest methodsFor: 'assertions' stamp: 'LR 5/4/2020 23:05:41'!
satisfy: aBlockToAssert
	self assert: aBlockToAssert.! !


!CustomerBookTest methodsFor: 'time' stamp: 'LR 4/30/2020 21:53:15'!
messureRuntime: aBlock
 |millisecondsBeforeRunning millisecondsAfterRunning|
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	aBlock value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	^millisecondsAfterRunning - millisecondsBeforeRunning.! !


!CustomerBookTest methodsFor: 'testing' stamp: 'LR 5/6/2020 21:34:32'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook|
	
	customerBook := CustomerBook new.
	self on:[customerBook addCustomerNamed: 'John Lennon'.] shouldTakeLessThanMilliseconds: 50.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'LR 5/6/2020 21:36:53'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	customerBook addCustomerNamed: paulMcCartney.
		
	self on:[customerBook removeCustomerNamed: paulMcCartney.] shouldTakeLessThanMilliseconds: 100.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'LR 5/6/2020 21:17:51'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	self on: [ customerBook addCustomerNamed: ''.]
		raises: Error 
		andSatisfies: [ :anError | anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage. customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'LR 5/6/2020 21:20:23'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self on: [ customerBook removeCustomerNamed: 'Paul McCartney'.]
	raises: NotFound 
	andSatisfies: [ :anError | customerBook numberOfCustomers = 1. customerBook includesCustomerNamed: johnLennon.]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'LR 5/6/2020 21:23:07'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	self on: [customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.]
	satisfies: [
	0 = customerBook numberOfActiveCustomers.
	1 = customerBook numberOfSuspendedCustomers.
	1 = customerBook numberOfCustomers.
	(customerBook includesCustomerNamed: paulMcCartney) not.]
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'LR 5/6/2020 21:20:42'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	self on: [
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.]
	satisfies: [
	0 = customerBook numberOfActiveCustomers.
	0 = customerBook numberOfSuspendedCustomers.
	0 = customerBook numberOfCustomers.
	(customerBook includesCustomerNamed: paulMcCartney) not.]


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'LR 5/4/2020 23:12:26'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self on: [ customerBook suspendCustomerNamed: 'Ringo Starr'.]
		raises: CantSuspend 
		andSatisfies: [ :anError | customerBook numberOfCustomers = 1. customerBook includesCustomerNamed: johnLennon. ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'LR 5/4/2020 23:11:14'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	self on: [ customerBook suspendCustomerNamed: johnLennon.] raises: CantSuspend andSatisfies: 
			[ :anError | customerBook numberOfCustomers = 1. customerBook includesCustomerNamed: johnLennon. ]
! !


!classDefinition: #CustomerBook category: #'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'customer state' stamp: 'LR 5/4/2020 22:29:38'!
isCustomerActive: aCustomer

	^active includes: aCustomer! !

!CustomerBook methodsFor: 'customer state' stamp: 'LR 5/6/2020 22:06:50'!
isCustomerSuspended: aCustomer

	^suspended includes: aCustomer! !


!CustomerBook methodsFor: 'customer book state' stamp: 'LR 5/6/2020 22:06:26'!
includesCustomerNamed: aCustomer
	^(self isCustomerActive: aCustomer) or: [ self isCustomerSuspended: aCustomer ]! !

!CustomerBook methodsFor: 'customer book state' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 4/3/2019 10:14:26'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'LR 5/6/2020 22:13:42'!
removeCustomerNamed: aCustomerToRemove

	(self includesCustomerNamed: aCustomerToRemove) ifFalse: [^NotFound signal.].
	
	(self isCustomerActive: aCustomerToRemove) ifTrue: [^self removeFromActive: aCustomerToRemove].
	self removeFromSuspended: aCustomerToRemove.! !

!CustomerBook methodsFor: 'customer management' stamp: 'LR 5/4/2020 22:47:17'!
removeFromActive: aCustomerToRemove
	active remove: aCustomerToRemove.! !

!CustomerBook methodsFor: 'customer management' stamp: 'LR 5/4/2020 22:47:25'!
removeFromSuspended: aCustomerToRemove
	suspended remove: aCustomerToRemove.! !

!CustomerBook methodsFor: 'customer management' stamp: 'LR 5/4/2020 22:47:59'!
suspendCustomerNamed: aCustomerToSuspend
	
	(self isCustomerActive: aCustomerToSuspend) ifFalse: [^CantSuspend signal].
	self removeFromActive: aCustomerToSuspend.
	suspended add: aCustomerToSuspend.
! !


!CustomerBook methodsFor: 'registration' stamp: 'LR 5/6/2020 22:14:21'!
addCustomerNamed: aCustomerToAdd

	aCustomerToAdd isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aCustomerToAdd) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aCustomerToAdd ! !


!CustomerBook methodsFor: 'errors' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'errors' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !


!CustomerBook methodsFor: 'inventory' stamp: 'LR 5/4/2020 22:28:44'!
numberOfActiveCustomers	
	^active size! !

!CustomerBook methodsFor: 'inventory' stamp: 'LR 5/4/2020 22:28:11'!
numberOfCustomers	
	^self numberOfActiveCustomers + self numberOfSuspendedCustomers! !

!CustomerBook methodsFor: 'inventory' stamp: 'LR 5/4/2020 22:32:19'!
numberOfSuspendedCustomers	
	^suspended size! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: #'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
