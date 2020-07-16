!classDefinition: #CardTest category: #TusLibros!
TestCase subclass: #CardTest
	instanceVariableNames: 'dueDate testObjects beforeDueDate passDueDate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CardTest methodsFor: 'setUp/tearDown' stamp: 'LR 7/13/2020 19:22:16'!
setUp
	dueDate := GregorianMonthOfYear yearNumber: 2020 monthNumber:12.
	beforeDueDate := FixedGregorianDate yearNumber: 2020 monthNumber: 1 dayNumber: 1.
	passDueDate := FixedGregorianDate yearNumber: 2021 monthNumber: 1 dayNumber: 1.
	testObjects := TestObjects new.! !


!CardTest methodsFor: 'support' stamp: 'LR 7/13/2020 19:45:43'!
createCardDueTo: aDueDate
	
	^Card withID: testObjects validIDNumber 
	for: testObjects validOwner 
	until: aDueDate.! !


!CardTest methodsFor: 'testing' stamp: 'LR 7/13/2020 20:03:44'!
test01CantCreateACardWithAnInvalidIDNumber
	self should: [Card withID: testObjects invalidIDNumber for: testObjects validOwner until: testObjects dueDate. ]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [ :anError |
			self assert: anError messageText = Card invalidIDErrorMessage].
	! !

!CardTest methodsFor: 'testing' stamp: 'LR 7/13/2020 20:03:48'!
test02CantCreateACardWithAnInvalidOwner
	self should: [Card withID: testObjects validIDNumber for: testObjects invalidOwner until: testObjects dueDate. ]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [ :anError |
			self assert: anError messageText = Card invalidOwnerErrorMessage].
	! !

!CardTest methodsFor: 'testing' stamp: 'LR 7/13/2020 20:36:39'!
test03IsExpiredOnReturnsTrueWhenCardIsExpiredOnTheDatePassed
	self assert: (testObjects createCard isExpiredOn: testObjects passDueDate).! !

!CardTest methodsFor: 'testing' stamp: 'LR 7/13/2020 20:36:31'!
test04IsExpiredOnReturnsFalseWhenCardIsNotExpiredOnTheDatePassed
	self deny: (testObjects createCard isExpiredOn: testObjects beforeDueDate).! !


!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: 'testObjects'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'setUp/tearDown' stamp: 'LR 7/13/2020 18:46:19'!
setUp
	testObjects := TestObjects new! !


!CartTest methodsFor: 'tests' stamp: 'LR 7/13/2020 18:46:32'!
test01NewCartsAreCreatedEmpty

	self assert: testObjects createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'LR 7/13/2020 18:46:45'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := testObjects createCart.
	
	self 
		should: [ cart add: testObjects itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'LR 7/13/2020 18:46:56'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := testObjects createCart.
	
	cart add: testObjects itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'LR 7/13/2020 18:47:06'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := testObjects createCart.
	
	self 
		should: [cart add: 0 of: testObjects itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'LR 7/13/2020 18:47:15'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := testObjects createCart.
	
	self 
		should: [cart add: 2 of: testObjects itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'LR 7/13/2020 18:47:24'!
test06CartRemembersAddedItems

	| cart |
	
	cart := testObjects createCart.
	
	cart add: testObjects itemSellByTheStore.
	self assert: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'LR 7/13/2020 18:47:31'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := testObjects createCart.
	
	self deny: (cart includes: testObjects itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'LR 7/13/2020 18:47:45'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := testObjects createCart.
	
	cart add: 2 of: testObjects itemSellByTheStore.
	self assert: (cart occurrencesOf: testObjects itemSellByTheStore) = 2! !

!CartTest methodsFor: 'tests' stamp: 'LR 7/13/2020 18:47:50'!
test09EmptyCartShouldReturnZeroWhenTotalMessageReceived
	| cart |
	cart := testObjects createCart.
	self assert: 0 equals: cart total.! !

!CartTest methodsFor: 'tests' stamp: 'LR 7/13/2020 18:47:59'!
test10CartWithItemsShouldReturnCorrectAmountWhenTotalMessageReceived
	| cart |
	cart := testObjects createCart.
	cart add: testObjects itemSellByTheStore.
	self assert: 1000 equals: cart total.! !


!classDefinition: #CashierTest category: #TusLibros!
TestCase subclass: #CashierTest
	instanceVariableNames: 'testObjects salesBook'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'setUp/tearDown' stamp: 'LR 7/13/2020 20:45:13'!
setUp
	salesBook := OrderedCollection new.
	testObjects := TestObjects new.! !


!CashierTest methodsFor: 'testing - private' stamp: 'LR 7/15/2020 20:34:07'!
createCashierWithMerchantProcessor: aMerchantProcessor
	|cart|
	cart := testObjects createCart.
	cart add: testObjects itemSellByTheStore.
	^Cashier withCart: cart using: testObjects createCard registerOn: salesBook withMerchantProcessor: aMerchantProcessor.! !


!CashierTest methodsFor: 'testing' stamp: 'LR 7/13/2020 21:15:27'!
test01CantCreateCashierWithEmptyCart
	self should: [
		Cashier withCart: testObjects createCart 
		using: testObjects createCard 
		registerOn: salesBook withMerchantProcessor: testObjects merchantProcessorDoingNothing.
	]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier emptyCartErrorMessage.]! !

!CashierTest methodsFor: 'testing' stamp: 'LR 7/15/2020 20:48:02'!
test02CantCheckoutWithAnExpiredCard	
	self assertCheckoutShouldRaiseExpiredCardErrorWithMerchantProcessor: testObjects merchantProcessorDoingNothing..
	self assert: salesBook isEmpty.! !

!CashierTest methodsFor: 'testing' stamp: 'LR 7/13/2020 21:15:39'!
test03SalesBookIsModifyWhenCheckouting
	| cart cashier |
	
	cart := testObjects createCart.
	cart add: testObjects itemSellByTheStore.
	cashier := Cashier withCart: cart using: testObjects createCard registerOn: salesBook withMerchantProcessor: testObjects merchantProcessorDoingNothing.

	cashier checkoutAt: testObjects beforeDueDate.
	self assert: (salesBook includes: cart total). 
	self assert: 1 equals: salesBook size.! !

!CashierTest methodsFor: 'testing' stamp: 'LR 7/15/2020 20:34:47'!
test04RaiseErrorWhenCheckoutIfMerchantProcessorFails
	"No me importa el error que retorne el merchant processor, ante un error, retorno.
	Otro objeto es responsable de catchear el error de si el MP está caido para generar el pedido en un archivo de input"
	
	| cashier |

	cashier := self createCashierWithMerchantProcessor: (testObjects merchantProcessorDoing: [self error: 'error with merchant processor']).

	self should: [cashier checkoutAt: testObjects beforeDueDate.]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [ :anError |
			self assert: anError messageText = MerchantProcessorSimulator simulatedErrorMessage.
			self assert: salesBook isEmpty.]! !

!CashierTest methodsFor: 'testing' stamp: 'LR 7/15/2020 20:48:18'!
test05MerchantProcessorIsNotCalledWhenCheckoutWithAnExpiredCard
	| merchantProcessor |
	
	merchantProcessor := testObjects merchantProcessorDoingNothing.
	self assertCheckoutShouldRaiseExpiredCardErrorWithMerchantProcessor: merchantProcessor.
	self deny: merchantProcessor wasCalled.
! !


!CashierTest methodsFor: 'as yet unclassified' stamp: 'LR 7/15/2020 20:48:02'!
assertCheckoutShouldRaiseExpiredCardErrorWithMerchantProcessor: aMerchantProcessor
	| cashier |
	cashier := self createCashierWithMerchantProcessor: aMerchantProcessor.
	
	self should: [cashier checkoutAt: testObjects passDueDate ]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier expiredCardErrorMessage.
	].
	! !


!classDefinition: #TestObjects category: #TusLibros!
TestCase subclass: #TestObjects
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TestObjects methodsFor: 'support' stamp: 'LR 7/13/2020 20:12:02'!
beforeDueDate
	^FixedGregorianDate year: self dueDate year previous
	month:  self dueDate month
	dayNumber: 19.! !

!TestObjects methodsFor: 'support' stamp: 'LR 7/13/2020 20:00:58'!
createCard
	
	^Card withID: self validIDNumber 
	for: self validOwner 
	until: self dueDate.! !

!TestObjects methodsFor: 'support' stamp: 'LR 7/13/2020 18:45:03'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!TestObjects methodsFor: 'support' stamp: 'LR 7/13/2020 18:45:15'!
defaultCatalog
	| defaultCatalog |
	
	defaultCatalog := Dictionary new. 
	defaultCatalog at: self itemSellByTheStore put: 1000.
	^defaultCatalog.! !

!TestObjects methodsFor: 'support' stamp: 'LR 7/13/2020 20:07:39'!
dueDate
	^GregorianMonthOfYear yearNumber: 2003 monthNumber:10.! !

!TestObjects methodsFor: 'support' stamp: 'LR 7/13/2020 18:50:20'!
invalidIDNumber
	^'012345ab89876543'! !

!TestObjects methodsFor: 'support' stamp: 'LR 7/13/2020 18:50:25'!
invalidOwner
	^''! !

!TestObjects methodsFor: 'support' stamp: 'LR 7/13/2020 18:45:32'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!TestObjects methodsFor: 'support' stamp: 'LR 7/13/2020 18:45:40'!
itemSellByTheStore
	^'validBook'! !

!TestObjects methodsFor: 'support' stamp: 'LR 7/13/2020 21:14:31'!
merchantProcessorDoing: aClosureToExecute
	^MerchantProcessorSimulator doing: aClosureToExecute.! !

!TestObjects methodsFor: 'support' stamp: 'LR 7/13/2020 21:16:39'!
merchantProcessorDoingNothing
	^MerchantProcessorSimulator doing: [].! !

!TestObjects methodsFor: 'support' stamp: 'LR 7/13/2020 20:12:14'!
passDueDate
	^FixedGregorianDate year: self dueDate year next
	month:  self dueDate month
	dayNumber: 19.! !

!TestObjects methodsFor: 'support' stamp: 'LR 7/13/2020 18:50:09'!
validIDNumber
	^'0123456789876543'! !

!TestObjects methodsFor: 'support' stamp: 'LR 7/13/2020 18:49:49'!
validOwner
	^'Pepito Gonzalez'! !


!classDefinition: #Card category: #TusLibros!
Object subclass: #Card
	instanceVariableNames: 'owner id dueDate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Card methodsFor: 'initialization' stamp: 'LR 7/12/2020 21:41:12'!
initializeWithID: anIDNumber for: anOwner until: aDueDate 
	self assertValidIDNumber: anIDNumber.
	self assertValidOwnerValue: anOwner.
	id := anIDNumber.
	owner := anOwner.
	dueDate := aDueDate.! !


!Card methodsFor: 'assertions' stamp: 'LR 7/12/2020 22:14:47'!
assertValidIDNumber: anIDNumber
	(anIDNumber size ~= 16 or: (self areAllNumbers: anIDNumber) not )
	ifTrue: [^self error: self class invalidIDErrorMessage].
	! !

!Card methodsFor: 'assertions' stamp: 'LR 7/12/2020 21:38:05'!
assertValidOwnerValue: anOwner
	anOwner ifEmpty: [^self error: self class invalidOwnerErrorMessage ]! !


!Card methodsFor: 'expired' stamp: 'LR 7/13/2020 20:19:48'!
isExpiredOn: aDate
	^(aDate year = dueDate year and: aDate month > dueDate month) 
	or: aDate year > dueDate year! !


!Card methodsFor: 'private' stamp: 'LR 7/12/2020 22:15:00'!
areAllNumbers: anIDNumber	
	^anIDNumber allSatisfy: [:digit | self validDigits includes: digit ].
	! !

!Card methodsFor: 'private' stamp: 'LR 7/12/2020 22:10:05'!
validDigits
	^{$0. $1. $2. $3. $4. $5. $6. $7. $8. $9}.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Card class' category: #TusLibros!
Card class
	instanceVariableNames: ''!

!Card class methodsFor: 'as yet unclassified' stamp: 'LR 7/12/2020 21:15:35'!
invalidIDErrorMessage
	^'invalid ID number'! !

!Card class methodsFor: 'as yet unclassified' stamp: 'LR 7/12/2020 21:38:16'!
invalidOwnerErrorMessage
	^'invalid owner'! !

!Card class methodsFor: 'as yet unclassified' stamp: 'LR 7/12/2020 21:27:18'!
withID: anIDNumber for: anOwner until: aDueDate
	"self assertValidIDNumber: anIDNumber. "
	^self new initializeWithID: anIDNumber for: anOwner until: aDueDate.
	! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'catalog items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidQuantityErrorMessage
	
	^'Invalid number of items'! !


!Cart methodsFor: 'assertions' stamp: 'LR 7/12/2020 22:16:27'!
assertIsValidItem: anItem

	(catalog includesKey: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 17:48'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := OrderedCollection new.! !


!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:51'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	1 to: aQuantity do: [ :aNumber | items add: anItem ]! !


!Cart methodsFor: 'as yet unclassified' stamp: 'LR 7/12/2020 22:26:58'!
total
	^items inject: 0 into: [
			:accum :item |
				accum + catalog at: item
		]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: 'sales cart card salesBook merchantProcessor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'validations' stamp: 'LR 7/13/2020 20:23:24'!
assertCardExpiration: aDate
	(card isExpiredOn: aDate) ifTrue: [^self error: self class expiredCardErrorMessage]! !

!Cashier methodsFor: 'validations' stamp: 'LR 7/12/2020 21:10:32'!
assertNotEmptyCart: aCart 
	aCart isEmpty ifTrue: [^self error: self class emptyCartErrorMessage].! !


!Cashier methodsFor: 'initialization' stamp: 'LR 7/13/2020 20:59:32'!
initializeWithACart: aCart using: aCard registerOn: aSalesBook withMerchantProcessor: aMerchantProcessor  
	self assertNotEmptyCart: aCart.
	cart := aCart.
	card := aCard.
	salesBook := aSalesBook.
	merchantProcessor := aMerchantProcessor.! !


!Cashier methodsFor: 'checkout' stamp: 'LR 7/13/2020 21:19:42'!
checkoutAt: aDate
	self assertCardExpiration: aDate.
	"aqui se hace el cobro con el merchant order"
	merchantProcessor debit: cart total from: card.
	salesBook add: cart total.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'as yet unclassified' stamp: 'LR 7/12/2020 20:02:56'!
emptyCartErrorMessage
	^'Cant checkout empty cart'! !

!Cashier class methodsFor: 'as yet unclassified' stamp: 'LR 7/13/2020 20:23:37'!
expiredCardErrorMessage
	^'expired card'! !

!Cashier class methodsFor: 'as yet unclassified' stamp: 'LR 7/13/2020 20:59:49'!
withCart: aCart using: aCard registerOn: aSalesBook withMerchantProcessor: aMerchantProcessor  
	^self new initializeWithACart: aCart using: aCard registerOn: aSalesBook withMerchantProcessor: aMerchantProcessor.! !


!classDefinition: #MerchantProcessor category: #TusLibros!
Object subclass: #MerchantProcessor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!


!classDefinition: #MerchantProcessorSimulator category: #TusLibros!
MerchantProcessor subclass: #MerchantProcessorSimulator
	instanceVariableNames: 'debitBehaviour wasCalled'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!MerchantProcessorSimulator methodsFor: 'value' stamp: 'LR 7/15/2020 20:07:27'!
debit: anAmount from: aCard
	wasCalled := true.
	debitBehaviour value! !


!MerchantProcessorSimulator methodsFor: 'initialization' stamp: 'LR 7/15/2020 20:07:14'!
doing: aBlockClosure 
	debitBehaviour := aBlockClosure .
	wasCalled := false.! !


!MerchantProcessorSimulator methodsFor: 'testing' stamp: 'LR 7/15/2020 20:06:38'!
wasCalled
	^wasCalled! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MerchantProcessorSimulator class' category: #TusLibros!
MerchantProcessorSimulator class
	instanceVariableNames: ''!

!MerchantProcessorSimulator class methodsFor: 'as yet unclassified' stamp: 'LR 7/13/2020 21:17:06'!
doing: aBlockClosure 
	^self new doing:  aBlockClosure! !

!MerchantProcessorSimulator class methodsFor: 'as yet unclassified' stamp: 'LR 7/13/2020 21:18:55'!
simulatedErrorMessage
	^'error with merchant processor'! !
