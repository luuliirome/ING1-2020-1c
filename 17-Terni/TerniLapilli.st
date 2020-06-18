!classDefinition: #TerniLapilliTests category: #TerniLapilli!
TestCase subclass: #TerniLapilliTests
	instanceVariableNames: 'newGame'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliTests methodsFor: 'setUp/tearDown' stamp: 'LR 6/17/2020 20:34:36'!
setUp	
	newGame := TerniLapilli new.! !


!TerniLapilliTests methodsFor: 'testing - private' stamp: 'LR 6/17/2020 20:38:44'!
play: aGameToPlay
	aGameToPlay putXAt: 1@1.
	aGameToPlay putOAt: 3@1.
	aGameToPlay putXAt: 2@1.
	aGameToPlay putOAt: 3@2.
	aGameToPlay putXAt: 2@2.
	aGameToPlay putOAt: 1@2.
	^aGameToPlay! !

!TerniLapilliTests methodsFor: 'testing - private' stamp: 'LR 6/17/2020 21:51:13'!
winOByMoving: aGameForOToWin
"Elegimos retornar el game modificado para ser más declarativos en los test al asignarlo a una nueva variable"

	aGameForOToWin putXAt: 1@1.
	aGameForOToWin putOAt: 2@3.
	aGameForOToWin putXAt: 1@2.
	aGameForOToWin putOAt: 3@2.	
	aGameForOToWin putXAt: 3@3.
	aGameForOToWin putOAt: 3@1.
	
	aGameForOToWin moveXAt: 3@3 to: 2@2.
	aGameForOToWin moveOAt: 2@3 to: 3@3.
	
	^aGameForOToWin
	! !

!TerniLapilliTests methodsFor: 'testing - private' stamp: 'LR 6/17/2020 20:47:38'!
winOByPuttingThreeOnAColumn: aGameForOToWin
	aGameForOToWin putXAt: 1@1.
	aGameForOToWin putOAt: 2@1.
	aGameForOToWin putXAt: 1@2.
	aGameForOToWin putOAt: 2@2.	
	aGameForOToWin putXAt: 3@3.
	aGameForOToWin putOAt: 2@3.	
	
	^aGameForOToWin
	! !

!TerniLapilliTests methodsFor: 'testing - private' stamp: 'LR 6/17/2020 20:53:11'!
winOByPuttingThreeOnADiagonal: aGameForOToWin 
	
	aGameForOToWin putXAt: 3@1.
	aGameForOToWin putOAt: 1@1.
	aGameForOToWin putXAt: 2@3.
	aGameForOToWin putOAt: 2@2.	
	aGameForOToWin putXAt: 1@3.
	aGameForOToWin putOAt: 3@3.
	
	^aGameForOToWin
	! !

!TerniLapilliTests methodsFor: 'testing - private' stamp: 'LR 6/17/2020 20:49:24'!
winOByPuttingThreeOnARow: aGameForOToWin 
	
	aGameForOToWin putXAt: 1@2.
	aGameForOToWin putOAt: 3@3.
	aGameForOToWin putXAt: 2@1.
	aGameForOToWin putOAt: 2@3.	
	aGameForOToWin putXAt: 3@1.
	aGameForOToWin putOAt: 1@3.
	
	^aGameForOToWin
	! !

!TerniLapilliTests methodsFor: 'testing - private' stamp: 'LR 6/17/2020 21:04:23'!
winXByMoving: aGameForXToWin
	aGameForXToWin putXAt: 1@1.
	aGameForXToWin putOAt: 2@1.
	aGameForXToWin putXAt: 1@2.
	aGameForXToWin putOAt: 3@2.	
	aGameForXToWin putXAt: 3@3.
	aGameForXToWin putOAt: 1@3.
	
	aGameForXToWin moveXAt: 1@2 to: 2@2.
	
	^aGameForXToWin
	! !

!TerniLapilliTests methodsFor: 'testing - private' stamp: 'LR 6/17/2020 20:47:51'!
winXByPuttingThreeOnAColumn: aGameForXToWin
	aGameForXToWin putXAt: 1@1.
	aGameForXToWin putOAt: 2@1.
	aGameForXToWin putXAt: 1@2.
	aGameForXToWin putOAt: 2@2.	
	aGameForXToWin putXAt: 1@3.
	
	^aGameForXToWin
	! !

!TerniLapilliTests methodsFor: 'testing - private' stamp: 'LR 6/17/2020 20:51:42'!
winXByPuttingThreeOnADiagonal: aGameForXToWin 
	
	aGameForXToWin putXAt: 3@1.
	aGameForXToWin putOAt: 1@2.
	aGameForXToWin putXAt: 2@2.
	aGameForXToWin putOAt: 2@3.	
	aGameForXToWin putXAt: 1@3.
	
	^aGameForXToWin
	! !

!TerniLapilliTests methodsFor: 'testing - private' stamp: 'LR 6/17/2020 20:48:53'!
winXByPuttingThreeOnARow: aGameForXToWin 
	
	aGameForXToWin putXAt: 1@1.
	aGameForXToWin putOAt: 3@3.
	aGameForXToWin putXAt: 2@1.
	aGameForXToWin putOAt: 2@2.	
	aGameForXToWin putXAt: 3@1.
	
	^aGameForXToWin
	! !


!TerniLapilliTests methodsFor: 'testing' stamp: 'LR 6/17/2020 20:11:44'!
test01GameIsNotOverIfNeverStarted
	self deny: (newGame isOver)! !

!TerniLapilliTests methodsFor: 'testing' stamp: 'SA 6/18/2020 15:09:34'!
test02XShouldPlayFirstAtNewGame
	self assert: (newGame isPlayingX)! !

!TerniLapilliTests methodsFor: 'testing' stamp: 'SA 6/18/2020 15:16:37'!
test03OShouldNotPlayFirstAtNewGame
	self deny: (newGame isPlayingO)! !

!TerniLapilliTests methodsFor: 'testing' stamp: 'SA 6/18/2020 15:18:01'!
test04PutAChipInAnInvalidPositionShouldRaiseAnError
	
	self should: [newGame putXAt: 4@1]
	raise: Error
	withMessageText: TerniLapilli pointOutOfBoundErrorMsg.! !

!TerniLapilliTests methodsFor: 'testing' stamp: 'SA 6/18/2020 15:17:47'!
test05MoveAChipFromAnInvalidPositionShouldRaiseAnError
	|aStartedGame|

	aStartedGame := self play: newGame.
			
	[aStartedGame moveXAt: 0@1 to: 1@2.self fail.]
	on: Error
	do: [:anError | self assert: anError messageText = TerniLapilli pointOutOfBoundErrorMsg ]! !

!TerniLapilliTests methodsFor: 'testing' stamp: 'SA 6/18/2020 15:17:33'!
test06MoveAChipToAnInvalidPositionShouldRaiseAnError
	| aStartedGame |

	aStartedGame := self play: newGame.
			
	[aStartedGame moveXAt: 1@1 to: 8@2.self fail.]
	on: Error
	do: [:anError | self assert: anError messageText = TerniLapilli pointOutOfBoundErrorMsg ]! !

!TerniLapilliTests methodsFor: 'testing' stamp: 'SA 6/18/2020 15:17:14'!
test07MoveAChipWithAnInvalidMovementShouldRaiseAnError
	| aStartedGame |

	aStartedGame := self play: newGame.
			
	[aStartedGame moveXAt: 1@1 to: 1@3.self fail.]
	on: Error
	do: [:anError | self assert: anError messageText = TerniLapilli invalidMovementErrorMessageDescription ].! !

!TerniLapilliTests methodsFor: 'testing' stamp: 'SA 6/18/2020 15:19:13'!
test08WhenXFinishHisTurnShouldStartOTurn
	newGame putXAt: 1@1.
	self deny: (newGame isPlayingX).
	self assert: (newGame isPlayingO).! !

!TerniLapilliTests methodsFor: 'testing' stamp: 'SA 6/18/2020 15:19:41'!
test09WhenOFinishHisTurnShouldStartXTurn
	newGame putXAt: 2@1.
	newGame putOAt: 1@1.
	self assert: (newGame isPlayingX).
	self deny: (newGame isPlayingO).! !

!TerniLapilliTests methodsFor: 'testing' stamp: 'SA 6/18/2020 15:20:28'!
test10WhenPuttinAChipInATakenSpaceShouldRaiseAnError
	newGame putXAt: 1@1.
	[newGame putOAt: 1@1. self fail.]
	on: Error
	do: [:anError | self assert: anError messageText = CellState cellNotEmptyErrorMsg ]! !

!TerniLapilliTests methodsFor: 'testing' stamp: 'SA 6/18/2020 15:21:13'!
test11WhenOPlayInXTurnShouldRaiseAnError
	[newGame putOAt: 1@1. self fail.]
	on: Error 
	do: [ :anError | self assert: anError messageText = PlayerX notYourTurnErrorMessageDescription]
	! !

!TerniLapilliTests methodsFor: 'testing' stamp: 'SA 6/18/2020 15:21:37'!
test12WhenXPlayInOTurnShouldRaiseAnError
	newGame putXAt: 1@1.
	[newGame putXAt: 2@1. self fail.]
	on: Error 
	do: [ :anError | self assert: anError messageText = PlayerO notYourTurnErrorMessageDescription ]
	! !

!TerniLapilliTests methodsFor: 'testing' stamp: 'LR 6/17/2020 21:58:33'!
test13CantMoveAChipIfBoardIsNotFull
	newGame putXAt: 1@1.
	newGame putOAt: 2@1. 
	
	[newGame moveXAt: 1@1 to: 1@2. self fail.]
	on: Error
	do: [:anError | self assert: anError messageText = TerniLapilliState putAllChipsErrorMessageDescription ]! !

!TerniLapilliTests methodsFor: 'testing' stamp: 'LR 6/17/2020 21:58:42'!
test14AfterAll6ChipsInTheBoardOnlyCanMovePreviousChips
	| aStartedGame |
	aStartedGame := self play: newGame.
	
	[aStartedGame putXAt: 3@2. self fail.]
	on: Error
	do: [:anError | self assert: anError messageText = TerniLapilliState moveExistingChipsErrorMessageDescription ]! !

!TerniLapilliTests methodsFor: 'testing' stamp: 'LR 6/17/2020 20:37:54'!
test15CantMoveOChipIfIsXTurn
	| aStartedGame |
	
	aStartedGame := self play: newGame.
	[aStartedGame moveOAt: 2@1 to: 3@1. self fail.]
	on: Error
	do: [:anError | self assert: anError messageText = PlayerX notYourTurnErrorMessageDescription ]! !

!TerniLapilliTests methodsFor: 'testing' stamp: 'LR 6/17/2020 20:40:25'!
test16CantMoveXChipIfIsOTurn
	| aStartedGame |
	
	aStartedGame := self play: newGame.
	
	aStartedGame moveXAt: 2@2 to: 2@3.
	[aStartedGame moveXAt: 2@3 to: 3@3. self fail.]
	on: Error
	do: [:anError | self assert: anError messageText = PlayerO notYourTurnErrorMessageDescription ]! !

!TerniLapilliTests methodsFor: 'testing' stamp: 'LR 6/17/2020 20:41:09'!
test17CanNotMoveAChipToATakenPosition
	| aStartedGame |
	
	aStartedGame := self play: newGame.
	
	[aStartedGame moveXAt: 1@1 to: 1@2. self fail.]
	on: Error
	do: [:anError | self assert: anError messageText = CellState cellNotEmptyErrorMsg ]! !

!TerniLapilliTests methodsFor: 'testing' stamp: 'LR 6/17/2020 21:59:19'!
test18CantMoveOChipIfSourcePositionIsFilledByAnXChip
	| aStartedGame |
	
	aStartedGame := self play: newGame.
	aStartedGame moveXAt: 2@2 to: 2@3.
	[aStartedGame moveOAt: 2@3 to: 3@3. self fail.]
	on: Error
	do: [:anError | self assert: anError messageText = CellState cellNotTakenByOErrorMsg ]! !

!TerniLapilliTests methodsFor: 'testing' stamp: 'LR 6/17/2020 21:59:30'!
test19CantMoveXChipIfSourcePositionIsFilledByAnOChip
	|aStartedGame|
	
	aStartedGame := self play: newGame.
	
	[aStartedGame moveXAt: 3@2 to: 3@3. self fail.]
	on: Error
	do: [:anError | self assert: anError messageText = CellState cellNotTakenByXErrorMsg ]! !

!TerniLapilliTests methodsFor: 'testing' stamp: 'LR 6/17/2020 21:49:34'!
test20IfXHasThreeOnAColumnAfter3MovementsXWins	
	| aGameWonByX |
	
	aGameWonByX := self winXByPuttingThreeOnAColumn: newGame.
	
	self assert: aGameWonByX hasPlayerXWon.
	self deny: aGameWonByX hasPlayerOWon.	! !

!TerniLapilliTests methodsFor: 'testing' stamp: 'LR 6/17/2020 20:47:38'!
test21IfOHasThreeOnAColumnAfter3MovementsOWins
	| aGameWonByO |
	
	aGameWonByO := self winOByPuttingThreeOnAColumn: newGame.	
	
	self deny: aGameWonByO hasPlayerXWon.
	self assert: aGameWonByO hasPlayerOWon.	! !

!TerniLapilliTests methodsFor: 'testing' stamp: 'LR 6/17/2020 20:50:10'!
test22IfXHasThreeOnARowAfter3MovementsXWins
	| aGameWonByX |
	
	aGameWonByX := self winXByPuttingThreeOnARow: newGame.
	self assert: aGameWonByX hasPlayerXWon.
	self deny: aGameWonByX hasPlayerOWon.	! !

!TerniLapilliTests methodsFor: 'testing' stamp: 'LR 6/17/2020 20:51:15'!
test23IfOHasThreeOnARowAfter3MovementsOWins
	| aGameWonByO |
	
	aGameWonByO := self winOByPuttingThreeOnARow: newGame.	
	self assert: aGameWonByO hasPlayerOWon.
	self deny: aGameWonByO hasPlayerXWon.	! !

!TerniLapilliTests methodsFor: 'testing' stamp: 'LR 6/17/2020 20:52:22'!
test24IfXHasThreeOnADiagonalAfter3MovementsXWins

	| aGameWonByX |
	
	aGameWonByX := self winXByPuttingThreeOnADiagonal: newGame.
	self assert: aGameWonByX hasPlayerXWon.
	self deny: aGameWonByX hasPlayerOWon.		! !

!TerniLapilliTests methodsFor: 'testing' stamp: 'LR 6/17/2020 20:52:49'!
test25IfOHasThreeOnADiagonalAfter3MovementsOWins
	| aGameWonByO |
	
	aGameWonByO := self winOByPuttingThreeOnADiagonal: newGame.
	self assert: aGameWonByO hasPlayerOWon.
	self deny: aGameWonByO hasPlayerXWon.! !

!TerniLapilliTests methodsFor: 'testing' stamp: 'LR 6/17/2020 20:53:53'!
test26IfAPlayerHasThreeOnARowTheGameIsOver
	| aGameWonByO |
	aGameWonByO := self winOByPuttingThreeOnAColumn: newGame.
	self assert: aGameWonByO isOver.
	! !

!TerniLapilliTests methodsFor: 'testing' stamp: 'LR 6/17/2020 20:59:01'!
test27IfTheGameIsOverNobodyCanPutAnotherChip
	| aGameWonByX |
	aGameWonByX := self winXByPuttingThreeOnAColumn: newGame.	
	
	self should: [aGameWonByX putOAt: 3@3.]
	raise: Error
	withMessageText: TerniLapilliState gameOverErrorMessageDescription.
	! !

!TerniLapilliTests methodsFor: 'testing' stamp: 'LR 6/17/2020 20:55:22'!
test28IfXHasThreeOnARowInAnyPositionAfterMoreThan3MovementsXWins
	| aGameWonByX |
	aGameWonByX := self winXByMoving: newGame. 
	
	self assert: aGameWonByX hasPlayerXWon.
	self deny: aGameWonByX hasPlayerOWon.	! !

!TerniLapilliTests methodsFor: 'testing' stamp: 'LR 6/17/2020 20:56:04'!
test29IfOHasThreeOnARowInAnyPositionAfterMoreThan3MovementsOWins
	| aGameWonByO |
	aGameWonByO := self winOByMoving: newGame. 
		
	self deny: aGameWonByO hasPlayerXWon.
	self assert: aGameWonByO hasPlayerOWon.	! !

!TerniLapilliTests methodsFor: 'testing' stamp: 'LR 6/17/2020 21:02:07'!
test30IfTheGameIsOverXCanNotMoveAnotherChip
	| aGameWonByO |
	
	aGameWonByO := self winOByMoving: newGame.
	self should: [aGameWonByO moveXAt: 2@2 to: 2@3.]
	raise: Error
	withMessageText: TerniLapilliState gameOverErrorMessageDescription.! !

!TerniLapilliTests methodsFor: 'testing' stamp: 'LR 6/17/2020 21:05:06'!
test31IfTheGameIsOverOCanNotMoveAnotherChip
	| aGameWinByX |
	
	aGameWinByX := self winXByMoving: newGame.
	self should: [aGameWinByX moveOAt: 1@3 to: 1@2.]
	raise: Error
	withMessageText: TerniLapilliState gameOverErrorMessageDescription.! !


!classDefinition: #CellState category: #TerniLapilli!
Object subclass: #CellState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!CellState methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 19:40:54'!
put
	self subclassResponsibility ! !

!CellState methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 19:41:06'!
takenByO
	self subclassResponsibility ! !

!CellState methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 19:41:05'!
takenByX
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CellState class' category: #TerniLapilli!
CellState class
	instanceVariableNames: ''!

!CellState class methodsFor: 'errors' stamp: 'LR 6/17/2020 19:37:53'!
cellNotEmptyErrorMsg
	^'cell not empty'! !

!CellState class methodsFor: 'errors' stamp: 'LR 6/17/2020 19:38:19'!
cellNotTakenByOErrorMsg
	^'cell not taken by O'! !

!CellState class methodsFor: 'errors' stamp: 'LR 6/17/2020 19:38:37'!
cellNotTakenByXErrorMsg
	^'cell not taken by X'! !

!CellState class methodsFor: 'errors' stamp: 'LR 6/17/2020 19:38:48'!
cellNotTakenErrorMsg
	^'cell empty'! !


!CellState class methodsFor: 'state selection' stamp: 'LR 6/17/2020 19:37:09'!
canHandle: aCell
	self subclassResponsibility ! !

!CellState class methodsFor: 'state selection' stamp: 'LR 6/17/2020 19:12:35'!
stateFor: aCellContent

	^(self subclasses detect: [:aCellStateClass | aCellStateClass canHandle: aCellContent ]) new.! !


!classDefinition: #CellStateEmpty category: #TerniLapilli!
CellState subclass: #CellStateEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!CellStateEmpty methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 18:58:03'!
put
	! !

!CellStateEmpty methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 18:58:35'!
takenByO
	^self error: self class cellNotTakenErrorMsg! !

!CellStateEmpty methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 18:58:39'!
takenByX
	^self error: self class cellNotTakenErrorMsg! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CellStateEmpty class' category: #TerniLapilli!
CellStateEmpty class
	instanceVariableNames: ''!

!CellStateEmpty class methodsFor: 'state selection' stamp: 'LR 6/17/2020 19:13:19'!
canHandle: aCellContent
	^aCellContent = nil! !


!classDefinition: #CellStateTakenByO category: #TerniLapilli!
CellState subclass: #CellStateTakenByO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!CellStateTakenByO methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 19:00:21'!
put
	^self error: self class cellNotEmptyErrorMsg! !

!CellStateTakenByO methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 18:50:04'!
takenByO
	! !

!CellStateTakenByO methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 18:59:20'!
takenByX
	self error: self class cellNotTakenByXErrorMsg
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CellStateTakenByO class' category: #TerniLapilli!
CellStateTakenByO class
	instanceVariableNames: ''!

!CellStateTakenByO class methodsFor: 'state selection' stamp: 'LR 6/17/2020 19:13:33'!
canHandle: aCellContent
	^aCellContent = #O! !


!classDefinition: #CellStateTakenByX category: #TerniLapilli!
CellState subclass: #CellStateTakenByX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!CellStateTakenByX methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 19:00:10'!
put
	^self error: self class cellNotEmptyErrorMsg! !

!CellStateTakenByX methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 18:59:42'!
takenByO
	^self error: self class cellNotTakenByOErrorMsg! !

!CellStateTakenByX methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 18:59:49'!
takenByX! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CellStateTakenByX class' category: #TerniLapilli!
CellStateTakenByX class
	instanceVariableNames: ''!

!CellStateTakenByX class methodsFor: 'state selection' stamp: 'LR 6/17/2020 19:13:47'!
canHandle: aCellContent
	^aCellContent = #X! !


!classDefinition: #Player category: #TerniLapilli!
Object subclass: #Player
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!Player methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 18:09:23'!
isPlayingO
	self subclassResponsibility ! !

!Player methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 18:09:22'!
isPlayingX
	self subclassResponsibility ! !

!Player methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 18:09:27'!
playO
	self subclassResponsibility ! !

!Player methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 18:09:25'!
playX
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Player class' category: #TerniLapilli!
Player class
	instanceVariableNames: ''!

!Player class methodsFor: 'errors' stamp: 'LR 6/17/2020 18:07:53'!
notYourTurnErrorMessageDescription
	^'its not your turn'! !


!classDefinition: #PlayerO category: #TerniLapilli!
Player subclass: #PlayerO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!PlayerO methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 18:04:43'!
isPlayingO
	^true! !

!PlayerO methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 18:04:48'!
isPlayingX
	^false! !

!PlayerO methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 18:08:14'!
playO! !

!PlayerO methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 18:09:00'!
playX
	^self error: self class notYourTurnErrorMessageDescription! !


!classDefinition: #PlayerX category: #TerniLapilli!
Player subclass: #PlayerX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!PlayerX methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 18:08:23'!
isPlayingO
	^false! !

!PlayerX methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 18:08:27'!
isPlayingX
	^true! !

!PlayerX methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 18:09:05'!
playO
	^self error: self class notYourTurnErrorMessageDescription
	! !

!PlayerX methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 18:08:34'!
playX! !


!classDefinition: #TerniLapilli category: #TerniLapilli!
Object subclass: #TerniLapilli
	instanceVariableNames: 'player winner board playedChips validMoves players playerIndex'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilli methodsFor: 'private' stamp: 'LR 6/17/2020 21:32:34'!
allColumns
	^OrderedCollection with: {1@1. 1@2. 1@3} with: {2@1. 2@2. 2@3} with: {3@1. 3@2. 3@3}.! !

!TerniLapilli methodsFor: 'private' stamp: 'LR 6/17/2020 21:32:20'!
allDiagonals	
	^OrderedCollection with: {1@1. 2@2. 3@3} with:{3@1. 2@2. 1@3}.! !

!TerniLapilli methodsFor: 'private' stamp: 'LR 6/17/2020 21:33:28'!
allEquals: aThreeElementsList
	
	| firstElement secondElement thirdElement |
	
	firstElement := board at: aThreeElementsList first.
	secondElement := board at: aThreeElementsList second.	
	thirdElement := board at: aThreeElementsList third.
	
	^(( firstElement = secondElement) and: (thirdElement = firstElement))
	and: (firstElement ~= nil)! !

!TerniLapilli methodsFor: 'private' stamp: 'LR 6/17/2020 21:32:05'!
allRows
	^OrderedCollection with: {1@1. 2@1. 3@1} with: {1@2. 2@2. 3@2} with: {1@3. 2@3. 3@3}.! !

!TerniLapilli methodsFor: 'private' stamp: 'LR 6/17/2020 19:12:27'!
cell: aCellContent
	^CellState stateFor: aCellContent
	! !

!TerniLapilli methodsFor: 'private' stamp: 'LR 6/16/2020 23:16:05'!
finishTurn
	self checkThreeOnARow.
	self nextPlayer.! !

!TerniLapilli methodsFor: 'private' stamp: 'LR 6/17/2020 21:56:05'!
move: aChip at: sourcePosition to: destinationPosition
	self checkValidPosition: destinationPosition.
	self checkCellEmpty: destinationPosition.
	self checkMoveFrom: sourcePosition to: destinationPosition.
	
	board at: destinationPosition put: aChip.
	board at: sourcePosition put: nil.
	
	self finishTurn.! !

!TerniLapilli methodsFor: 'private' stamp: 'LR 6/16/2020 23:22:32'!
nextPlayer
	playerIndex := ((playerIndex + 1) \\ 2).! !

!TerniLapilli methodsFor: 'private' stamp: 'LR 6/17/2020 19:49:23'!
put: aChip at: aPoint 
	self checkValidPosition: aPoint.
	self checkCellEmpty: aPoint.
	playedChips := playedChips+1.
	board at: aPoint put: aChip.
	self finishTurn.! !

!TerniLapilli methodsFor: 'private' stamp: 'LR 6/17/2020 17:35:16'!
state
	^TerniLapilliState stateFor: self
	! !


!TerniLapilli methodsFor: 'initialization' stamp: 'LR 6/17/2020 18:10:40'!
initialize
	players := Dictionary new.
	players at: 0 put: PlayerX new.
	players at: 1 put: PlayerO new.
	playerIndex := 0.
	
	board := Array2D height: 3 width: 3.
	playedChips := 0.
	
	validMoves := Dictionary new.
	validMoves at: 1@1 put: (Set withAll: {2@1. 2@2. 1@2.}).
	validMoves at: 2@1 put: (Set withAll: {1@1. 2@2. 3@1.}).
	validMoves at: 3@1 put: (Set withAll: {2@1. 3@2. 2@2.}).
	
	validMoves at: 1@2 put: (Set withAll: {1@1. 2@2. 1@3.}).
	validMoves at: 2@2 put: (Set withAll: {1@1. 1@2. 1@3. 2@1. 2@3. 3@1. 3@2. 3@3.}).
	validMoves at: 3@2 put: (Set withAll: {3@1. 3@3. 2@2.}).
	
	validMoves at: 1@3 put: (Set withAll: {1@2. 2@2. 2@3.}).
	validMoves at: 2@3 put: (Set withAll: {1@3. 2@2. 3@3.}).
	validMoves at: 3@3 put: (Set withAll: {2@3. 2@2. 3@2.}).! !


!TerniLapilli methodsFor: 'moving' stamp: 'LR 6/17/2020 20:08:59'!
moveOAt: sourcePosition to: destinationPosition
	self checkPlayerOTurn.
	self checkValidPosition: sourcePosition.
	self checkSourceO: sourcePosition.
	self state move: #O at: sourcePosition to: destinationPosition.! !

!TerniLapilli methodsFor: 'moving' stamp: 'LR 6/17/2020 20:08:47'!
moveXAt: sourcePosition to: destinationPosition
	self checkPlayerXTurn.
	self checkValidPosition: sourcePosition.
	self checkSourceX: sourcePosition.
	self state move: #X at: sourcePosition to: destinationPosition.! !

!TerniLapilli methodsFor: 'moving' stamp: 'LR 6/17/2020 19:31:27'!
putOAt: aPoint 
	self checkPlayerOTurn.
	self state put: #O at: aPoint.! !

!TerniLapilli methodsFor: 'moving' stamp: 'LR 6/17/2020 19:31:20'!
putXAt: aPoint 
	self checkPlayerXTurn.
	self state put: #X at: aPoint.! !


!TerniLapilli methodsFor: 'validations - private' stamp: 'LR 6/17/2020 21:47:31'!
checkAnyEquals: aListOfCombinations
	| winnerPosition winnerPositionsCombination |
	
	winnerPositionsCombination := aListOfCombinations detect: [:threeElementsList | self allEquals: threeElementsList ] ifNone: [^self].
	
	winnerPosition := winnerPositionsCombination first.
	winner := board at: winnerPosition.! !

!TerniLapilli methodsFor: 'validations - private' stamp: 'LR 6/17/2020 19:32:05'!
checkCellEmpty: destinationPosition
	(self cell: (board at: destinationPosition)) put.! !

!TerniLapilli methodsFor: 'validations - private' stamp: 'LR 6/17/2020 21:52:52'!
checkMoveFrom: sourcePoint to: destinationPoint 
	((validMoves at: sourcePoint) includes: destinationPoint) 
	ifFalse: [self error: self class invalidMovementErrorMessageDescription]! !

!TerniLapilli methodsFor: 'validations - private' stamp: 'LR 6/17/2020 19:22:55'!
checkPlayerOTurn
	self player playO.! !

!TerniLapilli methodsFor: 'validations - private' stamp: 'LR 6/17/2020 19:22:50'!
checkPlayerXTurn
	self player playX.! !

!TerniLapilli methodsFor: 'validations - private' stamp: 'LR 6/17/2020 19:29:18'!
checkSourceO: sourcePosition
	(self cell: (board at: sourcePosition)) takenByO.! !

!TerniLapilli methodsFor: 'validations - private' stamp: 'LR 6/17/2020 19:29:13'!
checkSourceX: sourcePosition
	(self cell: (board at: sourcePosition)) takenByX.! !

!TerniLapilli methodsFor: 'validations - private' stamp: 'LR 6/17/2020 21:39:34'!
checkThreeOnARow
	| allColumns allDiagonals allRows allCombinations |
	
	allRows := self allRows.
	allColumns := self allColumns.
	allDiagonals := self allDiagonals.
	
	allCombinations := OrderedCollection newFrom: allRows.
	allCombinations addAll: allColumns.
	allCombinations addAll: allDiagonals.
	
	self checkAnyEquals: allCombinations.! !

!TerniLapilli methodsFor: 'validations - private' stamp: 'LR 6/17/2020 19:51:23'!
checkValidPosition: aPoint 
	(aPoint x < 1 or: aPoint y < 1 or: aPoint x > 3 or: aPoint y > 3) ifTrue: [self error: self class pointOutOfBoundErrorMsg]! !


!TerniLapilli methodsFor: 'state' stamp: 'LR 6/16/2020 22:06:33'!
hasPlayerOWon
	^winner = #O.! !

!TerniLapilli methodsFor: 'state' stamp: 'LR 6/16/2020 22:06:25'!
hasPlayerXWon
	^winner = #X.! !

!TerniLapilli methodsFor: 'state' stamp: 'LR 6/17/2020 17:35:00'!
isOver
	^self state isOver.! !

!TerniLapilli methodsFor: 'state' stamp: 'LR 6/17/2020 18:14:05'!
isPlayingO
	^self player isPlayingO! !

!TerniLapilli methodsFor: 'state' stamp: 'LR 6/17/2020 18:14:10'!
isPlayingX
	^self player isPlayingX! !

!TerniLapilli methodsFor: 'state' stamp: 'LR 6/17/2020 18:12:50'!
playedChips
	^playedChips! !

!TerniLapilli methodsFor: 'state' stamp: 'LR 6/17/2020 17:52:06'!
player
	^players at: playerIndex.! !

!TerniLapilli methodsFor: 'state' stamp: 'LR 6/17/2020 17:43:04'!
winner
	^winner! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilli class' category: #TerniLapilli!
TerniLapilli class
	instanceVariableNames: ''!

!TerniLapilli class methodsFor: 'errors' stamp: 'LR 6/16/2020 21:34:19'!
invalidMovementErrorMessageDescription
	^'invalid movement'! !

!TerniLapilli class methodsFor: 'errors' stamp: 'LR 6/17/2020 19:52:04'!
pointOutOfBoundErrorMsg
	^'invalid position - out of bounds'! !


!classDefinition: #TerniLapilliState category: #TerniLapilli!
Object subclass: #TerniLapilliState
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliState methodsFor: 'initialization' stamp: 'LR 6/17/2020 17:39:59'!
initializeFor: aTerniLapilli

	game _ aTerniLapilli! !


!TerniLapilliState methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 17:37:40'!
isOver
	self subclassResponsibility ! !

!TerniLapilliState methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 18:13:30'!
move: aChip at: aSourcePosition to: aDestinationPosition
	self subclassResponsibility ! !

!TerniLapilliState methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 18:13:43'!
put: aChip at: aPosition
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliState class' category: #TerniLapilli!
TerniLapilliState class
	instanceVariableNames: ''!

!TerniLapilliState class methodsFor: 'instance creation' stamp: 'LR 6/17/2020 17:39:14'!
for: aTerniLapilli

	^self new initializeFor: aTerniLapilli! !


!TerniLapilliState class methodsFor: 'state selection' stamp: 'LR 6/17/2020 17:39:32'!
canHandle: aTeriLapilli

	self subclassResponsibility ! !

!TerniLapilliState class methodsFor: 'state selection' stamp: 'LR 6/17/2020 17:38:53'!
stateFor: aTerniLapilli

	^(self subclasses detect: [:aTerniLapilliStateClass | aTerniLapilliStateClass canHandle: aTerniLapilli ]) for: aTerniLapilli! !


!TerniLapilliState class methodsFor: 'errors' stamp: 'LR 6/17/2020 17:28:58'!
gameOverErrorMessageDescription
	^'game is over'! !

!TerniLapilliState class methodsFor: 'errors' stamp: 'LR 6/17/2020 17:59:23'!
moveExistingChipsErrorMessageDescription
	^'should move existing chips'! !

!TerniLapilliState class methodsFor: 'errors' stamp: 'LR 6/17/2020 18:01:16'!
putAllChipsErrorMessageDescription
	^'should put all your chips in the board'! !


!classDefinition: #TerniLapilliStateAllChipsSet category: #TerniLapilli!
TerniLapilliState subclass: #TerniLapilliStateAllChipsSet
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliStateAllChipsSet methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 17:35:41'!
isOver
	^false! !

!TerniLapilliStateAllChipsSet methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 17:57:40'!
move: aChip at: sourcePosition to: destinationPosition
	^game move: aChip at: sourcePosition to: destinationPosition.! !

!TerniLapilliStateAllChipsSet methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 17:59:42'!
put: aChip at: aPosition
	^self error: self class moveExistingChipsErrorMessageDescription.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliStateAllChipsSet class' category: #TerniLapilli!
TerniLapilliStateAllChipsSet class
	instanceVariableNames: ''!

!TerniLapilliStateAllChipsSet class methodsFor: 'state selection' stamp: 'LR 6/18/2020 13:18:23'!
canHandle: aTerniLapilli
	^aTerniLapilli winner = nil and: aTerniLapilli playedChips = 6.! !


!classDefinition: #TerniLapilliStateNotAllChipsSet category: #TerniLapilli!
TerniLapilliState subclass: #TerniLapilliStateNotAllChipsSet
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliStateNotAllChipsSet methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 17:35:45'!
isOver
	^false! !

!TerniLapilliStateNotAllChipsSet methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 18:01:33'!
move: aChip at: sourcePosition to: destinationPosition
	^self error: self class putAllChipsErrorMessageDescription.! !

!TerniLapilliStateNotAllChipsSet methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 18:01:52'!
put: aChip at: aPosition
	^game put: aChip at: aPosition.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliStateNotAllChipsSet class' category: #TerniLapilli!
TerniLapilliStateNotAllChipsSet class
	instanceVariableNames: ''!

!TerniLapilliStateNotAllChipsSet class methodsFor: 'state selection' stamp: 'LR 6/18/2020 13:18:41'!
canHandle: aTerniLapilli
	^aTerniLapilli winner = nil and: aTerniLapilli playedChips < 6.! !


!classDefinition: #TerniLapilliStateOver category: #TerniLapilli!
TerniLapilliState subclass: #TerniLapilliStateOver
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliStateOver methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 17:35:36'!
isOver
	^true! !

!TerniLapilliStateOver methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 18:02:18'!
move: aChip at: sourcePosition to: destinationPosition
	^self error: self class gameOverErrorMessageDescription! !

!TerniLapilliStateOver methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 18:02:27'!
put: aChip at: aPosition
	^self error: self class gameOverErrorMessageDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliStateOver class' category: #TerniLapilli!
TerniLapilliStateOver class
	instanceVariableNames: ''!

!TerniLapilliStateOver class methodsFor: 'state selection' stamp: 'LR 6/17/2020 17:40:49'!
canHandle: aTerniLapilli
	^aTerniLapilli winner ~= nil! !
