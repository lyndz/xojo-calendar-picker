#tag Window
Begin ContainerControl CalendarContainer
   AllowAutoDeactivate=   True
   AllowFocus      =   False
   AllowFocusRing  =   False
   AllowTabs       =   True
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   DoubleBuffer    =   False
   Enabled         =   True
   EraseBackground =   True
   HasBackgroundColor=   True
   Height          =   440
   InitialParent   =   ""
   Left            =   0
   LockBottom      =   False
   LockLeft        =   True
   LockRight       =   False
   LockTop         =   True
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Tooltip         =   ""
   Top             =   0
   Transparent     =   True
   Visible         =   True
   Width           =   300
   Begin Listbox Calendar
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   False
      AllowResizableColumns=   False
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   7
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      GridLinesHorizontalStyle=   "1"
      GridLinesVerticalStyle=   "1"
      HasBorder       =   False
      HasHeader       =   False
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   False
      HeadingIndex    =   -1
      Height          =   300
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   "0"
      Scope           =   2
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   False
      Tooltip         =   ""
      Top             =   76
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   300
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Listbox CalendarHeader
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   False
      AllowResizableColumns=   False
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   7
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      GridLinesHorizontalStyle=   "1"
      GridLinesVerticalStyle=   "1"
      HasBorder       =   False
      HasHeader       =   False
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   False
      HeadingIndex    =   -1
      Height          =   36
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   "0"
      Scope           =   2
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   False
      Tooltip         =   ""
      Top             =   38
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   300
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Listbox MonthHeader
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   False
      AllowResizableColumns=   False
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   4
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      GridLinesHorizontalStyle=   "1"
      GridLinesVerticalStyle=   "1"
      HasBorder       =   False
      HasHeader       =   False
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   False
      HeadingIndex    =   -1
      Height          =   36
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   "0"
      Scope           =   2
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   False
      Tooltip         =   ""
      Top             =   0
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   300
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  'SetDimensions
		  CalendarView = Views.MonthAndDay
		  RefreshCalendar
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  Calendar.Visible = True
		  CalendarHeader.Visible = True
		  MonthHeader.Visible = True
		  
		  SetDimensions
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  Calendar.Visible = False
		  CalendarHeader.Visible = False
		  MonthHeader.Visible = False
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor()
		  Dim srcDate As DateTime = DateTime.Now
		  dim d as New DateTime(srcDate.Year, srcDate.Month, 1)
		  SetDate(d)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(d as DateTime)
		  SetDate(d)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function DaysNextMonth(from_d as DateTime, until_d as DateTime) As Integer
		  // This method was modified to cater Month to Month counting
		  
		  // This method returns the remaining days 
		  // before going to the Next Month
		  If from_d.Month = until_d.Month And from_d.Year = until_d.Year Then
		    // Return if they're both the same month and year
		    Return 0
		  End If
		  
		  dim daysCount as Integer = 0
		  dim currentMonth as Integer = from_d.Month
		  dim daysInterval as New DateInterval
		  daysInterval.Days = 1
		  
		  While currentMonth = from_d.Month
		    daysCount = daysCount + 1
		    from_d = from_d + daysInterval
		  Wend
		  
		  Return daysCount
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function DaysNextMonth(from_d as DateTime, until_d as DateTime, before as Boolean) As Integer
		  // This method returns the remaining days 
		  // before going to the Next Month
		  
		  If from_d.Month = until_d.Month And from_d.Year = until_d.Year Then
		    // Return if they're both the same month and year
		    Return 0
		  End If
		  
		  dim daysCount as Integer = 0
		  dim interval as DateInterval = until_d - from_d
		  dim currentMonth as Integer = from_d.Month
		  dim daysToAdd as Integer = interval.Days
		  dim daysInterval as New DateInterval
		  daysInterval.Days = 1
		  
		  While currentMonth = from_d.Month
		    If daysToAdd = 0 then 
		      Exit
		    End If
		    daysCount = daysCount + 1
		    from_d = from_d + daysInterval
		    daysToAdd = daysToAdd - 1
		  Wend
		  If before Then
		    Return daysCount
		  Else
		    Return daysToAdd
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub drawFillRect(g as Graphics, hovered as Boolean, isSimpleRect as Boolean)
		  Dim rectSize As Double = Min(g.Width * .8, g.Height * .8)
		  Dim rectColorInner As Color = &cECFAFB
		  Dim rectColorOuter As Color = &c3DD9D6
		  If hovered Then
		    rectColorInner = &cECFAFd
		    rectColorOuter = &cADD9D8
		  End If
		  
		  Dim x, y as Double
		  x = g.width/2 - rectSize/2
		  y = g.Height/2 - rectSize/2
		  
		  g.DrawingColor = rectColorOuter
		  g.FillRoundRectangle(x,y,rectSize,rectSize,10,10)
		  
		  rectSize = Min(g.Width * .7, g.Height * .7)
		  x = g.width/2 - rectSize/2
		  y = g.Height/2 - rectSize/2
		  g.DrawingColor = rectColorInner
		  g.FillRoundRectangle(x,y,rectSize,rectSize,10,10)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub drawOvalBg(g as Graphics, hovered as Boolean)
		  'Var bgArc As New ArcShape
		  'bgArc.Width = g.Width * .7
		  'bgArc.Height = g.Height * .7
		  'bgArc.FillOpacity = 80
		  'bgArc.FillColor = &c047DFF
		  'If hovered Then
		  'bgArc.FillColor = &cC9C9C9
		  'End If
		  'bgArc.StartAngle = 0 * (kPi / 180)
		  'bgArc.ArcAngle = 360 * (kPi / 180)
		  'If bgArc.Width <= 40 Or bgArc.Height <= 40 Then
		  'bgArc.Segments = 30
		  'End If
		  'g.DrawObject(bgArc, g.Width / 2, g.Height / 2)
		  '
		  'bgArc.FillOpacity = 90
		  'bgArc.StartAngle = 90 * (kPi / 180)
		  'bgArc.ArcAngle = 180 * (kPi / 180)
		  'g.DrawObject(bgArc, g.Width / 2, g.Height / 2)
		  '
		  'bgArc.StartAngle = 270 * (kPi / 180)
		  'bgArc.ArcAngle = 180 * (kPi / 180)
		  'bgArc.FillOpacity = 50
		  'bgArc.StartAngle = 90 * (kPi / 180)
		  'bgArc.ArcAngle = 180 * (kPi / 180)
		  'g.DrawObject(bgArc, g.Width / 2, g.Height / 2)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub drawOvalBg(g as Graphics, hovered as Boolean, isSimpleOval as Boolean)
		  Dim ovalSize As Double = Min(g.Width * .8, g.Height * .8)
		  Dim ovalColorInner As Color = accentColor'&cECFAFB
		  'Dim ovalColorOuter As Color = &c3DD9D6
		  If hovered Then
		    ovalColorInner = fillerColor3'&cECFAFd
		    'ovalColorOuter = &cADD9D8
		  End If
		  
		  Dim x, y as Double
		  'x = g.width/2 - ovalSize/2
		  'y = g.Height/2 - ovalSize/2
		  
		  'g.DrawingColor = ovalColorOuter
		  'g.FillOval(x,y,ovalSize,ovalSize)
		  
		  ovalSize = Min(g.Width * .7, g.Height * .7)
		  x = g.width/2 - ovalSize/2
		  y = g.Height/2 - ovalSize/2
		  g.DrawingColor = ovalColorInner
		  g.FillOval(x,y,ovalSize,ovalSize)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDayString(d as DateTime) As String
		  If d = Nil then Return ""
		  
		  Var s as String
		  Select case d.DayOfWeek
		  Case 1
		    s = "Sunday"
		  Case 2
		    s = "Monday"
		  Case 3
		    s = "Tuesday"
		  Case 4
		    s = "Wednesday"
		  Case 5
		    s = "Thursday"
		  Case 6
		    s = "Friday"
		  Case 7
		    s = "Saturday"
		  End Select
		  
		  Return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDayString(day as Integer) As String
		  Var s as String
		  Select case day
		  Case 1
		    s = "Sunday"
		  Case 2
		    s = "Monday"
		  Case 3
		    s = "Tuesday"
		  Case 4
		    s = "Wednesday"
		  Case 5
		    s = "Thursday"
		  Case 6
		    s = "Friday"
		  Case 7
		    s = "Saturday"
		  End Select
		  
		  Return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetMonthYearString(d as DateTime, onlyMonth as Boolean) As String
		  If d = Nil then Return ""
		  
		  Var s as String
		  Select case d.Month
		  Case 1
		    s = "January"
		  Case 2
		    s = "February"
		  Case 3
		    s = "March"
		  Case 4
		    s = "April"
		  Case 5
		    s = "May"
		  Case 6
		    s = "June"
		  Case 7
		    s = "July"
		  Case 8
		    s = "August"
		  Case 9
		    s = "September"
		  Case 10
		    s = "October"
		  Case 11
		    s = "November"
		  Case 12
		    s = "December"
		  End Select
		  If Not onlyMonth Then
		    s = s + " " + d.Year.ToString
		  End If
		  Return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetSelectedDate() As DateTime
		  If CalendarView = views.MonthAndDay And activeColumn <> -1 And activeRow <> -1 Then
		    If Calendar.CellTagAt(activeRow,activeColumn) = Nil Then Return Nil
		    
		    Dim d As DateTime = Calendar.CellTagAt(activeRow,activeColumn)
		    
		    Return d
		  End If
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function Gradient(startColor As Color, endColor As Color, iterations As Integer) As Color()
		  Var sAmt, eAmt As Double
		  
		  Dim newColors() As Color
		  
		  For i As Integer = 0 To iterations
		    sAmt = 1 - (i / iterations)
		    eAmt = i / iterations
		    
		    Dim r As Integer = (startColor.Red * sAmt) + (endColor.Red * eAmt)
		    Dim g As Integer = (startColor.Green * sAmt) + (endColor.Green * eAmt)
		    Dim b As Integer = (startColor.Blue * sAmt) + (endColor.Blue * eAmt)
		    
		    Dim newColor As Color = Color.RGB(r, g, b)
		    newColors.AddRow(newColor)
		  Next
		  
		  Return newColors
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function GradientHSV(startColor As Color, endColor As Color, iterations As Integer) As Color()
		  Var sAmt, eAmt As Double
		  
		  Dim newColors() As Color
		  
		  For i As Integer = 0 To iterations
		    sAmt = 1 - (i / iterations)
		    eAmt = i / iterations
		    
		    Dim newColor As Color
		    
		    newColor = Color.HSV((startColor.Hue * sAmt) + (endColor.Hue * eAmt), _
		    (startColor.Saturation *sAmt) + (endColor.Saturation * eAmt), _
		    (startColor.Value * sAmt) + (endColor.Value * eAmt))
		    'newColor = Color.RGB((startColor.Red * sAmt) + (endColor.Red * eAmt), _
		    '(startColor.Green *sAmt) + (endColor.Green * eAmt), _
		    '(startColor.Blue * sAmt) + (endColor.Blue * eAmt))
		    
		    newColors.AddRow(newColor)
		  Next
		  
		  Return newColors
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub initDayHeader()
		  CalendarHeader.RemoveAllRows
		  CalendarHeader.AddRow
		  // Add the names of the day to the Header
		  For c as Integer = 0 to CalendarHeader.LastColumnIndex
		    CalendarHeader.ColumnTagAt(c) = GetDayString(c+1).Left(3)
		  Next
		  
		  CalendarHeader.Invalidate(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub initMonthHeader(onlyShowYear as Boolean)
		  MonthHeader.RemoveAllRows
		  MonthHeader.AddRow
		  // Add the names of the day to the Header
		  If onlyShowYear Then
		    For c as Integer = 0 to MonthHeader.LastColumnIndex
		      Select Case c
		      Case 0
		        MonthHeader.ColumnTagAt(c) = "<"
		      Case 1
		        MonthHeader.ColumnTagAt(c) = str(CalendarDate.Year)
		      Case 2
		        MonthHeader.ColumnTagAt(c) = ">"
		      End Select
		    Next
		  Else
		    For c as Integer = 0 to MonthHeader.LastColumnIndex
		      Select Case c
		      Case 0
		        MonthHeader.ColumnTagAt(c) = "<"
		      Case 1
		        MonthHeader.ColumnTagAt(c) = GetMonthYearString(CalendarDate, True)
		      Case 2
		        MonthHeader.ColumnTagAt(c) = str(CalendarDate.Year)
		      Case 3
		        MonthHeader.ColumnTagAt(c) = ">"
		      End Select
		    Next
		  End If
		  
		  
		  MonthHeader.Invalidate(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function isPresentDate(d as DateTime) As Boolean
		  dim present as DateTime = DateTime.Now
		  
		  If d.Year = present.Year And d.Month = present.Month And d.Day = present.Day Then
		    Return True
		  End If
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function isPresentDate(d as DateTime, monthOnly as Boolean) As Boolean
		  dim present as DateTime = DateTime.Now
		  If d.Year = present.Year And d.Month = present.Month And monthOnly Then
		    Return True
		  Elseif d.Year = present.Year and Not monthOnly Then
		    Return True
		  End If
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RefreshCalendar()
		  Calendar.RemoveAllRows
		  Calendar.ColumnCount = 7
		  For i as Integer = 1 to 6
		    Calendar.AddRow
		  Next
		  
		  // Get the last [n] days in the previous month
		  Dim dayInterval as New DateInterval
		  dayInterval.Days = 1
		  Dim previousMonth as DateTime = CalendarDate - monthInterval
		  Dim nDays as Integer = DaysNextMonth(previousMonth, CalendarDate)
		  Dim lastDayOfPrevMonth as New DateTime(previousMonth.Year, previousMonth.Month, nDays)
		  Dim startingDay as Integer = lastDayOfPrevMonth.DayOfWeek - 1
		  
		  // Add last [n] days of the previous month
		  For c as Integer = startingDay DownTo 0
		    'Calendar.CellValueAt(0,c) = str(lastDayOfPrevMonth.Day)
		    Calendar.CellTagAt(0,c) = lastDayOfPrevMonth
		    lastDayOfPrevMonth = lastDayOfPrevMonth - dayInterval
		  Next
		  
		  // Add the days for this month
		  Dim startingDate as DateTime = CalendarDate
		  Dim column as Integer = CalendarDate.DayOfWeek - 1
		  For row as Integer = 0 to Calendar.LastRowIndex
		    
		    For c as Integer = column To Calendar.LastColumnIndex
		      'Calendar.CellValueAt(row,c) = str(startingDate.Day)
		      If isPresentDate(startingDate) Then
		        activeColumn = c
		        activeRow = row
		      End If
		      Calendar.CellTagAt(row,c) = startingDate
		      startingDate = startingDate + dayInterval
		    Next 
		    column = 0
		  Next
		  
		  Calendar.Invalidate(False)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RefreshCalendarMonths()
		  Calendar.RemoveAllRows
		  CalendarHeader.RemoveAllRows
		  For i as Integer = 1 to 4
		    Calendar.AddRow
		  Next
		  
		  // Add the months 
		  Dim startingDate as DateTime = New DateTime(CalendarDate.Year, 1, CalendarDate.Day)
		  dim column as Integer = 0
		  For row as Integer = 0 to Calendar.LastRowIndex
		    For c as Integer = column To Calendar.LastColumnIndex
		      'Calendar.CellValueAt(row,c) = str(startingDate.Day)
		      Calendar.CellTagAt(row,c) = startingDate
		      startingDate = startingDate + monthInterval
		    Next 
		    column = 0
		  Next
		  
		  Calendar.Invalidate(False)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RefreshCalendarYears()
		  Calendar.RemoveAllRows
		  CalendarHeader.RemoveAllRows
		  For i as Integer = 1 to 4
		    Calendar.AddRow
		  Next
		  
		  // Add the months 
		  Dim startingDate as DateTime = New DateTime(CalendarDate.Year, CalendarDate.Month, CalendarDate.Day)
		  dim column as Integer = 0
		  For row as Integer = 0 to Calendar.LastRowIndex
		    For c as Integer = column To Calendar.LastColumnIndex
		      'Calendar.CellValueAt(row,c) = str(startingDate.Day)
		      Calendar.CellTagAt(row,c) = startingDate
		      startingDate = startingDate + yearInterval
		    Next 
		    column = 0
		  Next
		  
		  Calendar.Invalidate(False)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetDate(d as DateTime)
		  CalendarDate = d
		  monthInterval = New DateInterval
		  monthInterval.Months = 1
		  yearInterval = New DateInterval
		  yearInterval.Years = 1
		  
		  CalendarView = Views.MonthAndDay
		  
		  ColorDays = Gradient(&cFFFFFF, &c047DFF, 6)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetDimensions()
		  Select Case CalendarView
		  Case Views.MonthAndDay
		    Calendar.ColumnCount = 7
		    Calendar.ColumnWidths = "*,14%,14%,14%,14%,14%,*"
		    Calendar.DefaultRowHeight = Calendar.Height / 6
		    CalendarHeader.Height = Calendar.DefaultRowHeight / 2
		    CalendarHeader.DefaultRowHeight = Calendar.DefaultRowHeight /2
		    MonthHeader.Height = Calendar.DefaultRowHeight * .75
		    MonthHeader.DefaultRowHeight = Calendar.DefaultRowHeight * .75
		    MonthHeader.ColumnWidths = "10%,40%,40%,10%"
		    MonthHeader.ColumnCount = 4
		  Case Views.Months
		    Calendar.ColumnCount = 4
		    Calendar.ColumnWidths = "25%,25%,25%,25%"
		    Calendar.DefaultRowHeight = Calendar.Height / 4
		    MonthHeader.ColumnCount = 4
		    MonthHeader.ColumnWidths = "10%,40%,40%,10%"
		  Case Views.Years
		    Calendar.ColumnCount = 4
		    Calendar.ColumnWidths = "25%,25%,25%,25%"
		    Calendar.DefaultRowHeight = Calendar.Height / 4
		    MonthHeader.ColumnCount = 3
		    MonthHeader.ColumnWidths = "10%,80%,10%"
		  End Select
		  
		  'Self.Width = Calendar.Width 'Calendar.DefaultRowHeight * Calendar.ColumnCount
		  
		  CalendarHeader.Top = Calendar.Top - CalendarHeader.Height
		  MonthHeader.Top = CalendarHeader.Top - MonthHeader.Height
		  
		  MonthHeader.Top = 0
		  CalendarHeader.Top = MonthHeader.Height
		  Calendar.Top = CalendarHeader.Top + CalendarHeader.Height
		  'Self.Height = MonthHeader.Height + CalendarHeader.Height + Calendar.Height
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event DateSelected(d As String)
	#tag EndHook


	#tag Property, Flags = &h21
		Private activeColumn As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private activeHeaderColumn As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private activeRow As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private CalendarDate As DateTime
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mCalendarView
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mCalendarView = value
			  SetDimensions
			  Select Case value
			  Case Views.MonthAndDay
			    RefreshCalendar
			  Case Views.Months
			    RefreshCalendarMonths
			  Case Views.Years
			    RefreshCalendarYears
			  End Select
			End Set
		#tag EndSetter
		CalendarView As Views
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private ColorDays() As Color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private hoveredColumn As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private hoveredRow As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCalendarView As Views
	#tag EndProperty

	#tag Property, Flags = &h21
		Private monthInterval As DateInterval
	#tag EndProperty

	#tag Property, Flags = &h21
		Private yearInterval As DateInterval
	#tag EndProperty


	#tag Constant, Name = kPi, Type = Double, Dynamic = False, Default = \"3.14159", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"3.14159"
	#tag EndConstant

	#tag Constant, Name = MonthAndDay, Type = Double, Dynamic = False, Default = \"0", Scope = Private
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"0"
	#tag EndConstant

	#tag Constant, Name = Months, Type = Double, Dynamic = False, Default = \"1", Scope = Private
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"1"
	#tag EndConstant

	#tag Constant, Name = Years, Type = Double, Dynamic = False, Default = \"2", Scope = Private
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"2"
	#tag EndConstant


	#tag Enum, Name = Views, Type = Integer, Flags = &h0
		MonthAndDay
		  Months
		Years
	#tag EndEnum


#tag EndWindowCode

#tag Events Calendar
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  g.AntiAliased = True
		  
		  If row Mod 2 = 0 Then
		    g.DrawingColor = &cFAFAFA
		    g.FillRectangle(-20, -20, g.Width+20, g.Height+20)
		  Else
		    g.DrawingColor = &cffffff
		    g.FillRectangle(-20, -20, g.Width+20, g.Height+20)
		  End If
		  
		  If row < Me.RowCount And column < Me.ColumnCount Then
		    
		    If Me.CellTagAt(row, column) <> Nil Then
		      Dim d as DateTime = Me.CellTagAt(row, column)
		      Var a As New StringShape
		      a.FillColor = &c2D2D2D
		      
		      a.X = g.Width/2
		      a.Y = g.Height/2
		      Select Case CalendarView
		      Case Views.MonthAndDay
		        a.Text = str(d.Day)
		        If d.Month <> CalendarDate.Month Then
		          a.FillOpacity = 50
		          g.DrawingColor = &cFAFAFA
		          g.FillRectangle(-20, -20, g.Width+20, g.Height+20)
		        Else
		          g.DrawingColor = &cFFFFFF 'ColorDays(row) 'd.Day - 1)
		          g.FillRectangle(-20, -20, g.Width+20, g.Height+20)
		          a.Bold = True
		        End If
		        
		        If row = activeRow And column = activeColumn Then
		          a.FillOpacity = 100
		        End If
		      Case Views.Months
		        a.Text = GetMonthYearString(d,True).Left(3)
		        If d.Year = CalendarDate.Year Then
		          a.Bold = True
		        Else
		          a.FillOpacity = 50
		        End If
		      Case Views.Years
		        a.Text = str(d.Year)
		        Dim yrRange as Integer = CalendarDate.Year + 12
		        If d.Year >= CalendarDate.Year and d.Year < yrRange Then
		          a.Bold = True
		        Else
		          a.FillOpacity = 50
		        End If
		      End Select
		      
		      If (isPresentDate(d) And CalendarView = Views.MonthAndDay)  Or _ 
		        (isPresentDate(d,True) And CalendarView = Views.Months) Or _
		        (isPresentDate(d,False) And CalendarView = Views.Years) Then
		        g.DrawingColor = &cD8D8D8
		        '// left border
		        'g.FillRectangle(0, 0, 2, g.Height)
		        '// right border
		        'g.FillRectangle(g.Width - 3, 0, 20, g.Height)
		        '// top 
		        'g.FillRectangle(0, 0, g.Width + 2, 2)
		        '// bottom
		        'g.FillRectangle(0, g.Height - 3, g.Width + 2, 20)
		        Dim ovalSize As Double = Min(g.Width,g.Height) * 0.7
		        Dim x As Double = (g.Width - ovalSize)/2
		        Dim y As Double = (g.Height - ovalSize)/2
		        g.FillOval x,y,ovalSize,ovalSize
		      End If
		      
		      If row = activeRow And column = activeColumn And CalendarView = Views.MonthAndDay Then
		        drawOvalBg(g,False,True)
		        a.FillColor = Color.White
		        a.FillOpacity = 100
		      Elseif row = hoveredRow And column = hoveredColumn Then
		        drawOvalBg(g,True, True)
		        a.FillColor = Color.Black
		      End If
		      
		      a.HorizontalAlignment = StringShape.Alignment.Center
		      a.VerticalAlignment = StringShape.Alignment.Center
		      g.DrawObject(a)
		    End If
		    
		  End If
		  
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  g.DrawingColor = &c000000
		  g.PenSize = 0
		  Return False
		End Function
	#tag EndEvent
	#tag Event
		Function CellClick(row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  If Me.CellTagAt(row,column) = Nil Then Return True
		  
		  Dim d as DateTime = Me.CellTagAt(row,column)
		  Select Case CalendarView
		  Case Views.MonthAndDay
		    
		  Case Views.Months
		    CalendarDate = d
		    CalendarView = Views.MonthAndDay
		    initDayHeader
		    initMonthHeader(False)
		  Case Views.Years
		    CalendarDate = d
		    CalendarView = Views.Months
		    initMonthHeader(False)
		  End Select
		  
		  activeRow = row
		  activeColumn = column
		  Me.Invalidate(False)
		  CalendarHeader.Invalidate(False)
		  
		  'Messagebox("date:  " + Str(d))
		  'RaiseEvent DateSelected(Str(d))
		  
		  Var theDate As String = Str(d.Day) + "." + Str(d.Month) + "." + Str(d.Year)
		  
		  Window1.ShowDate(theDate)
		  CalendarWindow.Close
		  
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  Dim row as Integer = Me.RowFromXY(x,y)
		  Dim column as Integer = Me.ColumnFromXY(x,y)
		  
		  If row <> activeRow Or column <> activeColumn Then
		    hoveredRow = row
		    hoveredColumn = column
		    me.Invalidate(False)
		    CalendarHeader.Invalidate(False)
		  ElseIf row = activeRow Or column = activeColumn Then
		    hoveredRow = -1
		    hoveredColumn = -1
		    me.Invalidate(False)
		    CalendarHeader.Invalidate(False)
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  hoveredRow = -1
		  hoveredColumn = -1
		  Me.Invalidate(False)
		  CalendarHeader.Invalidate(False)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CalendarHeader
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  g.DrawingColor = &cFFFFFF
		  g.FillRectangle(-10, -10, g.Width+10, g.Height+10)
		  
		  If row < Me.RowCount And column < Me.ColumnCount Then
		    If me.ColumnTagAt(column) <> Nil Then
		      Var a As New StringShape
		      a.FillOpacity = 60
		      If column = activeColumn Then
		        g.DrawingColor = &c2A93D5
		        a.FillOpacity = 100
		      ElseIf column <> activeColumn and column <> hoveredColumn Then
		        g.DrawingColor = &cECFAFB
		      ElseIf column = hoveredColumn Then
		        g.DrawingColor = &cADD9D8
		      End If
		      // bottom
		      g.FillRectangle(-10, g.Height - 5, g.Width + 10, 10)
		      
		      a.Bold = True
		      a.FillColor = &c2D2D2D
		      a.X = g.Width/2
		      a.Y = g.Height/2
		      a.Text = me.ColumnTagAt(column)
		      a.HorizontalAlignment = StringShape.Alignment.Center
		      a.VerticalAlignment = StringShape.Alignment.Center
		      g.DrawObject(a)
		    End If
		    
		    
		  End If
		  
		  Return True
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub Open()
		  initDayHeader
		End Sub
	#tag EndEvent
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  g.DrawingColor = &c000000
		  g.PenSize = 0
		  Return False
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events MonthHeader
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  g.DrawingColor = &cFFFFFF
		  'g.DrawingColor = &cFF0000
		  g.FillRectangle(-5, -5, g.Width+10, g.Height+10)
		  
		  If row < Me.RowCount And column < Me.ColumnCount Then
		    If me.ColumnTagAt(column) <> Nil Then
		      Var a As New StringShape
		      a.FillOpacity = 80
		      'if CalendarView = Views.Years then break
		      If column = activeHeaderColumn And Not (column = 1 Or column = 2) _ 
		        And CalendarView <> Views.Years Then
		        g.DrawingColor = &c2A93D5
		        // left border
		        g.FillRectangle(0, 0, 2, g.Height)
		        // right border
		        g.FillRectangle(g.Width - 2.5, 0, 10, g.Height)
		        // top 
		        g.FillRectangle(0, 0, g.Width + 2, 2)
		        // bottom
		        g.FillRectangle(0, g.Height - 2.5, g.Width + 2, 10)
		      End If
		      If column = activeHeaderColumn And CalendarView = Views.Years And column <> 1 Then
		        g.DrawingColor = &c2A93D5
		        // left border
		        g.FillRectangle(0, 0, 2, g.Height)
		        // right border
		        g.FillRectangle(g.Width - 2.5, 0, 10, g.Height)
		        // top 
		        g.FillRectangle(0, 0, g.Width + 2, 2)
		        // bottom
		        g.FillRectangle(0, g.Height - 2.5, g.Width + 2, 10)
		      End If
		      a.TextSize = 18
		      a.Bold = True
		      a.FillColor = &c125488
		      If column = activeHeaderColumn And (column = 1 Or column = 2) _
		        And CalendarView <> Views.Years Then
		        a.FillColor = &c125488
		        a.FillOpacity = 100
		      Elseif CalendarView = Views.Years and activeHeaderColumn = 1 and column = 1 Then
		        a.FillColor = &c125488
		        a.FillOpacity = 100
		      End If
		      a.X = g.Width/2
		      a.Y = g.Height/2
		      a.Text = me.ColumnTagAt(column)
		      a.HorizontalAlignment = StringShape.Alignment.Center
		      a.VerticalAlignment = StringShape.Alignment.Center
		      
		      If CalendarView <> Views.Years Then
		        If column = 1 Then
		          a.X = g.Width * .80
		          a.HorizontalAlignment = StringShape.Alignment.Right
		        ElseIf column = 2 Then
		          a.X = g.Width * .20
		          a.HorizontalAlignment = StringShape.Alignment.Left
		        End If
		      End If
		      
		      g.DrawObject(a)
		    End If
		    
		  End If
		  
		  Return True
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub Open()
		  initMonthHeader(False)
		End Sub
	#tag EndEvent
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  g.DrawingColor = &c000000
		  g.PenSize = 0
		  Return False
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  Dim column as Integer = Me.ColumnFromXY(x,y)
		  
		  activeHeaderColumn = column
		  me.Invalidate(False)
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  activeHeaderColumn = -1
		  Me.Invalidate(False)
		End Sub
	#tag EndEvent
	#tag Event
		Function CellClick(row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  If Me.ColumnTagAt(column) = Nil Then Return True
		  Dim intervals as DateInterval
		  
		  Select Case CalendarView
		  Case Views.MonthAndDay
		    intervals = monthInterval
		  Case Views.Months
		    intervals = yearInterval
		  Case Views.Years
		    intervals = New DateInterval
		    intervals.Years = 10
		  End Select
		  
		  Select Case CalendarView
		  Case Views.MonthAndDay, Views.Months
		    Select Case column
		    Case 0 //Prev
		      CalendarDate = CalendarDate - intervals
		    Case 1  //Month
		      CalendarView = Views.Months
		    Case 2 //Year
		      CalendarView = Views.Years
		    Case 3 //Next
		      CalendarDate = CalendarDate + intervals
		    End Select
		  Case Views.Years
		    Select Case column
		    Case 0 //Prev
		      If CalendarDate.Year - 10 <= 0001 Then
		        CalendarDate = New DateTime(0001, 1, 1)
		      Else
		        CalendarDate = CalendarDate - intervals
		      End If
		    Case 1  //Year
		      CalendarView = Views.Years
		    Case 2 //Next
		      CalendarDate = CalendarDate + intervals
		    End Select
		  End Select
		  
		  
		  Select Case CalendarView
		  Case Views.MonthAndDay
		    intervals = monthInterval
		    RefreshCalendar
		    initMonthHeader(False)
		  Case Views.Months
		    initMonthHeader(False)
		    RefreshCalendarMonths
		  Case Views.Years
		    initMonthHeader(True)
		    RefreshCalendarYears
		  End Select
		  
		  Return True
		End Function
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="InitialParent"
		Visible=false
		Group="Position"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockLeft"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=true
		Group="Position"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Visible=true
		Group="Position"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIndex"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabPanelIndex"
		Visible=false
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabStop"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowAutoDeactivate"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Enabled"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Tooltip"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowFocusRing"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowFocus"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowTabs"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="EraseBackground"
		Visible=false
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Transparent"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DoubleBuffer"
		Visible=true
		Group="Windows Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="CalendarView"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Views"
		EditorType="Enum"
		#tag EnumValues
			"0 - MonthAndDay"
			"1 - Months"
			"2 - Years"
		#tag EndEnumValues
	#tag EndViewProperty
#tag EndViewBehavior
