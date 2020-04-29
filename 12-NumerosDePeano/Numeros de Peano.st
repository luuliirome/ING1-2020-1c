!classDefinition: #I category: #'Numeros de Peano'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: #'Numeros de Peano'!
I class
	instanceVariableNames: ''!

!I class methodsFor: 'base' stamp: 'LR 4/29/2020 18:32:45'!
> aNumber
	^false! !

!I class methodsFor: 'base' stamp: 'LR 4/29/2020 18:37:13'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^'No se puede dividir por un numero mayor'! !

!I class methodsFor: 'base' stamp: 'LR 4/29/2020 17:40:42'!
descripcionDeErrorDeNumerosNegativosNoSoportados
	^'Números negativos no soportados'! !

!I class methodsFor: 'base' stamp: 'LR 4/29/2020 17:59:13'!
next
	^self createChildNamed: self name , 'I'.! !


!I class methodsFor: 'operations' stamp: 'LR 4/29/2020 18:02:02'!
* aNumber
	^aNumber! !

!I class methodsFor: 'operations' stamp: 'LR 4/29/2020 17:59:43'!
+ aNumber 
	^aNumber next! !

!I class methodsFor: 'operations' stamp: 'LR 4/29/2020 17:49:43'!
- aNumber
	^self error: self descripcionDeErrorDeNumerosNegativosNoSoportados ! !

!I class methodsFor: 'operations' stamp: 'LR 4/29/2020 18:07:17'!
/ aNumber 
	aNumber = I ifTrue: [^self] ifFalse: [^self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor]! !


!I class methodsFor: 'private' stamp: 'LR 4/29/2020 19:07:38'!
substractFrom: aNumber
	^aNumber previous! !


!classDefinition: #II category: #'Numeros de Peano'!
I subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: #'Numeros de Peano'!
II class
	instanceVariableNames: ''!

!II class methodsFor: 'base' stamp: 'LR 4/29/2020 18:34:53'!
> aNumber
	aNumber = I ifTrue: [^true].
	^self previous > aNumber previous.! !

!II class methodsFor: 'base' stamp: 'LR 4/29/2020 17:54:58'!
previous
	^self parent! !


!II class methodsFor: 'operations' stamp: 'LR 4/29/2020 18:03:23'!
* aNumber
	^self previous * aNumber + aNumber
	! !

!II class methodsFor: 'operations' stamp: 'LR 4/29/2020 17:59:22'!
+ aNumber 
	^self previous + aNumber next! !

!II class methodsFor: 'operations' stamp: 'LR 4/29/2020 19:07:19'!
- aNumber
	^aNumber substractFrom: self! !

!II class methodsFor: 'operations' stamp: 'LR 4/29/2020 20:03:08'!
/ aNumber
	aNumber > self ifTrue: [^self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor].
	aNumber = self ifTrue: [^I].
	aNumber > (self - aNumber) ifTrue: [^I].
	
	^ self - aNumber / aNumber + I.! !


!II class methodsFor: 'private' stamp: 'LR 4/29/2020 19:07:27'!
substractFrom: aNumber
	^aNumber previous - self previous.! !


!classDefinition: #III category: #'Numeros de Peano'!
II subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!


!classDefinition: #IIII category: #'Numeros de Peano'!
III subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!


!classDefinition: #IIIII category: #'Numeros de Peano'!
IIII subclass: #IIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!


!classDefinition: #IIIIII category: #'Numeros de Peano'!
IIIII subclass: #IIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!


!classDefinition: #IIIIIII category: #'Numeros de Peano'!
IIIIII subclass: #IIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!


!classDefinition: #IIIIIIII category: #'Numeros de Peano'!
IIIIIII subclass: #IIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!


!classDefinition: #IIIIIIIII category: #'Numeros de Peano'!
IIIIIIII subclass: #IIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!


!classDefinition: #IIIIIIIIII category: #'Numeros de Peano'!
IIIIIIIII subclass: #IIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!


!classDefinition: #IIIIIIIIIII category: #'Numeros de Peano'!
IIIIIIIIII subclass: #IIIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!


!classDefinition: #IIIIIIIIIIII category: #'Numeros de Peano'!
IIIIIIIIIII subclass: #IIIIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!


!classDefinition: #TestNumerosDePeano category: #'Numeros de Peano'!
DenotativeObject subclass: #TestNumerosDePeano
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TestNumerosDePeano class' category: #'Numeros de Peano'!
TestNumerosDePeano class
	instanceVariableNames: ''!

!TestNumerosDePeano class methodsFor: 'as yet unclassified' stamp: 'AM 4/27/2020 21:25:55'!
test01

	Assert that: I successor isEqualTo: II.! !

!TestNumerosDePeano class methodsFor: 'as yet unclassified' stamp: 'LR 4/29/2020 17:55:50'!
test02

	Assert that: II previous isEqualTo: I.! !

!TestNumerosDePeano class methodsFor: 'as yet unclassified' stamp: 'AM 4/27/2020 21:28:06'!
test02ElSucesorDeUnNumeroNEsNAsterisco

	Assert that: II successor isEqualTo: III.! !

!TestNumerosDePeano class methodsFor: 'as yet unclassified' stamp: 'AM 4/27/2020 21:33:59'!
test03UnoMasUnNumeroEsIgualAlSucesorDelNumero

	Assert that: I + III isEqualTo: III successor! !

!TestNumerosDePeano class methodsFor: 'as yet unclassified' stamp: 'AM 4/27/2020 21:35:40'!
test04

	Assert that: II + III isEqualTo: IIII successor! !

!TestNumerosDePeano class methodsFor: 'as yet unclassified' stamp: 'AM 4/27/2020 21:52:23'!
test05

	Assert that: II - I isEqualTo: I! !

!TestNumerosDePeano class methodsFor: 'as yet unclassified' stamp: 'AM 4/27/2020 21:55:03'!
test06

	Assert that: IIII - II isEqualTo: II! !
