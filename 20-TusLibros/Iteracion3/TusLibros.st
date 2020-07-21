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


!classDefinition: #CartSessionTest category: #TusLibros!
TestCase subclass: #CartSessionTest
	instanceVariableNames: 'testObjects'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartSessionTest methodsFor: 'setUp/tearDown' stamp: 'LR 7/20/2020 21:17:23'!
setUp
	testObjects := TestObjects new.! !


!CartSessionTest methodsFor: 'testing' stamp: 'LR 7/20/2020 20:30:49'!
test01CantCreateCartSessionWithInvalidClientID
	self should: [CartSession for: testObjects createCart withID: 1 forClient: '' withTime: nil ]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [
			:anError |
			anError messageText = CartSession invalidClientErrorMessage
		]! !

!CartSessionTest methodsFor: 'testing' stamp: 'LR 7/20/2020 20:33:48'!
test02CanCreateCartSessionWithValidClientID
	| cartSession |
	cartSession := CartSession for: testObjects createCart withID: 1 forClient: testObjects clientID withTime: nil.
	self assert: testObjects clientID equals: cartSession client.! !

!CartSessionTest methodsFor: 'testing' stamp: 'LR 7/20/2020 21:19:27'!
test03IsExpiredOnPassed30MinutesReturnsTrue
	| cartSession |
	cartSession := CartSession for: testObjects createCart withID: 1 forClient: testObjects clientID withTime: testObjects lastAccessedTime .
	
	self assert: (cartSession isExpiredOn: testObjects expiredDateTime ).! !

!CartSessionTest methodsFor: 'testing' stamp: 'LR 7/20/2020 21:19:59'!
test04IsNotExpiredOnBefore30MinutesReturnsFalse
	| cartSession |
	cartSession := CartSession for: testObjects createCart withID: 1 forClient: testObjects clientID withTime: testObjects lastAccessedTime.
	
	self deny: (cartSession isExpiredOn: testObjects notExpiredDateTime).! !


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

!CartTest methodsFor: 'tests' stamp: 'SA 7/16/2020 14:14:36'!
test06CartRemembersAddedItems

	| cart |
	
	cart := testObjects createCart.
	
	cart add: testObjects itemSellByTheStore.
	self assert: (cart includes: testObjects itemSellByTheStore)! !

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

!CashierTest methodsFor: 'testing' stamp: 'LR 7/20/2020 19:35:07'!
test03SalesBookIsModifyWhenCheckouting
	| cart cashier |
	
	cart := testObjects createCart.
	cart add: testObjects itemSellByTheStore.
	cashier := Cashier withCart: cart using: testObjects createCard registerOn: salesBook withMerchantProcessor: testObjects merchantProcessorDoingNothing.

	cashier checkoutAt: testObjects beforeDueDate by: testObjects clientID.
	self assertSaleBookHasASale: (Sale of: cart items total: cart total by: testObjects clientID). 
	self assert: 1 equals: salesBook size.! !

!CashierTest methodsFor: 'testing' stamp: 'LR 7/20/2020 19:26:18'!
test04RaiseErrorWhenCheckoutIfMerchantProcessorFails
	"No me importa el error que retorne el merchant processor, ante un error, retorno.
	Otro objeto es responsable de catchear el error de si el MP está caido para generar el pedido en un archivo de input"
	
	| cashier |

	cashier := self createCashierWithMerchantProcessor: (testObjects merchantProcessorDoing: [self error: 'error with merchant processor']).

	self should: [cashier checkoutAt: testObjects beforeDueDate by:  testObjects clientID.]
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


!CashierTest methodsFor: 'asserts' stamp: 'LR 7/20/2020 19:26:29'!
assertCheckoutShouldRaiseExpiredCardErrorWithMerchantProcessor: aMerchantProcessor
	| cashier |
	cashier := self createCashierWithMerchantProcessor: aMerchantProcessor.
	
	self should: [cashier checkoutAt: testObjects passDueDate by:  testObjects clientID ]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier expiredCardErrorMessage.
	].
	! !

!CashierTest methodsFor: 'asserts' stamp: 'LR 7/19/2020 17:30:00'!
assertSaleBookHasASale: aSale 
	salesBook detect: [
			:sale |
			aSale client = sale client 
			and: aSale total = sale total
			and: aSale items = sale items
		]! !


!classDefinition: #ExternalInterfaceTest category: #TusLibros!
TestCase subclass: #ExternalInterfaceTest
	instanceVariableNames: 'testObjects'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!ExternalInterfaceTest methodsFor: 'testing' stamp: 'LR 7/20/2020 20:27:05'!
test01CantCreateCartWhenUsingInvalidPasswordAndClientID

	| rest authenticationErrorMsg |
	
	authenticationErrorMsg := 'invalid user and password'.
	
	rest := ExternalInterface withAuthentication: (testObjects authenticationDoing: [self error: authenticationErrorMsg]) withCatalog: testObjects defaultCatalog withBankCalendar: nil withMerchantProcessor: testObjects merchantProcessorDoingNothing withCalendar: nil.
	self should: [rest createCartFor: 'user' withPassword: 'password']
	raise: Error - MessageNotUnderstood 
	withExceptionDo:   [:anError |
			self assert: anError messageText = authenticationErrorMsg.]
		
		
		"Hablar del tema de authentication con error. Nos parecía que tenía más sentido que al intentar authenticar, falle; al implementar el mensaje isAuthenticated"! !

!ExternalInterfaceTest methodsFor: 'testing' stamp: 'LR 7/20/2020 21:15:51'!
test02CreateCartReturnsAValidCartIDWhenUsingValidParams

	| rest cartID |
	rest := ExternalInterface withAuthentication: (testObjects authenticationDoing: []) withCatalog: testObjects defaultCatalog withBankCalendar: nil withMerchantProcessor: testObjects merchantProcessorDoingNothing withCalendar: testObjects calendar.
	cartID := rest createCartFor: 'user' withPassword: 'password'.
	self assert: (rest listCart: cartID) isEmpty.! !

!ExternalInterfaceTest methodsFor: 'testing' stamp: 'LR 7/20/2020 21:15:51'!
test03CantAddToCartWhenUsingNonPositiveNumberOfItems

	| rest cartID |
	rest := ExternalInterface withAuthentication: (testObjects authenticationDoing: []) withCatalog: testObjects defaultCatalog withBankCalendar: nil withMerchantProcessor: testObjects merchantProcessorDoingNothing withCalendar: testObjects calendar.
	cartID := rest createCartFor: 'user' withPassword: 'password'.
	
	self should: [rest add: 0 of: testObjects itemSellByTheStore toCart: cartID]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [
			:anError |
			self assert: anError messageText = 'Invalid number of items'.
			self assert: (rest listCart: cartID) isEmpty.
		]
	! !

!ExternalInterfaceTest methodsFor: 'testing' stamp: 'LR 7/20/2020 21:15:51'!
test04CantAddToCartAnItemNotSellByTheStore

	| rest cartID |
	rest := ExternalInterface withAuthentication: (testObjects authenticationDoing: []) withCatalog: testObjects defaultCatalog withBankCalendar: nil withMerchantProcessor: testObjects merchantProcessorDoingNothing withCalendar: testObjects calendar.
	cartID := rest createCartFor: 'user' withPassword: 'password'.
	self should: [rest add: 2 of: testObjects itemNotSellByTheStore toCart: cartID]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [
			:anError |
			self assert: anError messageText = 'Item is not in catalog'.
			self assert: (rest listCart: cartID) isEmpty.
		]
	! !

!ExternalInterfaceTest methodsFor: 'testing' stamp: 'LR 7/20/2020 21:21:04'!
test05CantAddToCartWithInvalidCartID

	| rest invalidCartID |
	rest := ExternalInterface withAuthentication: (testObjects authenticationDoing: []) withCatalog: testObjects defaultCatalog withBankCalendar: nil withMerchantProcessor: testObjects merchantProcessorDoingNothing withCalendar: testObjects calendar.
	invalidCartID := 'invalid-cart-id'.
	self should: [rest add: 2 of: testObjects itemSellByTheStore toCart: invalidCartID]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [
			:anError |
			self assert: anError messageText = ExternalInterface invalidCartErrorMessage.
		]
! !

!ExternalInterfaceTest methodsFor: 'testing' stamp: 'LR 7/20/2020 21:15:51'!
test06ListCartShowsItemsAdded

	| rest cartID cartContent |
	rest := ExternalInterface withAuthentication: (testObjects authenticationDoing: []) withCatalog: testObjects defaultCatalog withBankCalendar: nil withMerchantProcessor: testObjects merchantProcessorDoingNothing withCalendar: testObjects calendar.
	cartID := rest createCartFor: 'user' withPassword: 'password'.
	rest add: 2 of: testObjects itemSellByTheStore toCart: cartID.
	
	cartContent := rest listCart: cartID.
	self assert: 2 equals: (cartContent occurrencesOf: testObjects itemSellByTheStore).
	self assert: 2 equals: cartContent size.! !

!ExternalInterfaceTest methodsFor: 'testing' stamp: 'LR 7/20/2020 21:21:04'!
test07CantListCartWithInvalidCartID

	| rest invalidCartID |
	rest := ExternalInterface withAuthentication: (testObjects authenticationDoing: []) withCatalog: testObjects defaultCatalog withBankCalendar: nil withMerchantProcessor: testObjects merchantProcessorDoingNothing withCalendar: testObjects calendar.
	invalidCartID := 'invalid-cart-id'.
	
	self should: [rest listCart: invalidCartID]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [
			:anError |
			self assert: anError messageText = ExternalInterface invalidCartErrorMessage.
		]
! !

!ExternalInterfaceTest methodsFor: 'testing' stamp: 'LR 7/20/2020 21:21:04'!
test08CantCheckoutCartWithInvalidCartID

	| rest invalidCartID |
	rest := ExternalInterface withAuthentication: (testObjects authenticationDoing: []) withCatalog: testObjects defaultCatalog withBankCalendar: nil withMerchantProcessor: testObjects merchantProcessorDoingNothing withCalendar: testObjects calendar.
	invalidCartID := 'invalid-cart-id'.
	
	self should: [rest checkout: invalidCartID usingCardNumber: '1234' withCardDueDate: testObjects dueDate withCardOwner: 'owner']
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [
			:anError |
			self assert: anError messageText = ExternalInterface invalidCartErrorMessage.
			self assert: rest salesBook isEmpty.
		].
! !

!ExternalInterfaceTest methodsFor: 'testing' stamp: 'LR 7/20/2020 21:15:51'!
test09CantCheckoutCartWithInvalidCardNumber

	| rest cartID |
	rest := ExternalInterface withAuthentication: (testObjects authenticationDoing: []) withCatalog: testObjects defaultCatalog withBankCalendar: nil withMerchantProcessor: testObjects merchantProcessorDoingNothing withCalendar: testObjects calendar.
	cartID := rest createCartFor: 'user' withPassword: 'password'.
	
	self should: [rest checkout: cartID usingCardNumber: '1234' withCardDueDate: testObjects dueDate withCardOwner: testObjects validOwner ]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [
			:anError |
			self assert: anError messageText = Card invalidIDErrorMessage.
			self assert: rest salesBook isEmpty.
		].
! !

!ExternalInterfaceTest methodsFor: 'testing' stamp: 'LR 7/20/2020 21:15:51'!
test10CantCheckoutCartWithInvalidCardOwner

	| rest cartID |
	rest := ExternalInterface withAuthentication: (testObjects authenticationDoing: []) withCatalog: testObjects defaultCatalog withBankCalendar: nil withMerchantProcessor: testObjects merchantProcessorDoingNothing withCalendar: testObjects calendar.
	cartID := rest createCartFor: 'user' withPassword: 'password'.
	
	self should: [rest checkout: cartID usingCardNumber: testObjects validIDNumber withCardDueDate: testObjects dueDate withCardOwner: testObjects invalidOwner ]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [
			:anError |
			self assert: anError messageText = Card invalidOwnerErrorMessage .
			self assert: rest salesBook isEmpty.
		].
! !

!ExternalInterfaceTest methodsFor: 'testing' stamp: 'LR 7/20/2020 21:15:51'!
test11CantCheckoutCartWithEmptyCart

	| rest cartID |
	rest := ExternalInterface withAuthentication: (testObjects authenticationDoing: []) withCatalog: testObjects defaultCatalog withBankCalendar: (BankCalendarSimulator doing: [^testObjects passDueDate]) withMerchantProcessor: testObjects merchantProcessorDoingNothing withCalendar: testObjects calendar.
	cartID := rest createCartFor: 'user' withPassword: 'password'.
	
	self should: [rest checkout: cartID usingCardNumber: testObjects validIDNumber withCardDueDate: testObjects dueDate withCardOwner: testObjects validOwner ]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [
			:anError |
			self assert: anError messageText = Cashier emptyCartErrorMessage .
			self assert: rest salesBook isEmpty.
		].
! !

!ExternalInterfaceTest methodsFor: 'testing' stamp: 'LR 7/20/2020 21:15:51'!
test12CantCheckoutCartWithExpiredCard

	| rest cartID |
	rest := ExternalInterface withAuthentication: (testObjects authenticationDoing: []) withCatalog: testObjects defaultCatalog withBankCalendar: (BankCalendarSimulator doing: [testObjects passDueDate]) withMerchantProcessor: testObjects merchantProcessorDoingNothing withCalendar: testObjects calendar.
	cartID := rest createCartFor: 'user' withPassword: 'password'.
	rest add: 4 of: testObjects itemSellByTheStore toCart: cartID.
	
	self should: [rest checkout: cartID usingCardNumber: testObjects validIDNumber withCardDueDate: testObjects dueDate withCardOwner: testObjects validOwner ]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [
			:anError |
			self assert: anError messageText = Cashier expiredCardErrorMessage.
			self assert: rest salesBook isEmpty.
		].
! !

!ExternalInterfaceTest methodsFor: 'testing' stamp: 'LR 7/20/2020 21:15:51'!
test13CantCheckoutWhenErrorWithMerchantProcessor
| rest cartID |
	rest := ExternalInterface withAuthentication: (testObjects authenticationDoing: []) withCatalog: testObjects defaultCatalog withBankCalendar: (BankCalendarSimulator doing: [testObjects beforeDueDate]) withMerchantProcessor: (testObjects merchantProcessorDoing: [self error: 'error with merchant processor']) withCalendar: testObjects calendar.
	
	cartID := rest createCartFor: 'user' withPassword: 'password'.
	rest add: 4 of: testObjects itemSellByTheStore toCart: cartID.
	
	self should: [rest checkout: cartID usingCardNumber: testObjects validIDNumber withCardDueDate: testObjects dueDate withCardOwner: testObjects validOwner ]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [
			:anError |
			self assert: anError messageText = 'error with merchant processor'.
			self assert: rest salesBook isEmpty.
		].
! !

!ExternalInterfaceTest methodsFor: 'testing' stamp: 'LR 7/20/2020 21:15:51'!
test14SalesBookTotalCorrectWhenCheckoutCart
	| rest cartID |
	
	rest := ExternalInterface withAuthentication: (testObjects authenticationDoing: []) withCatalog: testObjects defaultCatalog withBankCalendar: (BankCalendarSimulator doing: [testObjects beforeDueDate]) withMerchantProcessor: testObjects merchantProcessorDoingNothing withCalendar: testObjects calendar.
	cartID := rest createCartFor: testObjects clientID withPassword: 'password'.
	rest add: 4 of: testObjects itemSellByTheStore toCart: cartID.
	rest checkout: cartID usingCardNumber: testObjects validIDNumber withCardDueDate: testObjects dueDate withCardOwner: testObjects validOwner.
	
	self assert: 4000 equals: (rest salesBook at: 1) total.
! !

!ExternalInterfaceTest methodsFor: 'testing' stamp: 'LR 7/20/2020 21:15:51'!
test15CantListPurchasesOfInvalidClientID
	| rest |
	
	rest := ExternalInterface withAuthentication: (testObjects authenticationDoing: []) withCatalog: testObjects defaultCatalog withBankCalendar: (BankCalendarSimulator doing: [testObjects beforeDueDate]) withMerchantProcessor: testObjects merchantProcessorDoingNothing withCalendar: testObjects calendar.
	self should: [rest listPurchases: 'invalid-client-id'.]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [
			:anError |
			self assert: anError messageText = ExternalInterface invalidClientErrorMessage.
			self assert: rest salesBook isEmpty.
		]! !

!ExternalInterfaceTest methodsFor: 'testing' stamp: 'LR 7/20/2020 21:30:06'!
test16ListPurchasesOfClientWithNoPurchasesShouldReturnEmptyListOfSales
	| rest |
	
	rest := ExternalInterface withAuthentication: (testObjects authenticationDoing: []) withCatalog: testObjects defaultCatalog withBankCalendar: (BankCalendarSimulator doing: [testObjects beforeDueDate]) withMerchantProcessor: testObjects merchantProcessorDoingNothing withCalendar: testObjects calendar.
	
	rest createCartFor: testObjects clientID withPassword: 'password'.
	
	self assert: ((rest listPurchases: testObjects clientID) at: 'items') isEmpty.
	self assert: 0 equals: ((rest listPurchases: testObjects clientID) at: 'total').	
	
	! !

!ExternalInterfaceTest methodsFor: 'testing' stamp: 'LR 7/20/2020 21:31:05'!
test17ListPurchasesOfClientWithOnePurchaseShouldReturnListOfSales
	| rest cartID purchases |
	
	rest := ExternalInterface withAuthentication: (testObjects authenticationDoing: []) withCatalog: testObjects defaultCatalog withBankCalendar: (BankCalendarSimulator doing: [testObjects beforeDueDate]) withMerchantProcessor: testObjects merchantProcessorDoingNothing withCalendar: testObjects calendar.
	
	cartID := rest createCartFor: testObjects clientID withPassword: 'password'.
	rest add: 4 of: testObjects itemSellByTheStore toCart: cartID.
	rest checkout: cartID usingCardNumber: testObjects validIDNumber withCardDueDate: testObjects dueDate withCardOwner: testObjects validOwner.
	
	purchases := rest listPurchases: testObjects clientID.
	self assert: 4 equals: (purchases at: 'items') size.
	self assert: 4000 equals: (purchases at: 'total').
	self assert: 4 equals: ((purchases at: 'items') occurrencesOf: testObjects itemSellByTheStore).
	
	! !

!ExternalInterfaceTest methodsFor: 'testing' stamp: 'LR 7/20/2020 21:28:59'!
test18ListPurchasesOfClientWithSeveralPurchasesShouldReturnListOfSales
	| rest cartID purchases |
	
	rest := ExternalInterface withAuthentication: (testObjects authenticationDoing: []) withCatalog: testObjects defaultCatalog withBankCalendar: (BankCalendarSimulator doing: [testObjects beforeDueDate]) withMerchantProcessor: testObjects merchantProcessorDoingNothing withCalendar: testObjects calendar.
	
	cartID := rest createCartFor: testObjects clientID withPassword: 'password'.
	rest add: 4 of: testObjects itemSellByTheStore toCart: cartID.
	rest checkout: cartID usingCardNumber: testObjects validIDNumber withCardDueDate: testObjects dueDate withCardOwner: testObjects validOwner.


	cartID := rest createCartFor: testObjects clientID withPassword: 'password'.
	rest add: 5 of: testObjects anotherItemSellByTheStore toCart: cartID.
	rest add: 4 of: testObjects itemSellByTheStore toCart: cartID.
	rest checkout: cartID usingCardNumber: testObjects validIDNumber withCardDueDate: testObjects dueDate withCardOwner: testObjects validOwner.
	
	purchases := rest listPurchases: testObjects clientID.
	self assert: 2 equals: purchases size.
	
	self assert: 10500 equals: (purchases at: 'total').
	self assert: 8 equals: ((purchases at: 'items') occurrencesOf: testObjects itemSellByTheStore).
	self assert: 5 equals: ((purchases at: 'items') occurrencesOf: testObjects anotherItemSellByTheStore).! !

!ExternalInterfaceTest methodsFor: 'testing' stamp: 'LR 7/20/2020 21:21:04'!
test19CantCheckoutACartAlreadyCheckouted

"Solo chequeamos este caso, ya que por la implementación, una vez hecho el checkout, el cart pasa a ser INVALIDO, y el caso de carrito invalido con cada operacion ya está chequeado."
	| rest cartID |
	
	rest := ExternalInterface withAuthentication: (testObjects authenticationDoing: []) withCatalog: testObjects defaultCatalog withBankCalendar: (BankCalendarSimulator doing: [testObjects beforeDueDate]) withMerchantProcessor: testObjects merchantProcessorDoingNothing withCalendar: testObjects calendar.
	
	cartID := rest createCartFor: testObjects clientID withPassword: 'password'.
	rest add: 4 of: testObjects itemSellByTheStore toCart: cartID.
	rest checkout: cartID usingCardNumber: testObjects validIDNumber withCardDueDate: testObjects dueDate withCardOwner: testObjects validOwner.

	self should: [rest checkout: cartID usingCardNumber: testObjects validIDNumber withCardDueDate: testObjects dueDate withCardOwner: testObjects validOwner.]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [
			:anError |
			self assert: anError messageText = ExternalInterface invalidCartErrorMessage.
		]
	
	
	
	
	! !

!ExternalInterfaceTest methodsFor: 'testing' stamp: 'LR 7/20/2020 21:21:04'!
test20CantDoAnythingWithAnExpiredCart

	| rest cartID calendar |
	
	calendar := testObjects calendar.
	
	rest := ExternalInterface withAuthentication: (testObjects authenticationDoing: []) withCatalog: testObjects defaultCatalog withBankCalendar: (BankCalendarSimulator doing: [testObjects beforeDueDate]) withMerchantProcessor: testObjects merchantProcessorDoingNothing withCalendar: calendar.
	
	cartID := rest createCartFor: testObjects clientID withPassword: 'password'.
	calendar now: testObjects expiredDateTime.
	self should: [rest checkout: cartID usingCardNumber: testObjects validIDNumber withCardDueDate: testObjects dueDate withCardOwner: testObjects validOwner.]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [
			:anError |
			self assert: anError messageText = ExternalInterface invalidCartErrorMessage.
		]
	
	
	
	
	! !


!ExternalInterfaceTest methodsFor: 'setUp/tearDown' stamp: 'LR 7/16/2020 18:56:46'!
setUp
	testObjects := TestObjects new.! !


!classDefinition: #TestObjects category: #TusLibros!
TestCase subclass: #TestObjects
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TestObjects methodsFor: 'support' stamp: 'LR 7/19/2020 17:45:23'!
anotherItemSellByTheStore
	^'anotherValidBook'! !

!TestObjects methodsFor: 'support' stamp: 'LR 7/16/2020 18:57:12'!
authenticationDoing: aBlockClosure 
	^AuthenticationSimulator doing: aBlockClosure! !

!TestObjects methodsFor: 'support' stamp: 'LR 7/13/2020 20:12:02'!
beforeDueDate
	^FixedGregorianDate year: self dueDate year previous
	month:  self dueDate month
	dayNumber: 19.! !

!TestObjects methodsFor: 'support' stamp: 'LR 7/19/2020 17:35:11'!
clientID
	^'valid client id'! !

!TestObjects methodsFor: 'support' stamp: 'LR 7/13/2020 20:00:58'!
createCard
	
	^Card withID: self validIDNumber 
	for: self validOwner 
	until: self dueDate.! !

!TestObjects methodsFor: 'support' stamp: 'LR 7/20/2020 19:29:00'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog.! !

!TestObjects methodsFor: 'support' stamp: 'LR 7/19/2020 17:45:13'!
defaultCatalog
	| defaultCatalog |
	
	defaultCatalog := Dictionary new. 
	defaultCatalog at: self itemSellByTheStore put: 1000.
	defaultCatalog at: self anotherItemSellByTheStore put: 500.
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


!TestObjects methodsFor: 'as yet unclassified' stamp: 'LR 7/20/2020 21:19:39'!
calendar
	^CalendarSimulator withANowValue: self lastAccessedTime.! !

!TestObjects methodsFor: 'as yet unclassified' stamp: 'LR 7/20/2020 21:17:53'!
expiredDateTime
	^GregorianDateTime
		date: (FixedGregorianDate yearNumber: 2004 monthNumber: 01 dayNumber: 01)
		timeOfDay: (TimeOfDay  hours: 00 minutes: 30 seconds: 10).! !

!TestObjects methodsFor: 'as yet unclassified' stamp: 'LR 7/20/2020 21:19:39'!
lastAccessedTime
	^GregorianDateTime
		date: (FixedGregorianDate yearNumber: 2003 monthNumber: 12 dayNumber: 31)
		timeOfDay: (TimeOfDay  hours: 23 minutes: 59 seconds: 59).
	! !

!TestObjects methodsFor: 'as yet unclassified' stamp: 'LR 7/20/2020 21:18:10'!
notExpiredDateTime
	^GregorianDateTime
		date: (FixedGregorianDate yearNumber: 2004 monthNumber: 01 dayNumber: 01)
		timeOfDay: (TimeOfDay  hours: 00 minutes: 10 seconds: 10).! !


!classDefinition: #AuthenticationSimulator category: #TusLibros!
Object subclass: #AuthenticationSimulator
	instanceVariableNames: 'authenticationBehaviour'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!AuthenticationSimulator methodsFor: 'initialization' stamp: 'LR 7/16/2020 19:05:19'!
initializeDoing: aBehaviour
	authenticationBehaviour := aBehaviour.! !


!AuthenticationSimulator methodsFor: 'authenticate' stamp: 'LR 7/16/2020 19:06:15'!
authenticate: anUser using: aPassword
	^authenticationBehaviour value
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AuthenticationSimulator class' category: #TusLibros!
AuthenticationSimulator class
	instanceVariableNames: ''!

!AuthenticationSimulator class methodsFor: 'instance creation' stamp: 'LR 7/19/2020 16:12:19'!
doing: anAuthenticationBehaviour
	^self new initializeDoing: anAuthenticationBehaviour.! !


!classDefinition: #BankCalendarSimulator category: #TusLibros!
Object subclass: #BankCalendarSimulator
	instanceVariableNames: 'todayBehaviour'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!BankCalendarSimulator methodsFor: 'initialization' stamp: 'LR 7/19/2020 16:12:56'!
initializeDoing: aTodayBehaviour
	todayBehaviour := aTodayBehaviour.! !


!BankCalendarSimulator methodsFor: 'today' stamp: 'LR 7/19/2020 16:13:09'!
today
	^todayBehaviour value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'BankCalendarSimulator class' category: #TusLibros!
BankCalendarSimulator class
	instanceVariableNames: ''!

!BankCalendarSimulator class methodsFor: 'instance creation' stamp: 'LR 7/19/2020 16:12:42'!
doing: aTodayBehaviour 
	^self new initializeDoing: aTodayBehaviour.! !


!classDefinition: #CalendarSimulator category: #TusLibros!
Object subclass: #CalendarSimulator
	instanceVariableNames: 'nowBehaviour now'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CalendarSimulator methodsFor: 'initialization' stamp: 'LR 7/20/2020 21:12:11'!
initializeWithNowValue: nowValue 
	now := nowValue.! !


!CalendarSimulator methodsFor: 'testing' stamp: 'LR 7/20/2020 21:11:41'!
now
	^now.! !

!CalendarSimulator methodsFor: 'testing' stamp: 'LR 7/20/2020 21:13:42'!
now: aNowValue
	now := aNowValue.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CalendarSimulator class' category: #TusLibros!
CalendarSimulator class
	instanceVariableNames: ''!

!CalendarSimulator class methodsFor: 'instance creation' stamp: 'LR 7/20/2020 21:12:52'!
withANowValue: aNowValue 
	^self new initializeWithNowValue: aNowValue.! !


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


!Card methodsFor: 'assertions' stamp: 'SA 7/16/2020 14:15:45'!
assertValidIDNumber: anIDNumber
	(anIDNumber size ~= 16 or: (self areAllNumberDigits: anIDNumber) not )
	ifTrue: [^self error: self class invalidIDErrorMessage].
	! !

!Card methodsFor: 'assertions' stamp: 'LR 7/12/2020 21:38:05'!
assertValidOwnerValue: anOwner
	anOwner ifEmpty: [^self error: self class invalidOwnerErrorMessage ]! !


!Card methodsFor: 'expired' stamp: 'LR 7/13/2020 20:19:48'!
isExpiredOn: aDate
	^(aDate year = dueDate year and: aDate month > dueDate month) 
	or: aDate year > dueDate year! !


!Card methodsFor: 'private' stamp: 'SA 7/16/2020 14:15:45'!
areAllNumberDigits: anIDNumber	
	^anIDNumber allSatisfy: [:digit | self validDigits includes: digit ].
	! !

!Card methodsFor: 'private' stamp: 'LR 7/12/2020 22:10:05'!
validDigits
	^{$0. $1. $2. $3. $4. $5. $6. $7. $8. $9}.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Card class' category: #TusLibros!
Card class
	instanceVariableNames: ''!

!Card class methodsFor: 'errors' stamp: 'LR 7/12/2020 21:15:35'!
invalidIDErrorMessage
	^'invalid ID number'! !

!Card class methodsFor: 'errors' stamp: 'LR 7/12/2020 21:38:16'!
invalidOwnerErrorMessage
	^'invalid owner'! !


!Card class methodsFor: 'instance creation' stamp: 'LR 7/12/2020 21:27:18'!
withID: anIDNumber for: anOwner until: aDueDate
	"self assertValidIDNumber: anIDNumber. "
	^self new initializeWithID: anIDNumber for: anOwner until: aDueDate.
	! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'catalog items client'
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


!Cart methodsFor: 'initialization' stamp: 'LR 7/20/2020 19:28:31'!
initializeAcceptingItemsOf: aCatalog  
	catalog := aCatalog.
	items := Bag new.! !


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


!Cart methodsFor: 'accessing' stamp: 'LR 7/19/2020 17:22:20'!
client
	^client! !

!Cart methodsFor: 'accessing' stamp: 'LR 7/19/2020 15:13:45'!
items
	^items copy! !

!Cart methodsFor: 'accessing' stamp: 'LR 7/12/2020 22:26:58'!
total
	^items inject: 0 into: [
			:accum :item |
				accum + catalog at: item
		]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'LR 7/20/2020 19:27:57'!
acceptingItemsOf: aCatalog 
	^self new initializeAcceptingItemsOf: aCatalog.! !



!Cart class methodsFor: 'errors' stamp: 'LR 7/19/2020 17:13:12'!
invalidClientErrorMessage
	^'invalid client'! !


!classDefinition: #CartSession category: #TusLibros!
Object subclass: #CartSession
	instanceVariableNames: 'client cart id lastAccessedTime'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartSession methodsFor: 'initialization' stamp: 'LR 7/20/2020 20:56:45'!
for: aCart withID: aCartID forClient: aClientID withTime: datetime
	cart := aCart.
	id := aCartID.
	client := aClientID.
	lastAccessedTime := datetime.
	! !


!CartSession methodsFor: 'accessing' stamp: 'LR 7/20/2020 20:33:54'!
client
	^client! !

!CartSession methodsFor: 'accessing' stamp: 'LR 7/20/2020 20:56:22'!
isExpiredOn: aGregorianDateTime 
	^(aGregorianDateTime distanceFrom: lastAccessedTime) 
	greaterThanSimpleMeasure: (SimpleMeasure amount: 30 unit: minute).! !


!CartSession methodsFor: 'as yet unclassified' stamp: 'LR 7/20/2020 21:08:28'!
cart
	^cart! !

!CartSession methodsFor: 'as yet unclassified' stamp: 'LR 7/20/2020 21:08:22'!
updateLastAccess: aGregorianDateTime 
	lastAccessedTime := aGregorianDateTime! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CartSession class' category: #TusLibros!
CartSession class
	instanceVariableNames: ''!

!CartSession class methodsFor: 'instance creation' stamp: 'LR 7/20/2020 20:02:30'!
for: aCart withID: aCartID forClient: aClientID withTime: aTime
	self assertValidClient: aClientID.
	^self new for: aCart withID: aCartID forClient: aClientID withTime: aTime.
	 ! !


!CartSession class methodsFor: 'as yet unclassified' stamp: 'LR 7/20/2020 20:31:38'!
assertValidClient: aClientID
	aClientID = '' ifTrue: [self error: self invalidClientErrorMessage].! !

!CartSession class methodsFor: 'as yet unclassified' stamp: 'LR 7/20/2020 20:31:49'!
invalidClientErrorMessage
	^'invalid client'! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: 'sales cart card salesBook merchantProcessor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'validations' stamp: 'LR 7/13/2020 20:23:24'!
assertCardExpiration: aDate
	(card isExpiredOn: aDate) ifTrue: [^self error: self class expiredCardErrorMessage]! !


!Cashier methodsFor: 'initialization' stamp: 'LR 7/19/2020 16:15:09'!
initializeWithACart: aCart using: aCard registerOn: aSalesBook withMerchantProcessor: aMerchantProcessor  
	cart := aCart.
	card := aCard.
	salesBook := aSalesBook.
	merchantProcessor := aMerchantProcessor.! !


!Cashier methodsFor: 'checkout' stamp: 'LR 7/20/2020 19:25:34'!
checkoutAt: aDate by: aClient 
	self assertCardExpiration: aDate.
	"aqui se hace el cobro con el merchant order"
	merchantProcessor debit: cart total from: card.
	salesBook add: (Sale of: (cart items) total: cart total by: aClient).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'errors' stamp: 'LR 7/12/2020 20:02:56'!
emptyCartErrorMessage
	^'Cant checkout empty cart'! !

!Cashier class methodsFor: 'errors' stamp: 'LR 7/13/2020 20:23:37'!
expiredCardErrorMessage
	^'expired card'! !


!Cashier class methodsFor: 'instance creation' stamp: 'LR 7/19/2020 16:15:16'!
withCart: aCart using: aCard registerOn: aSalesBook withMerchantProcessor: aMerchantProcessor  
	self assertNotEmptyCart: aCart.
	^self new initializeWithACart: aCart using: aCard registerOn: aSalesBook withMerchantProcessor: aMerchantProcessor.! !


!Cashier class methodsFor: 'assertions' stamp: 'LR 7/19/2020 16:15:33'!
assertNotEmptyCart: aCart 
	aCart isEmpty ifTrue: [^self error: self emptyCartErrorMessage].! !


!classDefinition: #ExternalInterface category: #TusLibros!
Object subclass: #ExternalInterface
	instanceVariableNames: 'authentication carts catalog randomizer salesBook bankCalendar merchantProcessor clients calendar'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!ExternalInterface methodsFor: 'initialization' stamp: 'LR 7/20/2020 20:25:58'!
initializeWithAuthentication: anAuthentication withCatalog: aCatalog withBankCalendar: aBankCalendar withMerchantProcessor: aMerchantProcessor withCalendar: aCalendar     
	authentication := anAuthentication.
	carts := Dictionary new.
	clients := OrderedCollection new.
	catalog := aCatalog.
	bankCalendar := aBankCalendar. 
	salesBook := OrderedCollection new.
	merchantProcessor := aMerchantProcessor.
	calendar := aCalendar.! !


!ExternalInterface methodsFor: 'private - testing' stamp: 'LR 7/19/2020 15:55:38'!
salesBook
	^salesBook copy.! !


!ExternalInterface methodsFor: 'checkout' stamp: 'LR 7/20/2020 21:36:07'!
checkout: aCartID usingCardNumber: aCardNumber withCardDueDate: aDueDate withCardOwner: anOwner
	| card cashier |
	
	self withCartID: aCartID do: [ 
		:aCartSession |
		
	card := Card withID: aCardNumber for: anOwner until: aDueDate.
	
	cashier := Cashier withCart: aCartSession cart using: card registerOn: salesBook withMerchantProcessor: merchantProcessor.
	cashier checkoutAt: bankCalendar today by: aCartSession client.
	self removeCartID: aCartID.
	]
	
	 
	! !


!ExternalInterface methodsFor: 'accessing' stamp: 'LR 7/20/2020 21:08:53'!
listCart: aCartID	
	self withCartID: aCartID do: [
			:aCartSession |
			^aCartSession cart items
		]! !

!ExternalInterface methodsFor: 'accessing' stamp: 'LR 7/19/2020 17:48:48'!
listPurchases: aClientID
	( clients includes: aClientID ) ifFalse: [self error: self class invalidClientErrorMessage].
	^self purchasesOf: aClientID.! !


!ExternalInterface methodsFor: 'private' stamp: 'LR 7/20/2020 21:27:27'!
purchasesOf: aClientID
	|purchases items|
	
	items := Bag new.
	purchases := Dictionary new.
	
	purchases at: 'total' put: (self salesBook inject: 0 into: [
			:total :aSale |
			aSale client = aClientID ifTrue: [
					items addAll: aSale items.
					total + aSale total.
				]
		]).
	purchases at: 'items' put: items.
	^purchases.
		! !

!ExternalInterface methodsFor: 'private' stamp: 'LR 7/20/2020 21:36:58'!
removeCartID: aCartID 
	carts removeKey: aCartID ifAbsent: [].! !

!ExternalInterface methodsFor: 'private' stamp: 'LR 7/20/2020 21:21:04'!
withCartID: aCartID do: aClosure
	| cartSession |
	cartSession := carts at: aCartID ifAbsent: [self error: self class invalidCartErrorMessage].
	self assertSessionExpiration: cartSession forCartID: aCartID.
	cartSession updateLastAccess: calendar now.
	aClosure value: cartSession.! !


!ExternalInterface methodsFor: 'cart creation' stamp: 'LR 7/20/2020 21:03:49'!
createCartFor: aClientID withPassword: aPassword
	| cart cartID |
	
	authentication authenticate: aClientID using: aPassword.
	cart := Cart acceptingItemsOf: catalog.
	cartID := self createCartID.
	carts at: cartID put: (CartSession for: cart withID: cartID forClient: aClientID withTime: calendar now).
	(clients includes: aClientID) ifFalse: [clients add: aClientID].
	^cartID! !

!ExternalInterface methodsFor: 'cart creation' stamp: 'LR 7/16/2020 20:18:21'!
createCartID
	^LaggedFibonacciRandom new next asString.! !


!ExternalInterface methodsFor: 'adding' stamp: 'LR 7/20/2020 20:20:33'!
add: anAmount of: anItem toCart: aCartID
	self withCartID: aCartID do: [
			:aCartSession |
			aCartSession cart add: anAmount of: anItem.
		]! !


!ExternalInterface methodsFor: 'assertions' stamp: 'LR 7/20/2020 21:35:55'!
assertSessionExpiration: aCartSession forCartID: aCartID
	(aCartSession isExpiredOn: calendar now) ifTrue: [
		self removeCartID: aCartID.
		self error: self class invalidCartErrorMessage 
	].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ExternalInterface class' category: #TusLibros!
ExternalInterface class
	instanceVariableNames: ''!

!ExternalInterface class methodsFor: 'instance creation' stamp: 'LR 7/20/2020 20:27:05'!
withAuthentication: anAuthentication withCatalog: aCatalog withBankCalendar: aBankCalendar withMerchantProcessor: aMerchantProcessor withCalendar: aCalendar     
	^self new initializeWithAuthentication: anAuthentication withCatalog: aCatalog withBankCalendar: aBankCalendar withMerchantProcessor: aMerchantProcessor withCalendar: aCalendar.! !


!ExternalInterface class methodsFor: 'errors' stamp: 'LR 7/20/2020 21:21:10'!
invalidCartErrorMessage
	^'invalid cart'! !

!ExternalInterface class methodsFor: 'errors' stamp: 'LR 7/19/2020 17:18:19'!
invalidClientErrorMessage
	^'invalid client'! !


!classDefinition: #MerchantProcessor category: #TusLibros!
Object subclass: #MerchantProcessor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!MerchantProcessor methodsFor: 'value' stamp: 'LR 7/19/2020 18:06:42'!
debit: anAmount from: aCard
	self subclassResponsibility ! !


!MerchantProcessor methodsFor: 'initialization' stamp: 'LR 7/19/2020 18:06:55'!
doing: aBehaviour
	self subclassResponsibility ! !


!MerchantProcessor methodsFor: 'testing' stamp: 'LR 7/19/2020 18:06:46'!
wasCalled
	self subclassResponsibility ! !


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


!MerchantProcessorSimulator methodsFor: 'initialization' stamp: 'LR 7/19/2020 18:06:27'!
doing: aDebitBehaviour
	debitBehaviour := aDebitBehaviour .
	wasCalled := false.! !


!MerchantProcessorSimulator methodsFor: 'testing' stamp: 'LR 7/15/2020 20:06:38'!
wasCalled
	^wasCalled! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MerchantProcessorSimulator class' category: #TusLibros!
MerchantProcessorSimulator class
	instanceVariableNames: ''!

!MerchantProcessorSimulator class methodsFor: 'instance creation' stamp: 'LR 7/13/2020 21:17:06'!
doing: aBlockClosure 
	^self new doing:  aBlockClosure! !


!MerchantProcessorSimulator class methodsFor: 'errors' stamp: 'LR 7/13/2020 21:18:55'!
simulatedErrorMessage
	^'error with merchant processor'! !


!classDefinition: #Sale category: #TusLibros!
Object subclass: #Sale
	instanceVariableNames: 'client items total'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Sale methodsFor: 'initialization' stamp: 'LR 7/19/2020 17:23:50'!
initializeOf: itemsPurchased total: aTotalOfPurchase by: aClient 
	items := itemsPurchased.
	total := aTotalOfPurchase.
	client := aClient.! !


!Sale methodsFor: 'accessing' stamp: 'LR 7/19/2020 17:31:09'!
client
	^client! !

!Sale methodsFor: 'accessing' stamp: 'LR 7/19/2020 17:31:25'!
items
	^items copy! !

!Sale methodsFor: 'accessing' stamp: 'LR 7/19/2020 17:31:17'!
total
	^total! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sale class' category: #TusLibros!
Sale class
	instanceVariableNames: ''!

!Sale class methodsFor: 'instance creation' stamp: 'LR 7/19/2020 17:23:33'!
of: itemsPurchased total: aTotalOfPurchase by: aClient
 	^self new initializeOf: itemsPurchased total: aTotalOfPurchase by: aClient.
	! !
