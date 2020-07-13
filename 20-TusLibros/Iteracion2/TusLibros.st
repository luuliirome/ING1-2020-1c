!classDefinition: #CardTest category: #TusLibros!
TestCase subclass: #CardTest
	instanceVariableNames: 'dueDate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CardTest methodsFor: 'setUp/tearDown' stamp: 'LR 7/12/2020 21:24:59'!
setUp
	dueDate := GregorianMonthOfYear yearNumber: 2020 monthNumber:12.! !


!CardTest methodsFor: 'testing' stamp: 'LR 7/12/2020 22:11:00'!
test01CantCreateACardWithAnInvalidIDNumber
	self should: [Card withID: '12345678912345as' for: 'owner' until: dueDate. ]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [ :anError |
			self assert: anError messageText = Card invalidIDErrorMessage].
	! !

!CardTest methodsFor: 'testing' stamp: 'LR 7/12/2020 21:34:33'!
test02CantCreateACardWithAnInvalidOwner
	self should: [Card withID: '1234567898765432' for: '' until: dueDate. ]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [ :anError |
			self assert: anError messageText = Card invalidOwnerErrorMessage].
	! !

!CardTest methodsFor: 'testing' stamp: 'LR 7/12/2020 21:40:17'!
test03CardIsCreatedWhenUsingValidParams
	| card id owner |
	id := '1234567898765432'.
	owner := 'me'.
	card := Card withID: id for: owner until: dueDate.
	
	self assert: owner equals: card owner.
	self assert: id equals: card id.
	self assert: dueDate equals: card dueDate.	! !


!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:08'!
test01NewCartsAreCreatedEmpty

	self assert: self createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [ cart add: self itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 0 of: self itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 2 of: self itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test06CartRemembersAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self assert: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := self createCart.
	
	self deny: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: 2 of: self itemSellByTheStore.
	self assert: (cart occurrencesOf: self itemSellByTheStore) = 2! !

!CartTest methodsFor: 'tests' stamp: 'LR 7/12/2020 22:24:37'!
test09EmptyCartShouldReturnZeroWhenTotalMessageReceived
	| cart |
	cart := self createCart.
	self assert: 0 equals: cart total.! !

!CartTest methodsFor: 'tests' stamp: 'LR 7/12/2020 22:27:55'!
test10CartWithItemsShouldReturnCorrectAmountWhenTotalMessageReceived
	| cart |
	cart := self createCart.
	cart add: self itemSellByTheStore.
	self assert: 1000 equals: cart total.! !


!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:48'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!CartTest methodsFor: 'support' stamp: 'LR 7/12/2020 22:23:25'!
defaultCatalog
	| defaultCatalog |
	
	defaultCatalog := Dictionary new. 
	defaultCatalog at: self itemSellByTheStore put: 1000.
	^defaultCatalog.! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:44'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!CartTest methodsFor: 'support' stamp: 'LR 7/12/2020 22:21:02'!
itemSellByTheStore
	^'validBook'! !


!classDefinition: #CashierTest category: #TusLibros!
TestCase subclass: #CashierTest
	instanceVariableNames: 'emptyCart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'as yet unclassified' stamp: 'LR 7/12/2020 19:59:27'!
setUp
	emptyCart := Cart acceptingItemsOf: (Array with: 'valid book')! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'LR 7/12/2020 21:11:10'!
test01CantCheckoutEmptyCart
	| cashier |
	cashier := Cashier new.
	self should: [ cashier checkout: emptyCart with: Card new.]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier emptyCartErrorMessage.
			self assert: cashier sales isEmpty].
	! !


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


!Card methodsFor: 'accessing' stamp: 'LR 7/12/2020 21:41:23'!
dueDate
	^dueDate! !

!Card methodsFor: 'accessing' stamp: 'LR 7/12/2020 21:40:42'!
id
	^id! !

!Card methodsFor: 'accessing' stamp: 'LR 7/12/2020 21:40:35'!
owner
	^owner! !


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
	instanceVariableNames: 'sales'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'as yet unclassified' stamp: 'LR 7/12/2020 21:10:32'!
assertNotEmptyCart: aCart 
	aCart isEmpty ifTrue: [^self error: self class emptyCartErrorMessage].! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'LR 7/12/2020 21:09:32'!
checkout: aCart with: aCard 
	self assertNotEmptyCart: aCart.
	"self assertCartDueDate: aCard."! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'LR 7/12/2020 20:55:05'!
initialize
	sales := OrderedCollection new.! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'LR 7/12/2020 21:10:44'!
sales
	^sales! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'as yet unclassified' stamp: 'LR 7/12/2020 20:02:56'!
emptyCartErrorMessage
	^'Cant checkout empty cart'! !
