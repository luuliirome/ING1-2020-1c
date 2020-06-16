!classDefinition: #TerniLapilliTests category: #TerniLapilli!
TestCase subclass: #TerniLapilliTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/11/2020 20:52:38'!
test01GameIsNotOverIfNeverStarted
	|game|
	
	game := TerniLapilli new.
	self deny: (game isOver)! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/11/2020 20:52:58'!
test02XStartsTheGame
	|game|
	
	game := TerniLapilli new.
	self assert: (game isPlayingX)! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/11/2020 20:53:06'!
test03ODoesNotStartTheGame
	|game|
	
	game := TerniLapilli new.
	self deny: (game isPlayingO)! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 20:00:26'!
test04PutXInAnInvalidPositionWillRaiseAnError
	|game|
	
	game := TerniLapilli new.
	[game putXAt: 4@1. self fail.]
	on: Error 
	do: [self success: true.]! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 20:00:32'!
test05PutOInAnInvalidPositionWillRaiseAnError
	|game|
	
	game := TerniLapilli new.
	game putXAt: 1@1.
	[game putOAt: 4@1. self fail.]
	on: Error 
	do: [self success: true.]! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 20:00:48'!
test06OCantPlayIfIsXTurn
	|game|
	
	game := TerniLapilli new.
	[game putOAt: 1@1. self fail.]
	on: Error 
	do: [ self success: true. ]
	! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 20:00:57'!
test07XCantPlayIfIsOTurn
	|game|
	
	game := TerniLapilli new.
	game putXAt: 1@1.
	[game putXAt: 2@1. self fail.]
	on: Error 
	do: [ self success: true. ]
	! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 20:01:05'!
test08AfterXIsOTurn
	|game|
	
	game := TerniLapilli new.
	game putXAt: 1@1.
	self deny: (game isPlayingX).
	self assert: (game isPlayingO).! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 20:01:14'!
test09AfterOIsXTurn
	|game|
	
	game := TerniLapilli new.
	game putXAt: 2@1.
	game putOAt: 1@1.
	self assert: (game isPlayingX).
	self deny: (game isPlayingO).! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 20:01:25'!
test10CantPutAChipInATakenSpace
	|game|
	
	game := TerniLapilli new.
	game putXAt: 1@1.
	[game putOAt: 1@1. self fail.]
	on: Error
	do: [self success: true.]! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 20:01:52'!
test11AfterAll6ChipsInTheBoardOnlyCanMovePreviousChips
	|game|
	
	game := TerniLapilli new.
	game putXAt: 1@1.
	game putOAt: 2@1.
	
	game putXAt: 1@2.
	game putOAt: 1@3.

	game putXAt: 2@2.
	game putOAt: 2@3.
	
	[game putXAt: 3@2. self fail.]
	on: Error
	do: [self success: true.]! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 20:21:46'!
test12CantMoveXChipIfSourcePositionIsFilledByAnOChip
	|game|
	
	game := TerniLapilli new.
	game putXAt: 1@1. 
	game putOAt: 2@1.
	
	game putXAt: 1@2.
	game putOAt: 1@3.

	game putXAt: 2@2.
	game putOAt: 2@3.
	
	[game moveXAt: 2@3 to: 3@3. self fail.]
	on: Error
	do: [self success: true.]! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 20:22:13'!
test13CantMoveOChipIfSourcePositionIsFilledByAnXChip
	|game|
	
	game := TerniLapilli new.
	game putXAt: 1@1. 
	game putOAt: 2@1.
	
	game putXAt: 1@2.
	game putOAt: 1@3.

	game putXAt: 2@2.
	game putOAt: 2@3.
	
	game moveXAt: 2@2 to: 3@2.
	[game moveOAt: 3@2 to: 3@3. self fail.]
	on: Error
	do: [self success: true.]! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 20:22:53'!
test14CantMoveOChipIfIsXTurn
	|game|
	
	game := TerniLapilli new.
	game putXAt: 1@1. 
	game putOAt: 2@1.
	
	game putXAt: 1@2.
	game putOAt: 1@3.

	game putXAt: 2@2.
	game putOAt: 2@3.
	
	[game moveOAt: 2@1 to: 3@1. self fail.]
	on: Error
	do: [self success: true.]! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 20:21:14'!
test15CantMoveXChipIfIsOTurn
	|game|
	
	game := TerniLapilli new.
	game putXAt: 1@1. 
	game putOAt: 2@1.
	
	game putXAt: 1@2.
	game putOAt: 1@3.

	game putXAt: 2@2.
	game putOAt: 2@3. 
	
	game moveXAt: 2@2 to: 3@2.
	[game moveXAt: 3@2 to: 3@3. self fail.]
	on: Error
	do: [self success: true.]! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 20:26:46'!
test16CanNotMoveChipToAnInvalidPosition
	|game|
	
	game := TerniLapilli new.
"	game putXAt: 0@0. 
	game putOAt: 1@0.
	
	game putXAt: 0@1.
	game putOAt: 0@2.

	game putXAt: 1@1.
	game putOAt: 1@2.
	
	game moveXAt: 1@1 to: 2@1."! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 20:23:43'!
testIfAPlayerHasThreeOnARowTheGameIsOver
	|game|
	
	game := TerniLapilli new.
	"game putXAt: 0@0.
	game putOAt: 1@0.
	game putXAt: 0@1.
	game putOAt: 1@1.	
	game putXAt: 0@2."
	
	"self assert: game isOver."
	! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 20:23:53'!
testIfXHasThreeOnARowXWins
	|game|
	
	game := TerniLapilli new.
	"game putXAt: 0@0.
	game putOAt: 1@0.
	game putXAt: 0@1.
	game putOAt: 1@1.	
	game putXAt: 0@2.
	
	self assert: game hasPlayerXWon."
	! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 20:24:08'!
testXXXXCanNotMoveChipToAnInvalidPosition
	|game|
	
	game := TerniLapilli new.
"	game putXAt: 0@0.
	game putOAt: 0@1.
	
	game putXAt: 1@1.
	game putOAt: 0@2.

	game putXAt: 2@1.
	game putOAt: 1@0.
	
	game moveXAt: 2@1 to: 1@2."! !


!classDefinition: #TerniLapilli category: #TerniLapilli!
Object subclass: #TerniLapilli
	instanceVariableNames: 'player winner board playedChips'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'LR 6/11/2020 20:29:04'!
hasPlayerXWon
	^true.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 20:05:19'!
initialize
	player := #X.
	board := Array2D height: 3 width: 3.
	playedChips := 0.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'LR 6/11/2020 19:43:03'!
isEmpty
	^true! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'LR 6/11/2020 20:31:58'!
isOver
	^winner ~= nil! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'LR 6/11/2020 20:16:12'!
isPlayingO
	^player = #O! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'LR 6/11/2020 20:03:05'!
isPlayingX
	^player = #X! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 20:25:48'!
moveOAt: sourcePosition to: destinationPosition
	"(self isValidMove: sourcePosition to: destinationPosition) ifFalse: [self error: 'invalid move']."
	self isPlayingO ifFalse: [self error: 'its not your turn'].
	(board at: sourcePosition) = #O ifFalse: [self error: 'cant move other chip'].
	board at: sourcePosition put: nil.
	board at: destinationPosition put: #O.
	player := #X! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 20:25:34'!
moveXAt: sourcePosition to: destinationPosition
	"(self isValidMove: sourcePosition to: destinationPosition) ifFalse: [self error: 'invalid move']."
	self isPlayingX ifFalse: [self error: 'its not your turn'].
	(board at: sourcePosition) = #X ifFalse: [self error: 'cant move other chip'].
	board at: sourcePosition put: nil.
	board at: destinationPosition put: #X.
	player := #O.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 20:04:23'!
putOAt: aPoint 
	(player = #O) ifFalse: [self error: 'is not your turn'].
	(self validPoint: aPoint)  ifFalse: [self error: 'invalid position'].
	(playedChips  = 6) ifTrue: [self error: 'should move existing chips'].
	playedChips := playedChips +1 .
	board at: aPoint put: #O.
	player := #X! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 20:05:09'!
putXAt: aPoint 
	(player = #X) ifFalse: [self error: 'is not your turn'].
	(self validPoint: aPoint)  ifFalse: [self error: 'invalid position'].
	(playedChips  = 6) ifTrue: [self error: 'should move existing chips'].
	playedChips := playedChips+1.
	board at: aPoint put: #X.
	player := #O! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 19:59:04'!
validPoint: aPoint 
	^(board at: aPoint) = nil.! !
