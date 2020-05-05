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

!CustomerBookTest methodsFor: 'testing' stamp: 'LR 4/30/2020 21:53:15'!
messureRuntime: aBlock
 |millisecondsBeforeRunning millisecondsAfterRunning|
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	aBlock value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	^millisecondsAfterRunning - millisecondsBeforeRunning.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'LR 5/4/2020 23:10:32'!
on: blockToFail raises: error andSatisfies: aBlockToAssert
	
	[blockToFail value. self fail.] 
	on: error 
		do: ([:anError | self satisfy: (aBlockToAssert value: anError)]).! !

!CustomerBookTest methodsFor: 'testing' stamp: 'LR 5/4/2020 20:26:09'!
runtime: aMethod lessThan: upperBoundary
	^(self messureRuntime: aMethod) < (upperBoundary * millisecond).! !

!CustomerBookTest methodsFor: 'testing' stamp: 'LR 5/4/2020 23:05:41'!
satisfy: aBlockToAssert
	self assert: aBlockToAssert.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'LR 5/4/2020 20:25:43'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook|
	
	customerBook := CustomerBook new.
	self assert: (self runtime: [customerBook addCustomerNamed: 'John Lennon'.] lessThan: 50).
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'LR 5/4/2020 20:25:54'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	customerBook addCustomerNamed: paulMcCartney.
		
	self assert: (self runtime: [customerBook removeCustomerNamed: paulMcCartney.] lessThan: 100)! !

!CustomerBookTest methodsFor: 'testing' stamp: 'HernanWilkinson 5/9/2012 18:12'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	[ customerBook addCustomerNamed: ''.
	self fail ]
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'LR 5/4/2020 21:42:16'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	self xklnsknakn: [ customerBook removeCustomerNamed: 'Paul McCartney'.] jsnkjxn: NotFound.
	
	self assert: customerBook numberOfCustomers = 1.
	self assert: (customerBook includesCustomerNamed: johnLennon).
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'LR 5/4/2020 23:15:57'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	self on: [customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.]
	
	satisfy: [
	0 = customerBook numberOfActiveCustomers.
	1 = customerBook numberOfSuspendedCustomers.
	1 = customerBook numberOfCustomers.
	customerBook includesCustomerNamed: paulMcCartney not.
	]
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'LR 5/4/2020 23:15:10'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	self on: [
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.]
	satisfy: [
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

!CustomerBookTest methodsFor: 'testing' stamp: 'LR 5/4/2020 21:38:30'!
xklnsknakn: blockToFail jsnkjxn: error
	
	[blockToFail value. self fail.] 
	on: error 
		do: ([:anError| ^anError messageText]).! !

!CustomerBookTest methodsFor: 'testing' stamp: 'LR 5/4/2020 23:05:53'!
xklnsknakn: blockToFail jsnkjxn: error kslachka: aBlockToAssert
	
	[blockToFail value. self fail.] 
	on: error 
		do: ([:anError | self satisfy: (aBlockToAssert value: anError)]).! !


!classDefinition: #CustomerBook category: #'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'LR 5/4/2020 22:36:57'!
includesCustomerNamed: aCustomer
	^(self isCustomerActive: aCustomer) or: [ suspended includes: aCustomer ]! !

!CustomerBook methodsFor: 'testing' stamp: 'LR 5/4/2020 22:29:38'!
isCustomerActive: aCustomer

	^active includes: aCustomer! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 4/3/2019 10:14:26'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'LR 5/4/2020 21:40:46'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'LR 5/4/2020 22:28:44'!
numberOfActiveCustomers	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'LR 5/4/2020 22:28:11'!
numberOfCustomers	
	^self numberOfActiveCustomers + self numberOfSuspendedCustomers! !

!CustomerBook methodsFor: 'customer management' stamp: 'LR 5/4/2020 22:32:19'!
numberOfSuspendedCustomers	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'LR 5/4/2020 22:46:57'!
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

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'LR 5/4/2020 22:47:59'!
suspendCustomerNamed: aCustomerToSuspend
	
	(self isCustomerActive: aCustomerToSuspend) ifFalse: [^CantSuspend signal].
	self removeFromActive: aCustomerToSuspend.
	suspended add: aCustomerToSuspend.
! !

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
